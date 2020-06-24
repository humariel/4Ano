package enums;

/**
 * Class with the states the bus driver goes through in his life cycle.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public enum BusDriverEnum {

	/**
	 * Double blocking state (initial / final state) <p/>
	 * 
	 * The driver is waken up the first time by the operation takeABus of the passenger who arrives at the transfer terminal and finds out his/her <br/>
	 * place in the waiting queue is the last, or when the departure time has been reached. The driver is waken up the second time by the operation <br/>
	 * enterTheBus of the last passenger to enter the bus.<p/>
	 */
	PARKING_AT_THE_ARRIVAL_TERMINAL,

	/**
	 * Transition state <p/>
	 * 
	 * Used when bus driver transports passengers from arrival terminal to deprature terminal.<p/>
	 */
	DRIVING_FORWARD,

	/**
	 * Blocking state <p/>
	 * 
	 * The driver is waken up by the operation leaveTheBus of the last passenger to exit the bus.<p/>
	 */
	PARKING_AT_THE_DEPARTURE_TERMINAL,

	/**
	 * Transition state <p/>
	 * 
	 * Used when bus driver is going back to the arrival terminal.<p/>
	 */
	DRIVING_BACKWARD;
}
