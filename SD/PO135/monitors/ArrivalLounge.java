package monitors;

import operations.*;
import threads.Passenger;
import utils.Bag;
import utils.Constants;
import enums.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * The Arrival Lounge shared memory region.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class ArrivalLounge implements IArrivalLoungePassenger, IArrivalLoungePorter {

    /**
     * Reentrant lock.
     */
    private final ReentrantLock rl;

    /**
     * Condition to block porter until all passengers exit the plane
     */
    private final Condition waitingPlane;

    /**
     * Condition to block passengers until porter is available again
     */
    private final Condition waitingPorter;
    
    /**
     * Max amount of passengers. Set to {@link utils.Constants#N()} .
     */
    private int maxPassengers;

    /**
     * Passengers that have already arrived at the Arrival Lounge.
     */
    private int passengers = 0;

    /**
     * List of Bags for each flight.
     */
    private List<List<Bag>> bagsPerFlight;

    /**
     * Bags on the current flight. 
     */
    private List<Bag> bags;

    /**
     * Indication if Porte's day is over.
     */
    private Boolean dayEnded = false;

    /**
     * Indication if Porter should continue to collect bags.
     */
    private Boolean collecting = false;

    /**
     * Indication if Porter should continue to collect bags.
     */
    private Boolean porterAvailable = false;

    /**
     * The general repository of information.
     */
    private final Repository repository;

    /**
     * Arrival lounge constructor
     * @param repository General repository of information
     * @param bagsPerFlight List of bags for each flight
     */
    public ArrivalLounge(Repository repository, List<List<Bag>> bagsPerFlight) {
        rl = new ReentrantLock(true);
        waitingPlane = rl.newCondition();
        waitingPorter = rl.newCondition();
        this.maxPassengers = Constants.N();
        this.repository = repository;
        this.bagsPerFlight = bagsPerFlight;
    }

    /**
     * Passenger enters the Arrival Lounge. The last passenger to enter wakes up the porter.
     * @param goHome Passenger situation - True for going home, false otherwise
     * @param flight Flight number
     */
    @Override
    public int whatShouldIDo(Boolean goHome) {
        rl.lock();
        try {

            if(goHome) repository.addFinalDestinations();
            else repository.addTransit();

            while(!porterAvailable)
                waitingPorter.await();

            passengers++;
            if(passengers == 1) repository.startNextFlight(bagsPerFlight.get(0).size());

            Passenger passenger = (Passenger) Thread.currentThread();
            int bags = passenger.getFlightBags();
            repository.passengerInit(PassengerEnum.AT_THE_DISEMBARKING_ZONE, bags, goHome ? "FDT" : "TRF", passenger.getPassengerId());

            if(passengers == maxPassengers) {
                collecting = true;
                passengers = 0;
                waitingPlane.signal();
            }

            return passengers;
            
        } catch(Exception ex) {  
            return 0;   
        } finally {
            rl.unlock();
        }
    }

    /**
     * The porter is waken up by the last passenger to arrive the lounge. It will, then add all bags to the lounge.
     */
    @Override
    public Boolean takeARest() {
        rl.lock();
        try {

            porterAvailable = true;
            waitingPorter.signalAll();

            repository.porterWaitingLanding();
            while(!collecting && !dayEnded) {
                waitingPlane.await();
            }

            bags = new ArrayList<>();
            if(!dayEnded){
                List<Bag> flightBags = bagsPerFlight.remove(0);
                for(int b = 0; b < flightBags.size(); b++) {
                    bags.add(flightBags.get(b));
                    repository.addBag();
                    Collections.shuffle(bags, new Random());
                }
            }
            
            porterAvailable = false;
            collecting = false;
            return !dayEnded;

        } catch(Exception ex) {  
            return true;  
        } finally {
            rl.unlock();
        }
    }

    /**
     * The porter collects a bag. If there are no more bags he collects a null bag, which will then indicate that there are no more bags.
     */
    @Override
    public Bag tryToCollectABag() {
        rl.lock();
        try {

            if(bags.size() > 0){
                Bag result = bags.remove(0);
                repository.porterCollectBag();
                return result;
            } else
                return null;
        } catch(Exception ex) {
            return null;
        }
        finally {
            rl.unlock();
        }
    }

    /**
     * Signals the end of the day for the porter.
     */
    @Override
    public void endWorkDay() {
        rl.lock();
        try {
            dayEnded = true;
            waitingPlane.signal();
        } catch(Exception ex) {
        }
        finally {
            rl.unlock();
        }
    }
    
}
