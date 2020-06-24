package operations;
import utils.Bag;

/**
 * Arrival Lounge interface for the porter.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IArrivalLoungePorter {

    /**
     * @see monitors.ArrivalLounge#takeARest()
     */
    Boolean takeARest();

    /**
     * @see monitors.ArrivalLounge#tryToCollectABag()
     */
    Bag tryToCollectABag();
}