package monitors;

import operations.*;
import threads.Passenger;
import utils.Bag;

import java.util.List;
import java.util.Set;
import java.util.ArrayList;

import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.Condition;

/**
 * Baggage Collection Point shared memory region.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class BaggageCollectionPoint implements IBaggageCollectionPointPassenger, IBaggageCollectionPointPorter {

    /**
     * Reentrant lock.
     */
    private final ReentrantLock rl;
    
    /**
     * Condition to lock the passengers until the porter places a bag in the belt or there are no more bags to collect
     */

    private final Condition waitingBag;
    /**
     * List of bags in baggage colleciton point.
     */
    private List<Bag> bags;

    /**
     * Indication that that are no more bags to collect.
     */
    private Boolean noMoreBags = false;

    /**
     * Repository
     */
    private Repository repository; 

    /**
     * Baggage Collection Point constructor.
     * @param repository General repository of information.
     */
    public BaggageCollectionPoint(Repository repository) {
        rl = new ReentrantLock(true);
        waitingBag = rl.newCondition();
        bags = new ArrayList<>();
        this.repository = repository;
    }

    /**
     * Passenger collects a bag from the baggage collection point.
     * Passengers wait until there are bags in the collection point. They area waken up by the porter, when he puts a bag in the collection point
     * or when there are no more bags.
     * @param passengerBags The bags the passenger owns.
     */
    @Override
    public Bag goCollectABag(Set<String> passengerBags) {
        rl.lock();
        try {
            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passEnterLuggageCollectionPoint(passenger.getPassengerId());
            while(!noMoreBags) {
                for(int i = 0; i < bags.size(); i++) {
                    if(passengerBags.contains(bags.get(i).getId())) {
                        repository.passCollectBag(passenger.getPassengerId());
                        Bag bag = bags.remove(i);
                        return bag;
                    }
                }
                waitingBag.await();
            }
            return null;
        } catch(Exception ex) {
            return null;
        } finally {
            rl.unlock();
        }
    }

    /**
     * Wakes passengers that are waiting for bags, when there are no more bags.
     */
    @Override
    public void noMoreBagsToCollect() {
        rl.lock();
        try {
            repository.porterNoMoreBags();
            noMoreBags = true;
            waitingBag.signalAll();
        } catch(Exception ex) {
        } finally {
            rl.unlock();
        }
    }

    /**
     * Porter carries a bag to the collection point. Wakes up passengers waiting for bags.
     * @param bag A bag.
     */
    @Override
    public void carryBagToLuggagePoint(Bag bag) {
        rl.lock();
        try {
            bags.add(bag);
            repository.porterMoveBagToConveyorBelt();
            noMoreBags = false;
            waitingBag.signalAll();
        } catch(Exception ex) {
        } finally {
            rl.unlock();
        }
    }

    @Override
    public void resetState() {
        rl.lock();
        try {
            noMoreBags = false;
        } catch(Exception ex) {
        } finally {
            rl.unlock();
        }
    }

    
}
