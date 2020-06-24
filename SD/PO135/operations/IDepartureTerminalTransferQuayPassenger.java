package operations;

/**
 * Departure Terminal Tranfer Quay interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IDepartureTerminalTransferQuayPassenger {

    /**
     * @see monitors.DepartureTerminalTransferQuay#waitRide()
     */
    void waitRide();

    /**
     * @see monitors.DepartureTerminalTransferQuay#leaveTheBus()
     */
    void leaveTheBus();
}