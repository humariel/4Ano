package enums;

/**
 * Class with the states the passengers go through in their life cycles.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public enum PassengerEnum {

	/**
	 * Transition state (intial state) <p/>
	 * 
	 * Passenger just arrived at the airport and will go home/board next flight.<p/>
	 */
	AT_THE_DISEMBARKING_ZONE,

	/**
	 * Blocking state with eventual transition <p/>
	 * 
	 * Passenger is waken up when the porter places a bag owned by the passenger in the conveyor belt or when the porter <br/>
	 * singals that there are no more bags. Passenger transitions either when there are no more bags (again signaled by the porter) <br/>
	 * or when the passenger already has all his/her bags. <p/>
	 */
	AT_THE_LUGGAGE_COLLECTION_POINT,

	/**
	 * Transtion state <p/>
	 * 
	 * Used when passenger is at the reclaim office to make a complaint, after having lost one or more bags. <p/>
	 */
	AT_THE_BAGGAGE_RECLAIM_OFFICE,

	/**
	 * Blocking state with eventual transition (final state) <p/>
	 * 
	 * The passenger is waken up by last passenger of each flight to exit the arrival terminal or to enter the departure terminal.<p/>
	 */
	EXITING_THE_ARRIVAL_TERMINAL,

	/**
	 * Blocking state <p/>
	 * 
	 * Before blocking, the passenger wakes up the bus driver if the passenger fills the bus queue. <p/>
	 * The passenger is then waken up by the bus driver to enter the bus. </p>
	 */
	AT_THE_ARRIVAL_TRANSFER_TERMINAL,

	/**
	 * Blocking state <p/>
	 * 
	 * Waken up by the bus driver when the bus arrives at the departure terminal. <p/>
	 */
	TERMINAL_TRANSFER,

	/**
	 * Transition state <p/>
	 * 
	 * Used when passenger has left the bus and is going to the departure terminal. <p/>
	 */
	AT_THE_DEPARTURE_TRANSFER_TERMINAL,

	/**
	 * Blocking state with eventual transition (final state) <p/>
	 * 
	 * The passenger is waken up by last passenger of each flight to exit the arrival terminal or to enter the departure terminal.<p/>
	 */
	ENTERING_THE_DEPARTURE_TERMINAL,
	WAITING_END;
}
