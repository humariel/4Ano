package operations;
import java.util.Set;

import utils.Bag;

/**
 * Baggage Collection Point interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public interface IBaggageCollectionPointPassenger {

    /**
     * @see monitors.BaggageCollectionPoint#goCollectABag(Set)
     */
    Bag goCollectABag(Set<String> passengerBags);

    /**
     * @see monitors.BaggageCollectionPoint#resetState()
     */
    void resetState();
}