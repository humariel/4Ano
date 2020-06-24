package operations;
import utils.Bag;

/**
 * Baggage Collection Point interface for the porter.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IBaggageCollectionPointPorter {

    /**
     * @see monitors.BaggageCollectionPoint#carryBagToLuggagePoint(Bag)
     */
    void carryBagToLuggagePoint(Bag b);

    /**
     * @see monitors.BaggageCollectionPoint#noMoreBagsToCollect()
     */
    void noMoreBagsToCollect();
}