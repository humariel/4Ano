package monitors;
import operations.*;
import threads.Passenger;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Departure Terminal Tranfer Quay shared memory region
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class DepartureTerminalTransferQuay implements IDepartureTerminalTransferQuayPassenger, IDepartureTerminalTransferQuayBusdriver {

    /**
     * Reentrant lock
     */
    private final ReentrantLock rl;
    /**
     * Condition to block passengers while being transported in the bus.
     */
    private final Condition waitingRide;

    /**
     * Condition to block bus driver until all passengers inside have left the bus after the ride.
     */
    private final Condition waitingEmpty;
    
    /**
     * Passengers in the tranfer quay
     */
    private int passengers = 0;
    /**
     * Amount of passengers leaving
     */
    private int passengersToLeave;
    /**
     * Indication that bus is moving
     */
    private Boolean riding = true;
    /**
     * General repository of information
     */
    private Repository repository;

    /**
     * Departure Terminal Tranfer Quay constructor.
     * @param repository General repository of information.
     */
    public DepartureTerminalTransferQuay(Repository repository) {
        rl = new ReentrantLock(true);
        waitingRide = rl.newCondition();
        waitingEmpty = rl.newCondition();
        this.repository = repository;
    }

    /**
     * The bus ride. Passengers are waken up when bus driver starts parking.
     */
    @Override
    public void waitRide() {
        rl.lock();
        try {
            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passBusRide(passenger.getPassengerId());

            while(riding == true) {
                waitingRide.await();
            }
        } catch(Exception ex) {}
        finally {
            rl.unlock();
        }
    }

    /**
     * Bus driver wakes passengers so they leave and after waits for all of them to leave.
     * @param passengersToLeave Number of passengers supposed to leave bus.
     */
    @Override
    public void parkTheBusAndLetPassOff(int passengersToLeave) {
        rl.lock();
        try {
            repository.driverParkingDepartureTerminal();

            riding = false;
            this.passengersToLeave = passengersToLeave;
            waitingRide.signalAll();
            while(passengers != passengersToLeave) {
                waitingEmpty.await();
            }
            passengers = 0;
            riding = true;
            repository.driverDrivingBackward();
        } catch(Exception ex) {}
        finally {
            rl.unlock();
        }
    }

    /**
     * Passenger leaves the bus. After all passengers left, they wake the bus driver.
     */
    @Override
    public void leaveTheBus() {
        rl.lock();
        try {
            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passLeaveBus(passenger.getPassengerId());

            passengers++;
            if(passengers == passengersToLeave) {
                waitingEmpty.signal();
            }
        } catch(Exception ex) {}
        finally {
            rl.unlock();
        }
    }

}
