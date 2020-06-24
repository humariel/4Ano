package operations;

import java.util.Set;

/**
 * Baggage Reclaim Office interface for the passenger.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public interface IBaggageReclaimOfficePassenger {

    /**
     * @see monitors.BaggageReclaimOffice#complain(Set)
     */
    void complain(Set<String> bags);
}