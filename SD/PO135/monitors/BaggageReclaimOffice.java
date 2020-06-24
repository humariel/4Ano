package monitors;

import operations.*;
import threads.Passenger;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import java.util.concurrent.locks.ReentrantLock;

/**
 * Baggage Reclaim Office shared memory region.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */
public class BaggageReclaimOffice implements IBaggageReclaimOfficePassenger {

    /**
     * Reentrant lock
     */
    private final ReentrantLock rl;
    
    /**
     * List of bag id's that were lost.
     */
    
    private List<String> bags;

    /**
     * General repository of information.
     */
    private Repository repository;

    /**
     * Baggage Reclaim Office constructor.
     * @param repository General repository of information.
     */
    public BaggageReclaimOffice(Repository repository){
        rl = new ReentrantLock(true);
        bags = new ArrayList<>();
        this.repository = repository;
    }

    /**
     * Makes a complaint.
     * @param bags Set of bags lost.
     */
    @Override
    public void complain(Set<String> bags) {
        rl.lock();
        try {
            Passenger passenger = (Passenger) Thread.currentThread();
            repository.passComplain(passenger.getPassengerId());

            for(String b : bags) {
                this.bags.add(b);
            }
        } catch(Exception ex) {
        } finally {
            rl.unlock();
        }
    }
    
}
