package operations;

/**
 * Departure Terminal Entrance interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IDepartureTerminalEntrancePassenger {

    /**
     * @see monitors.DepartureTerminalEntrance#prepareNextLeg(int)
     */
    boolean prepareNextLeg(int goingHome);

    /**
     * @see monitors.DepartureTerminalEntrance#passengersPreparingNextLeg()
     */
    int passengersPreparingNextLeg();

    /**
     * @see monitors.DepartureTerminalEntrance#wakePassengers()
     */
    void wakePassengers();
    
    /**
     * @see monitors.DepartureTerminalEntrance#increment()
     */
    void increment();
}