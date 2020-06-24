package threads;

import java.util.Random;

import enums.BusDriverEnum;
import operations.IArrivalTerminalTransferQuayBusdriver;
import operations.IDepartureTerminalTransferQuayBusdriver;

/**
 * Class to represent a bus driver.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public class BusDriver extends Thread {
    
    /**
     * Bus driver current state
     */
    private BusDriverEnum state;

    /**
     * Life cycle terminating condition
     */
    private Boolean loop = true;

    /**
     * Random delay to use in thread
     */
    private Random rDelay;

    /**
     * Number of passenger riding the bus
     */
    private int passengersRiding = 0;

    /**
     * Shared memory region - ArrivalTerminalTransferQuay
     */
    private final IArrivalTerminalTransferQuayBusdriver arrivalTerminalTransferQuay;

    /**
     * Shared memory region - DepartureTerminalTransferQuay
     */
    private final IDepartureTerminalTransferQuayBusdriver departureTerminalTransferQuay;
  
    /**
     * Bus driver contructor
     * @param delay Seed for random number generation.
     * @param arrivalTerminalTransferQuay The arrival terminal transder quay shared memory region.
     * @param departureTerminalTransferQuay The departure termninal transfer quay shared memory region.
     */
    public BusDriver(int delay, IArrivalTerminalTransferQuayBusdriver arrivalTerminalTransferQuay, IDepartureTerminalTransferQuayBusdriver departureTerminalTransferQuay) {
        state = BusDriverEnum.PARKING_AT_THE_ARRIVAL_TERMINAL;
        rDelay = new Random(delay);
        this.arrivalTerminalTransferQuay = arrivalTerminalTransferQuay;
        this.departureTerminalTransferQuay = departureTerminalTransferQuay;
    }
    
    /**
     * Bus driver life cycle.
     * The bus driver starts at PARKING_AT_THE_ARRIVAL_TERMINAL and will evaluate if his day of work
     * has ended (hasDaysWorkEnded). If it has, the cycle finishes. Otherwise he will stand in place untill all
     * passengers wanting a ride enter the bus (waitForPassengersToEnter). He then changes to DRIVING_FORWARD. This 
     * is a simple transition state. The driver changes then to PARKING_AT_THE_DEPARTURE_TERMINAL. Here he will wait 
     * untill all passenger that were inside leave the bus (parkTheBusAndLetPassOff), and will then transition to 
     * DRIVING_BACKWARD. This is another simple transition state. The driver then changes to PARKING_AT_THE_ARRIVAL_TERMINAL 
     * and repeats the cycle.
     */
    @Override
    public void run() {
        
        while (loop) {
            switch(state) {

                case PARKING_AT_THE_ARRIVAL_TERMINAL:
                    System.out.println("BUSDRIVER A ESPERAR POR PASSAGEIROS");
                    String nextState = arrivalTerminalTransferQuay.hasDaysWorkEnded();
                    if(nextState == "W") {
                        passengersRiding = arrivalTerminalTransferQuay.waitForPassengersToEnter();
                        if(passengersRiding > 0) {
                            System.out.println("A COMEÇAR A VIAGEM DE IDA");
                            state = BusDriverEnum.DRIVING_FORWARD;
                        }
                    } else if(nextState == "E"){
                        loop = false;
                    }
                    break;

                case DRIVING_FORWARD:
                    System.out.println("VIAGEM DE IDA");
                    state = BusDriverEnum.PARKING_AT_THE_DEPARTURE_TERMINAL;
                    break;

                case PARKING_AT_THE_DEPARTURE_TERMINAL:
                    System.out.println("A CHEGAR AO DESTINO");
                    departureTerminalTransferQuay.parkTheBusAndLetPassOff(passengersRiding);
                    System.out.println("PASSAGEIROS SAIRAM DO AUTOCARRO, A COMEÇAR VIAGEM DE VOLTA");
                    state = BusDriverEnum.DRIVING_BACKWARD;
                default:

                case DRIVING_BACKWARD:
                    System.out.println("VIAGEM DE VOLTA");
                    state = BusDriverEnum.PARKING_AT_THE_ARRIVAL_TERMINAL;
                    break;

            }
            try {
                Thread.sleep(rDelay.nextInt(10));
            } catch (Exception e) {}
        }
        
        System.out.println("BUSDRIVER A SAIR DA THREAD");

    }

    /**
     * String representation of the bus driver
     */
    @Override
    public String toString() {
        return  String.format("Porteiro no estado %s | %s", state, super.toString());
    }
    
    
}