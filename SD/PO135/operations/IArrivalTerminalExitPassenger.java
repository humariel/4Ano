package operations;

/**
 * Arrival Terminal Exit interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IArrivalTerminalExitPassenger {

    /**
     * @see monitors.ArrivalTerminalExit#goHome(int)
    */
    boolean goHome(int preparing);

    /**
     * @see monitors.ArrivalTerminalExit#passengersGoingHome()
    */
    int passengersGoingHome();

    /**
     * @see monitors.ArrivalTerminalExit#wakePassengers()
    */
    void wakePassengers();

    /**
     * @see monitors.ArrivalTerminalExit#increment()
    */
    void increment();
}