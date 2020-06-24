package utils;

/**
 * Class with constant values of the problem.
 */
public class Constants{

    /**
	 * Number of flights
	 */
	private static int K = 5;

	/**
	 * Number of passengers on each flight
	 */
	private static int N = 6;

	/**
	 * Number of maximum bags per passenger
	 */
	private static int M = 2;

	/**
	 * Maximum seats in the bus
	 */
    private static int T = 3;
    
    /**
     * 
     * @return The number of flights.
     */
    public static int K(){
        return K;
    }

    /**
     * 
     * @return The number of passengers on each flight.
     */
    public static int N(){
        return N;
    }

    /**
     * 
     * @return The number of maximum bags per passenger.
     */
    public static int M(){
        return M;
    }

    /**
     * 
     * @return The number maximum number of seats in the bus.
     */
    public static int T(){
        return T;
    }
    
    
    public static void setK(int val){
        K = val;
    }

    public static void setN(int val){
        N = val;
    }

    public static void setM(int val){
        M = val;
    }

    public static void setT(int val){
        T = val;
    }
}