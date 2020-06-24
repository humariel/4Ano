package operations;
import utils.Bag;

/**
 * Arrival Lounge interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IArrivalLoungePassenger {

    /**
     * @see monitors.ArrivalLounge#whatShouldIDo()
     */
    int whatShouldIDo(Boolean goHome);

    /**
     * @see monitors.ArrivalLounge#endWorkDay()
     */
    void endWorkDay();
}