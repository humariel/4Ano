package operations;

/**
 * Arrival Terminal Transfer Quay interface for the bus driver.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IArrivalTerminalTransferQuayBusdriver {

    /**
     * @see monitors.ArrivalTerminalTransferQuay#hasDaysWorkEnded()
     */
    String hasDaysWorkEnded();

    /**
     * @see monitors.ArrivalTerminalTransferQuay#waitForPassengersToEnter()
     */
    int waitForPassengersToEnter();
}