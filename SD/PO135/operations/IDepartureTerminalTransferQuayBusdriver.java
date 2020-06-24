package operations;

/**
 * Departure Terminal Tranfer Quay interface for the bus driver.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IDepartureTerminalTransferQuayBusdriver {
    
    /**
     * @see monitors.DepartureTerminalTransferQuay#parkTheBusAndLetPassOff(int)
     */
    void parkTheBusAndLetPassOff(int passengersToLeave);
}