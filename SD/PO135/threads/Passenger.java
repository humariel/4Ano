package threads;

import utils.Constants;
import utils.Bag;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import java.util.List;

import enums.PassengerEnum;
import operations.*;

/**
 * Class to represent a passenger
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public class Passenger extends Thread {
    
    /**
     * Passenger's id
     */
    private int id;

    /**
     * Current flight
     */
    private int run;

    /**
     * Current state of the passenger
     */
    private PassengerEnum state;
    private int nrVoos;

    /**
     * Array containing the passenger's bags
     */
    private Bag[] bags;

    /**
     * Set of bags yet to collect by the passenger
     */
    private Set<String> ownBags;

    /**
     * Destination of passenger for each flight
     */
    private String[] flightsDestination;

    /**
     * Bags of passenger for each flight
     */
    private List<List<Bag>> flightsBags;

    /**
     * Random delay to use in thread
     */
    private Random rDelay;

    /**
     * Shared memory region - ArrivalLounge
     */
    private final IArrivalLoungePassenger arrivalLounge;

    /**
     * Shared memory region - BaggageCollectionPoint
     */
    private final IBaggageCollectionPointPassenger baggageCollectionPoint;

    /**
     * Shared memory region - ArrivalTerminalTransferQuay
     */
    private final IArrivalTerminalTransferQuayPassenger arrivalTerminalTransferQuay;

    /**
     * Shared memory region - DepartureTerminalTransferQuay
     */
    private final IDepartureTerminalTransferQuayPassenger departureTerminalTransferQuay;

    /**
     * Shared memory region - ArrivalTerminalExit
     */
    private final IArrivalTerminalExitPassenger arrivalTerminalExit;

    /**
     * Shared memory region - DepartureTerminalEntrance
     */
    private final IDepartureTerminalEntrancePassenger departureTerminalEntrance;

    /**
     * Shared memory region - BaggageReclaimOffice
     */
    private final IBaggageReclaimOfficePassenger baggageReclaimOffice;

    
    /**
     * Passenger constructor
     * @param id
     * @param nrVoos
     * @param seed
     * @param arrivalLounge
     * @param baggageCollectionPoint
     * @param arrivalTerminalTransferQuay
     * @param departureTerminalTransferQuay
     * @param arrivalTerminalExit
     * @param departureTerminalEntrance
     * @param baggageReclaimOffice
     */
    public Passenger(int id, int seed, String[] flightsDestination, List<List<Bag>> flightsBags, IArrivalLoungePassenger arrivalLounge, IBaggageCollectionPointPassenger baggageCollectionPoint, IArrivalTerminalTransferQuayPassenger arrivalTerminalTransferQuay, IDepartureTerminalTransferQuayPassenger departureTerminalTransferQuay, IArrivalTerminalExitPassenger arrivalTerminalExit, IDepartureTerminalEntrancePassenger departureTerminalEntrance, IBaggageReclaimOfficePassenger baggageReclaimOffice) {
        this.id = id;
        this.nrVoos = Constants.K();
        rDelay = new Random(seed);
        this.state = PassengerEnum.AT_THE_DISEMBARKING_ZONE;
        this.arrivalLounge = arrivalLounge;
        this.baggageCollectionPoint = baggageCollectionPoint;
        this.arrivalTerminalTransferQuay = arrivalTerminalTransferQuay;
        this.departureTerminalTransferQuay = departureTerminalTransferQuay;
        this.arrivalTerminalExit = arrivalTerminalExit;
        this.departureTerminalEntrance = departureTerminalEntrance;
        this.baggageReclaimOffice = baggageReclaimOffice;
        this.flightsDestination = flightsDestination;
        this.flightsBags = flightsBags;
    }

    /**
     * Getter for the passenger's id.
     * @return The passenger's id.
     */
    public int getPassengerId() {
        return this.id;
    }

    /**
     * Getter for the current flight bags.
     * @return The current flight bags.
     */
    public int getFlightBags() {
        return flightsBags.get(run).size();
    }

    /**
     * The lifecycle of the passenger starts AT_THE_DISEMBARKING_ZONE, where he decides where to go next
     * if he decides to go home, he goes to THE_ARRIVAL_TERMINAL if he doesn't have any bags to collect,
     * otherwise he moves to THE_LUGGAGE_COLLECTION_POINT. If he has another flight to catch, he moves to ARRIVAL_TRANSFER_TERMINAL.
     * At THE_LUGGAGE_COLLECTION_POINT, the passenger will be waiting until the porter puts all of his bags
     * in the luggage belt, or until there are no more bags to collect. If he ends up with bags to collect he goes 
     * to THE_BAGGAGE_RECLAIM_OFFICE, otherwise he goes to THE_ARRIVAL_TERMINAL.
     * At THE_BAGGAGE_RECLAIM_OFFICE, the passenger reclaims the bags he as lost, and moves to THE_ARRIVAL_TERMINAL.
     * At the ARRIVAL_TRANSFER_TERMINAL, the passenger will queue for the bus and eventully enter it when it his turn. He then
     * goes to the TERMINAL_TRANSFER until the ride is over, and moves to THE_DEPARTURE_TRANSFER_TERMINAL, where he leaves the
     * bus and moves to THE_DEPARTURE_TERMINAL.
     * At the ARRIVAL_TERMINAL and THE_DEPARTURE_TERMINAL, the passengers wait until all other passengers finish their
     * lifecycle, to start the next iteration, where the passenger goes back to THE_DISEMBARKING_ZONE.
     */
    @Override
    public void run() {
        
        Random r = new Random();
        Boolean loop = true;
        for(run = 0; run < nrVoos; run++){
            loop = true;
            state = PassengerEnum.AT_THE_DISEMBARKING_ZONE;
            while (loop) {
                switch(state) {
                    case AT_THE_DISEMBARKING_ZONE:
                        
                        Boolean goHome = flightsDestination[run] == "H";
                        bags = new Bag[flightsBags.get(run).size()];
                        for(int i = 0; i < bags.length; i++) {
                            bags[i] = flightsBags.get(run).get(i);
                        }
    
                        if(arrivalLounge.whatShouldIDo(goHome) == 1) 
                            baggageCollectionPoint.resetState();

                        System.out.println("PASSAGEIRO CHEGOU COM " + bags.length + " MALAS | " + super.toString());
                        state = goHome 
                            ? (bags.length > 0
                                ? PassengerEnum.AT_THE_LUGGAGE_COLLECTION_POINT
                                : PassengerEnum.EXITING_THE_ARRIVAL_TERMINAL)
                            : PassengerEnum.AT_THE_ARRIVAL_TRANSFER_TERMINAL;
                        break;
    
                    case AT_THE_LUGGAGE_COLLECTION_POINT:
                        System.out.println("PASSAGEIRO A IR PARA LUGGAGE POINT, VAI BUSCAR " + bags.length + " MALAS | " + super.toString());
                        ownBags = new HashSet<String>();
                        for(int i = 0; i < bags.length; i++)
                            ownBags.add(bags[i].getId());
    
                        while(ownBags.size() > 0) {
                            Bag bag = baggageCollectionPoint.goCollectABag(ownBags);
                            if(bag == null) {
                                System.out.println(ownBags);
                                state = ownBags.size() > 0 
                                    ? PassengerEnum.AT_THE_BAGGAGE_RECLAIM_OFFICE
                                    : PassengerEnum.EXITING_THE_ARRIVAL_TERMINAL;
                                break;
                            }
                            if(ownBags.contains(bag.getId())) {
                                ownBags.remove(bag.getId());
                                System.out.println("PASSAGEIRO A IR BUSCAR MALA, FALTAM " + ownBags.size() + " | " + super.toString());
                                state = PassengerEnum.EXITING_THE_ARRIVAL_TERMINAL;
                            }
                        }

                        break;
                    
                    case AT_THE_BAGGAGE_RECLAIM_OFFICE:
                        System.out.println("A RECLAMAR " + ownBags.size() + " MALA(S) PERDIDAS | " + super.toString());
                        baggageReclaimOffice.complain(ownBags);
                        state = PassengerEnum.EXITING_THE_ARRIVAL_TERMINAL;
                        break;

                    case AT_THE_ARRIVAL_TRANSFER_TERMINAL:
                        System.out.println("À ESPERA DE AUTOCARRO | " + super.toString());
                        arrivalTerminalTransferQuay.takeABus(id);
                        System.out.println("A ENTRAR EM AUTOCARRO | " + super.toString());
                        arrivalTerminalTransferQuay.enterTheBus(id);
                        state = PassengerEnum.TERMINAL_TRANSFER;
                        break;
                        
                    case TERMINAL_TRANSFER:
                        departureTerminalTransferQuay.waitRide();
                        state = PassengerEnum.AT_THE_DEPARTURE_TRANSFER_TERMINAL;
                        break;
    
                    case AT_THE_DEPARTURE_TRANSFER_TERMINAL:
                        System.out.println("A SAIR DE AUTOCARRO | " + super.toString());
                        departureTerminalTransferQuay.leaveTheBus();
                        state = PassengerEnum.ENTERING_THE_DEPARTURE_TERMINAL;
                        break;
    
                    case EXITING_THE_ARRIVAL_TERMINAL:
                        arrivalTerminalExit.increment();
                        int preparing = departureTerminalEntrance.passengersPreparingNextLeg();
                        if(arrivalTerminalExit.goHome(preparing)) {
                            departureTerminalEntrance.wakePassengers();
                            if(run == nrVoos - 1) {
                                arrivalLounge.endWorkDay();
                                arrivalTerminalTransferQuay.endWorkDay();
                            }
                        }
                        loop = false;
                        System.out.println("PASSAGEIRO A IR PARA CASA | " + super.toString());
                        state = PassengerEnum.WAITING_END;
                        break;
    
                    case ENTERING_THE_DEPARTURE_TERMINAL:
                        System.out.println("PASSAGEIRO A PREPARAR PARA O PROXIMO VOO | " + super.toString());
                        departureTerminalEntrance.increment();
                        int goingHome = arrivalTerminalExit.passengersGoingHome();
                        if(departureTerminalEntrance.prepareNextLeg(goingHome)) {
                            arrivalTerminalExit.wakePassengers();
                            if(run == nrVoos - 1) {
                                arrivalLounge.endWorkDay();
                                arrivalTerminalTransferQuay.endWorkDay();
                            }
                        }
                        loop = false;
                        break;

                }
                try {
                    Thread.sleep(rDelay.nextInt(10));
                } catch (Exception e) {}
            }
            System.out.println("PASSAGEIRO A REINICIAR ESTADO | " + super.toString());
        }
        System.out.println("THREAD DE PASSAGEIRO A SAIR | " + super.toString());

    }

    /**
     * String representation of the passenger.
     */
    @Override
    public String toString() {
        return  String.format("Passageiro no estado %s | %s", state, super.toString());
    }
    
    
}