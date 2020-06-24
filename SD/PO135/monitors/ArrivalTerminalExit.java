package monitors;

import operations.*;
import threads.Passenger;
import utils.Constants;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class ArrivalTerminalExit implements IArrivalTerminalExitPassenger {

    /**
     * Reentrant lock.
     */
    private final ReentrantLock rl;

    /**
     * Condition to block passengers until all passengers end their trip
     */
    private final Condition waitingEnd;

    /**
     * Number of passangers on the flight
     */
    private int nrPassengers;

    /**
     * Current number of passengers going home
     */
    private int passengersGoingHome = 0;

    /**
     * Indication if passanger should wait
     */
    private Boolean waiting = true;
    
    /**
     * Repository
     */
    private Repository repository;

    // create lock and conditions
    public ArrivalTerminalExit(Repository repository) {
        rl = new ReentrantLock(true);
        waitingEnd = rl.newCondition();
        this.nrPassengers = Constants.N();
        this.repository = repository;
    }

    /**
     * Increments the number of passengers going home
     */
    @Override
    public void increment() {
        rl.lock();
        waiting = true;
        passengersGoingHome++;
        rl.unlock();
    }

    /**
     * Returns the number of passengers going home
     */
    @Override
    public int passengersGoingHome() {
        rl.lock();
        int passengers = passengersGoingHome;
        rl.unlock();
        return passengers;
    }

    /**
     * Checks if it's the last passenger, if it is wakes up the rest of passengers going home and returns true
     * If not it waits for the last passenger to end it's trip
     */
    @Override
    public boolean goHome(int preparing) {
        rl.lock();
        try {

            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passGoHome(passenger.getPassengerId());

            boolean lastPassenger = preparing + passengersGoingHome == nrPassengers;

            if(lastPassenger) {
                waiting = false;
                waitingEnd.signalAll();
            }

            while(waiting) {
                waitingEnd.await();
            }

            passengersGoingHome--;
            
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
