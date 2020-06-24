package operations;
import utils.Bag;

/**
 * Temporary Storage Area interface for the porter.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface ITemporaryStorageAreaPorter {

    /**
     * @see monitors.TemporaryStorageArea#carryBagToTemporaryStorage(Bag)
     */
    void carryBagToTemporaryStorage(Bag bag);
}