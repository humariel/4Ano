package threads;

import utils.Bag;
import java.util.Random;

import enums.PorterEnum;
import operations.IArrivalLoungePorter;
import operations.IBaggageCollectionPointPorter;
import operations.ITemporaryStorageAreaPorter;

/**
 * Class to represent a porter.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public class Porter extends Thread {
    
    /**
     * Porter current state
     */
    private PorterEnum state;

    /**
     * Bag the porter is currently moving
     */
    private Bag bag;

    /**
     * Life cycle terminating condition
     */
    private Boolean loop = true;

    /**
     * Random delay to use in thread
     */
    private Random rDelay;


    /**
     * Shared memory region - ArrivalLounge
     */
    private final IArrivalLoungePorter arrivalLounge;

    /**
     * Shared memory region - BaggageCollectionPoint
     */
    private final IBaggageCollectionPointPorter BaggageCollectionPoint;

    /**
     * Shared memory region - TemporaryStorageArea
     */
    private final ITemporaryStorageAreaPorter TemporaryStorageArea;

    

    /**
     * Porter constructor
     * @param delay Seed for random number generation.
     * @param arrivalLounge The arrival lounge shared memory region.
     * @param BaggageCollectionPoint The baggage collection point shared memory region.
     * @param TemporaryStorageArea The temporary storage area shared memory region.
     */
    public Porter(int delay, IArrivalLoungePorter arrivalLounge, IBaggageCollectionPointPorter BaggageCollectionPoint, ITemporaryStorageAreaPorter TemporaryStorageArea) {
        this.state = PorterEnum.WAITING_FOR_A_PLANE_TO_LAND;
        this.arrivalLounge = arrivalLounge;
        this.BaggageCollectionPoint = BaggageCollectionPoint;
        this.TemporaryStorageArea = TemporaryStorageArea;
        rDelay = new Random(delay);
    }
    
    /**
     * Porter life-cycle
     * The porter starts at WAITING_FOR_A_PLANE_TO_LAND. He will stay in this state until a plane arrives
     * (signaled by the last passenger of the flight entering the arrival lounge) or when his day of work 
     * ended (both evaluated at takeARest). In this last case, he will finish his life-cycle. In the first 
     * case he will transition to AT_THE_PLANES_HOLD. Here he tries to collect a bag. If he fails to do so,
     * then there are no more bags to collect and he will go back to WAITING_FOR_A_PLANE_TO_LAND. He he does
     * collect a bag though, he will carry it to it's appropriate location. If the bag belongs to a passenger
     * that is going home he changes to AT_THE_LUGGAGE_BELT_CONVEYOR, where he will place the bag and then go
     * back to AT_THE_PLANES_HOLD. If the collected bag belonged to a passenger in transit though, he will 
     * change to AT_THE_STOREROOM, where he'll place the collected bag. He then return to AT_THE_PLANES_HOLD,
     * to try to collecct more bags.
     */
    @Override
    public void run() {
        
        Random r = new Random();
        while (loop) {
            switch(state) {

                case WAITING_FOR_A_PLANE_TO_LAND:
                    System.out.println("PORTEIRO A ESPERAR POR AVIAO");
                    if(arrivalLounge.takeARest()) {
                        state = PorterEnum.AT_THE_PLANES_HOLD;
                    } else {
                        loop = false;
                    }
                    break;

                case AT_THE_PLANES_HOLD:
                    bag = arrivalLounge.tryToCollectABag();
                    if(bag == null) {
                        System.out.println("PORTEIRO JÁ CARREGOU AS MALAS TODAS");
                        BaggageCollectionPoint.noMoreBagsToCollect();
                        state = PorterEnum.WAITING_FOR_A_PLANE_TO_LAND;
                    } else {
                        state = bag.getDestination().equals("H") ? PorterEnum.AT_THE_LUGGAGE_BELT_CONVEYOR : PorterEnum.AT_THE_STOREROOM; 
                    } 
                    break;

                case AT_THE_LUGGAGE_BELT_CONVEYOR:
                    System.out.println("PORTEIRO A CARREGAR MALA PARA A MESA: " + bag);
                    BaggageCollectionPoint.carryBagToLuggagePoint(bag);
                    state = PorterEnum.AT_THE_PLANES_HOLD;
                    break;

                case AT_THE_STOREROOM:
                    System.out.println("PORTEIRO A CARREGAR MALA PARA ESPAÇO TEMPORARIO: " + bag);
                    TemporaryStorageArea.carryBagToTemporaryStorage(bag);
                    state = PorterEnum.AT_THE_PLANES_HOLD;
                    break;

                default:

            }
            try {
                Thread.sleep(rDelay.nextInt(10));
            } catch (Exception e) {}

        }
        
        System.out.println("PORTEIRO A SAIR DA THREAD");

    }

    /**
     * String representation of the Porter.
     */
    @Override
    public String toString() {
        return  String.format("Porteiro no estado %s | %s", state, super.toString());
    }
    
    
}