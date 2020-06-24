package monitors;

import operations.*;
import threads.Passenger;
import utils.Constants;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Departure Terminal Entrance shared memory region
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class DepartureTerminalEntrance implements IDepartureTerminalEntrancePassenger {

    /**
     * Reentrant lock.
     */
    private final ReentrantLock rl;

    /**
<<<<<<< HEAD
     * Condition to wait until all passangers ended their travel
=======
     * Condition to block passengers until all of them have either gone home/checked-in.
>>>>>>> 5a8b18343d961876ee25e5b6a7d12581ad713b59
     */
    private final Condition waitingEnd;

    /**
     * Maximum number of passengers. Initialized to {@link utils.Constants#N()} .
     */
    private int nrPassengers;

    /**
     * Current number of passengers preparing for next leg
     */
    private int passengers = 0;

    /**
     * Indication if passanger should wait
     */
    private Boolean waiting = true;
    
    /**
     * Repository
     */
    private Repository repository;

    // create lock and conditions
    public DepartureTerminalEntrance(Repository repository) {
        rl = new ReentrantLock(true);
        waitingEnd = rl.newCondition();
        this.nrPassengers = Constants.N();
        this.repository = repository;
    }

    /**
     * Increments the number of passengers preparing for next leg
     */
    @Override
    public void increment() {
        rl.lock();
        waiting = true;
        passengers++;
        rl.unlock();
    }

    /**
     * Returns the number of passengers preparing for next leg
     */
    @Override
    public int passengersPreparingNextLeg() {
        rl.lock();
        int passengers = this.passengers;
        rl.unlock();
        return passengers;
    }

    /**
     * Checks if it's the last passenger, if it is wakes up the rest of passengers preparing for next leg and returns true
     * If not it waits for the last passenger to end it's trip
     */
    @Override
    public boolean prepareNextLeg(int goingHome) {
        rl.lock();
        try {

            boolean lastPassenger = goingHome + passengers == nrPassengers;

            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passPrepareNextLeg(passenger.getPassengerId());

            if(lastPassenger) {
                waiting = false;
                waitingEnd.signalAll();
            }

            while(waiting) {
                waitingEnd.await();
            }

            passengers--;

            return lastPassenger;

        } catch(Exception ex) {
            return false;
        }
        finally {
            rl.unlock();
        }
    }

    /**
     * Wakes up passengers waiting for the last one to end it's trip
     */
    @Override
    public void wakePassengers() {
        rl.lock();
        waiting = false;
        waitingEnd.signalAll();
        rl.unlock();
    }
    
}
