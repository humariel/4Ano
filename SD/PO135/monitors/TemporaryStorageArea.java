package monitors;

import operations.*;
import utils.Bag;

import java.util.List;
import java.util.ArrayList;

import java.util.concurrent.locks.ReentrantLock;

/**
 * Temporary Storage Area shared memory region
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class TemporaryStorageArea implements ITemporaryStorageAreaPorter{

    /**
     * Reentrant lock.
     */
    private final ReentrantLock rl;

    /**
     * List of bags in the temporary storage.
     */
    private List<Bag> bags;

    /**
     * General repository of information.
     */
    private Repository repository;

    /**
     * Temporary Storage Area constructor
     */
    public TemporaryStorageArea(Repository repository) {
        rl = new ReentrantLock(true);
        bags = new ArrayList<>();
        this.repository = repository;
    }

    /**
     * Adds a bag to the list of bags in the storage temporary area.
     */
    @Override
    public void carryBagToTemporaryStorage(Bag bag) {
        rl.lock();
        try {
            bags.add(bag);
            repository.porterMoveBagToStoreroom();
        } catch(Exception ex) {
        }
        finally {
            rl.unlock();
        }
    }
    
}
