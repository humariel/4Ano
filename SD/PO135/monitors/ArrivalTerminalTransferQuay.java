package monitors;
import operations.*;
import threads.BusDriver;
import threads.Passenger;
import utils.Constants;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Arrival Terminal Tranfer Quay shared memory region
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class ArrivalTerminalTransferQuay implements IArrivalTerminalTransferQuayPassenger, IArrivalTerminalTransferQuayBusdriver {

    /**
     * Reentrant lock
     */
    private final ReentrantLock rl;

    /**
     * Condition to block the busdriver until the number of passengers queueing for the bus is equal to the bus size
     * Or until it's the scheduled time to leave and there is at least one passenger
     */
    private final Condition waitingFull; 
    
    /**
     * Condition to block a passenger queueing for the bus until the busdriver announces him to enter
     */
    private final Condition waitingAnnouncment;

    /**
     * Condition to block the busdriver until all the signaled passengers enter the bus
     */
    private final Condition waitingEnter;

    /**
     * Indication that the driver day ended.
     */
    private boolean dayEnded = false;
    
    /**
     * Amount of passengers that need to enter the bus.
     */
    private int passengersToEnter = 0;
    
    /**
     * List of passengers in the waiting line.
     */
    private List<Integer> passengerQueue;
    
    /**
     * Lis tof passengers inside the bus.
     */
    private List<Integer> insidePassengers;
    
    /**
     * Indication that the bus is ready to travel.
     */
    private Boolean busTravelling;
    
    /**
     * The bus size. Initialized to {@link utils.Constants#T()} .
     */
    private int busSize;

    /**
     * General repository of information.
     */
    private Repository repository;

    // create lock and conditions
    /**
     * Arrival Terminal Tranfer Quay constructor
     * @param repository General repository of information
     */
    public ArrivalTerminalTransferQuay(Repository repository) {
        rl = new ReentrantLock(true);

        passengerQueue = new ArrayList<>();
        insidePassengers = new ArrayList<>();
        busTravelling = false;

        waitingEnter = rl.newCondition();
        waitingAnnouncment = rl.newCondition();
        waitingFull = rl.newCondition();
        this.busSize = Constants.T();

        this.repository = repository;
    }

    /**
     * Passenger enters the bus waiting line. The passenger that fills the line wakes the driver.
     * The passenger is then waken up by the driver when he announces the ride will start.
     * @param id Id of the passenger.
     */
    @Override
    public void takeABus(int id) {
        rl.lock();
        try {

            passengerQueue.add(id);

            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passJoinBusQueue(passenger.getPassengerId());

            if(passengerQueue.size() == busSize)
                waitingFull.signal();

            while((busTravelling && passengerQueue.contains(id)) || passengerQueue.contains(id))
                waitingAnnouncment.await();
            
            if(passengerQueue.size() == busSize)
                waitingFull.signal();
                 
        } catch(Exception ex) {}
        finally {
            rl.unlock();
        }
    }

    /**
     * Passenger enters the bus. The lsat passenger that was in line wakes up the driver.
     * @param id Id of the passenger to enter bus.
     */
    @Override
    public void enterTheBus(int id) {
        rl.lock();
        try {
            insidePassengers.add(id);

            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passSitInBus(passenger.getPassengerId());

            if (insidePassengers.size() == passengersToEnter) {
                waitingEnter.signal();
            }
        } catch(Exception ex) {}
        finally {
            rl.unlock();
        }
    }

    /**
     * Driver wakes passengers in waiting line. It will then leave, in case it isn't full but it's time to leave on the schedule.
     * Also indicates if the day is over.
     */
    @Override
    public String hasDaysWorkEnded() {
        rl.lock();
        try {

            int count = 0;
            busTravelling = false;

            repository.driverParkingArrivalTerminal();

            if(passengerQueue.size() > 0) {
                waitingAnnouncment.signalAll();
            } 

            while(passengerQueue.size() != busSize && !dayEnded) {
                waitingFull.awaitNanos(10 * 1000000);
                count++;
                if(count > 10 && passengerQueue.size() > 0)
                    break;
            }
            return dayEnded ? "E" : "W";
            
        } catch(Exception ex) {
            return "S";
        }
        finally {
            rl.unlock();
        }
    }

    /**
     * Driver wakes passenger in waiting line and then waits for all of them to enter
     */
    @Override
    public int waitForPassengersToEnter() {
        rl.lock();
        try {
            busTravelling = true;
            passengersToEnter = passengerQueue.size() > busSize ? busSize : passengerQueue.size();
            insidePassengers.clear();
            System.out.println("A ANUNCIAR");
            for(int i = 0; i < busSize && passengerQueue.size() > 0; i++) {
                passengerQueue.remove(0);
                waitingAnnouncment.signal();
            }
            while(insidePassengers.size() != passengersToEnter) {
                waitingEnter.await();
            }

            if(insidePassengers.size() > 0)
                repository.driverDrivingForward();

            return insidePassengers.size();
        } catch(Exception ex) {
            System.out.println(ex);
            return 0;
        }
        finally {
            rl.unlock();
        }
    }

    /**
     * Method that sets the day as over for the bus driver.
     */
    @Override
    public void endWorkDay() {
        rl.lock();
        dayEnded = true;
        waitingFull.signal();
        rl.unlock();
    }
    
}
