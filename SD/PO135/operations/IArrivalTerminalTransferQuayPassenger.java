package operations;

/**
 * Arrival Terminal Transfer Quay interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IArrivalTerminalTransferQuayPassenger {

    /**
     * @see monitors.ArrivalTerminalTransferQuay#takeABus(int)
     */
    void takeABus(int id);

    /**
     * @see monitors.ArrivalTerminalTransferQuay#enterTheBus(int)
     */
    void enterTheBus(int id);

    /**
     * @see monitors.ArrivalTerminalTransferQuay#enterTheBus(int)
     */
    void endWorkDay();
}