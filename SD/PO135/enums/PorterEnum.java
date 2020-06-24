package enums;

/**
 * Class with the states the Porter goes through in his life cycle.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public enum PorterEnum {

	/**
	 * Blocking state (initial / final state) <p/>
	 * 
	 * The porter is waken up by the operation whatShouldIDo of the last passenger to reach the arrival lounge. <p/>
	 */
	WAITING_FOR_A_PLANE_TO_LAND,

	/**
	 * Transition state <p/>
	 * 
	 * Used when porter is taking luggage from the plane.<p/>
	 */
	AT_THE_PLANES_HOLD,

	/**
	 * Transition state <p/>
	 * 
	 * Used when porter places the luggage from the plane on the convyeor belt.<p/>
	 */
	AT_THE_LUGGAGE_BELT_CONVEYOR,

	/**
	 * Transition state <p/>
	 * 
	 * Used when porter places the luggage from the plane on the temporary storeroom.<p/>
	 */
	AT_THE_STOREROOM;
}
