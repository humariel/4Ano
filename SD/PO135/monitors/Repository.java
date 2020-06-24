package monitors;

import enums.*;
import utils.Constants;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.locks.ReentrantLock;

/**
 * The general repository of information. The group of variables it contains
 * represent the internal state of the airport.
 * All the operations in this class have logging effects only and have no impact
 * on the entities' life cycles. They are, in fact, the reflection of the changes 
 * in the entities' life cycles!
 */
public class Repository {

    //Plane
    /**
     * The flight number.
     */
    private int flight;
    /**
     * The amount of luggage at the plane's hold.
     */
    private int flightLuggage;

    //Porter
    /**
     * The state of the porter.
     */
    private String porterState;
    /**
     * Amount of luggage in the conveyor belt.
     */
    private int conveyorLuggage;
    /**
     * Amount of luggage in the storeromm.
     */
    private int storeroomLuggage;

    //Bus Driver
    /**
     * The bus driver state.
     */
    private String driverState;
    /**
     * Bus waiting queue.
     */
    private String[] queue;
    /**
     * Index to handle que bus waiting line.
     */
    private int queueIdx;
    /**
     * Array of seats of the bus.
     */
    private String[] seats;
    /**
     * Index to handle the seats.
     */
    private int seatsIdx;

    //Passengers
    /**
     * The state of all passengers.
     */
    private String[] passengerStates;
    /**
     * The situation of all passengers, i.e., if the passenger is in his/her final destination or in transit.
     */
    private String[] passengerSituation;
    /**
     * String representing the amount of luggage owned by each passenger. It's an array of Strings instead of ints 
     * to simplify the log writing methods, since this value should be "-" while the passenger isn't yet at the 
     * Arrival Lounge.
     */
    private String[] passengerLuggage;
    /**
     * String representing the amount of luggage already collected by each passenger. It's an array of Strings instead of
     * ints for the same reason as the passengerSituation variable.
     */
    private String[] passengerCollectedLuggage;

    //Final report
    /**
     * The amount of passenger that arrived at the airport having it as their final destination.
     */
    private int finalDestinations;
    /**
     * The amount of passenger that arrived at the airport to board another flight.
     */
    private int transit;
    /**
     * The amount of bags seen in all flights.
     */
    private int bags;
    /**
     * The amount of bags lost in all flights.
     */
    private int lostBags;

    /**
     * The file to be written.
     */
    private File log;
    /**
     * The amount of passenger. Usefull for the writing methods.
     */
    private int maxPassengers;

    /**
     * Reentrart lock.
     */
    private ReentrantLock rl;

    /**
     * The Repository constructor.
     * @param log The logging file to be written
     */
    public Repository(File log){
        this.maxPassengers = Constants.N();
        this.flight = 0;
        this.flightLuggage = 0;
        this.porterState = "WPTL";
        this.conveyorLuggage = 0;
        this.storeroomLuggage = 0;
        this.driverState = "PKAT";
        this.queue = new String[maxPassengers];
        for(int i=0;i<maxPassengers;i++) this.queue[i] = "-";
        this.queueIdx = 0;
        this.seats = new String[Constants.T()];
        for(int i=0;i<Constants.T();i++) this.seats[i] = "-";
        this.seatsIdx = 0;
        this.passengerStates = new String[maxPassengers];
        for(int i=0;i<maxPassengers;i++) this.passengerStates[i] = "---";
        this.passengerSituation = new String[maxPassengers];
        for(int i=0;i<maxPassengers;i++) this.passengerSituation[i] = "---";
        this.passengerLuggage = new String[maxPassengers];
        for(int i=0;i<maxPassengers;i++) this.passengerLuggage[i] = "-";
        this.passengerCollectedLuggage = new String[maxPassengers];
        for(int i=0;i<maxPassengers;i++) this.passengerCollectedLuggage[i] = "-";
        this.finalDestinations = 0;
        this.transit = 0;
        this.bags = 0;
        this.lostBags = 0;

        this.log = log;
        this.rl = new ReentrantLock(true);
    }

    /**
     * Increases the current flight number.
     * Does not write the log file on it's own. The update has to be written by another change.
     */
    private void addFlight() {
        this.flight++;
    }

    /**
     * Gets the current flight number to the one given.
     * @param flight The flight number to be set.
     */
    public int getFlight() {
        return flight - 1;
    }

    /**
     * Sets the flight luggage to the one given.
     * @param flightLuggage The amount of luggage at the plane's hold.
     */
    private void setFlightLuggage(int flightLuggage) {
        this.flightLuggage = flightLuggage;
    }

    /**
     * Sets the porter's state .
     * @param state A state from {@link enums.PorterEnum}
     */
    private void setPorterState(PorterEnum state) {
        switch(state){
            case WAITING_FOR_A_PLANE_TO_LAND:
                this.porterState = "WPTL";
                break;
                
            case AT_THE_PLANES_HOLD:
                this.porterState = "APLH";
                break;

            case AT_THE_LUGGAGE_BELT_CONVEYOR:
                this.porterState = "ALCB";
                break;

            case AT_THE_STOREROOM:
                this.porterState = "ASTR";
                break;

            default:
        }
    }

    /**
     * Sets the driver's state .
     * @param state A state from {@link enums.BusDriverEnum}
     */
    private void setDriverState(BusDriverEnum state) {
        switch(state){
            case PARKING_AT_THE_ARRIVAL_TERMINAL:
                this.driverState = "PKAT";
                break;
                
            case DRIVING_FORWARD:
                this.driverState = "DRFW";
                break;

            case DRIVING_BACKWARD:
                this.driverState = "DRBW";
                break;

            case PARKING_AT_THE_DEPARTURE_TERMINAL:
                this.driverState = "PKDT";
                break;

            default:
        }
    }

    /**
     * Sets the passenger's state .
     * @param state A state from {@link enums.PassengerEnum}
     */
    private void setPassengerState(PassengerEnum state, int idx) {
        switch(state){
            case AT_THE_DISEMBARKING_ZONE:
                this.passengerStates[idx] = "WSD";
                break;
                
            case AT_THE_ARRIVAL_TRANSFER_TERMINAL:
                this.passengerStates[idx] = "ATT";
                break;

            case TERMINAL_TRANSFER:
                this.passengerStates[idx] = "TRT";
                break;

            case AT_THE_DEPARTURE_TRANSFER_TERMINAL:
                this.passengerStates[idx] = "DTT";
                break;

            case ENTERING_THE_DEPARTURE_TERMINAL:
                this.passengerStates[idx] = "EDT";
                break;
                
            case AT_THE_LUGGAGE_COLLECTION_POINT:
                this.passengerStates[idx] = "LCP";
                break;

            case AT_THE_BAGGAGE_RECLAIM_OFFICE:
                this.passengerStates[idx] = "BRO";
                break;

            case EXITING_THE_ARRIVAL_TERMINAL:
                this.passengerStates[idx] = "EAT";
                break;
            default:
        }
    }

    /**
     * Just sets the porter state to Waiting Plane to Land (WPTL), if it isn't already in that state.
     */
    public void porterWaitingLanding() {
        rl.lock();
        try{
            if(!porterState.equals("WPTL")){
                setPorterState(PorterEnum.WAITING_FOR_A_PLANE_TO_LAND);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Just sets the porter state to At the Plane's Hold (APLH), if it isn't already in that state.
     */
    public void porterNoMoreBags() {
        rl.lock();
        try{
            if(!porterState.equals("APLH")){
                setPorterState(PorterEnum.AT_THE_PLANES_HOLD);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the porter state to At the Plane's Hold (APLH) and removes a bag from the flight luggage.
     */
    public void porterCollectBag() {
        rl.lock();
        try{
            setPorterState(PorterEnum.AT_THE_PLANES_HOLD);
            this.flightLuggage--;
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the porter state to At the Luggage Belt Conveyor (ALBC) and adds a bag to the conveyor belt luggage.
     */
    public void porterMoveBagToConveyorBelt() {
        rl.lock();
        try{
            setPorterState(PorterEnum.AT_THE_LUGGAGE_BELT_CONVEYOR);
            this.conveyorLuggage++;
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the porter state to At the Storeroom (ASTR) and removes a bag from the flight luggage.
     */
    public void porterMoveBagToStoreroom() {
        rl.lock();
        try{
            setPorterState(PorterEnum.AT_THE_STOREROOM);
            this.storeroomLuggage++;
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the driver state to Parking at the Arrival Terminal (PKAT), only if it isn't already in that state.
     */
    public void driverParkingArrivalTerminal() {
        rl.lock();
        try{
            if(!driverState.equals("PKAT")){
                setDriverState(BusDriverEnum.PARKING_AT_THE_ARRIVAL_TERMINAL);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the driver state to Parking at the Departure Terminal (PKDT), only if it isn't already in that state.
     */
    public void driverParkingDepartureTerminal() {
        rl.lock();
        try{
            if(!driverState.equals("PKDT")){
                setDriverState(BusDriverEnum.PARKING_AT_THE_DEPARTURE_TERMINAL);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the driver state to Driving Forward (DRFW), only if it isn't already in that state.
     */
    public void driverDrivingForward() {
        rl.lock();
        try{
            if(!driverState.equals("DRFW")){
                setDriverState(BusDriverEnum.DRIVING_FORWARD);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the driver state to Driving Backward (DRBW), only if it isn't already in that state.
     */
    public void driverDrivingBackward() {
        rl.lock();
        try{
            if(!driverState.equals("DRBW")){
                setDriverState(BusDriverEnum.DRIVING_BACKWARD);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Initializes a passenger in the logging file.
     * Changes it's state to the given one , sets it's amount of luggage and situation.
     * @param state A state from {@link enums.PassengerEnum} .
     * @param bags The amount of bags the passenger owns.
     * @param situation The passenger's situation : either "FDT" (final destination) or "TRF" (in transit).
     * @param id The passenger's id. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passengerInit(PassengerEnum state, int bags, String situation ,int id) {
        rl.lock();
        try{
            setPassengerState(state, id);
            this.passengerLuggage[id] = Integer.toString(bags);
            this.passengerSituation[id] = situation;
            this.passengerCollectedLuggage[id] = "0";
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the indicated passenger's state to At the Luggage Collection Point (LCP), only if it isn't already a that state.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passEnterLuggageCollectionPoint(int id) {
        rl.lock();
        try{
            if(!passengerStates[id].equals("LCP")){
                setPassengerState(PassengerEnum.AT_THE_LUGGAGE_COLLECTION_POINT, id);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Removes a bag from the conveyor luggage and adds a bag to the passenger collected luggage.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passCollectBag(int id) {
        rl.lock();
        try{
            passengerCollectedLuggage[id] = Integer.toString(Integer.parseInt(passengerCollectedLuggage[id])+1);
            conveyorLuggage--;
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the passenger to At the Baggage Reclaim Office (BRO) and adds a bag to the lost bag count.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passComplain(int id) {
        rl.lock();
        try{
            setPassengerState(PassengerEnum.AT_THE_BAGGAGE_RECLAIM_OFFICE, id);
            addLostBag();
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the passenger to At the Arrival Terminal Tranfer (ATT) and adds the passenger to the bus waiting queue.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passJoinBusQueue(int id) {
        rl.lock();
        try{
            setPassengerState(PassengerEnum.AT_THE_ARRIVAL_TRANSFER_TERMINAL, id);
            queue[queueIdx++] = Integer.toString(id);
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Removes the passenger from the bus waiting queue and sits it on the bus.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passSitInBus(int id) {
        rl.lock();
        try{
            //remove from queue
            for(int i=0; i<queue.length; i++) {
                if(Integer.toString(id).equals(queue[i])){
                    for(int j=i; j<queue.length-1; j++) {
                        queue[j] = queue[j+1];
                    }
                    queue[queue.length-1] = "-";
                    break;
                }
            }
            queueIdx--;

            seats[seatsIdx++] = Integer.toString(id);
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the indicated passenger's state to Terminal Tranfer (TRT), only if it isn't already a that state.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passBusRide(int id) {
        rl.lock();
        try{
            if(!passengerStates[id].equals("TRT")){
                setPassengerState(PassengerEnum.TERMINAL_TRANSFER, id);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the passenger's state to At the Departure Tranfer Terminal (DTT) and removes him from the bus.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passLeaveBus(int id) {
        rl.lock();
        try{
            setPassengerState(PassengerEnum.AT_THE_DEPARTURE_TRANSFER_TERMINAL, id);
            seats[--seatsIdx] = "-";
            write();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the indicated passenger's state to Exiting the Arrival Terminal (EAT), only if it isn't already a that state.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passGoHome(int id) {
        rl.lock();
        try{
            if(!passengerStates[id].equals("EAT")){
                setPassengerState(PassengerEnum.EXITING_THE_ARRIVAL_TERMINAL, id);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Sets the indicated passenger's state to Entering the Departure Terminal (EDT), only if it isn't already a that state.
     * @param id The id of the passenger to affect. Ids range from 0 to {@link utils.Constants#N()}-1 .
     */
    public void passPrepareNextLeg(int id) {
        rl.lock();
        try{
            if(!passengerStates[id].equals("EDT")){
                setPassengerState(PassengerEnum.ENTERING_THE_DEPARTURE_TERMINAL, id);
                write();
            }
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Resets the logging state of all passengers.
     * Sets their states and situations to "---".
     * Sets their luggage and collected luggage to "-".
     */
    private void passengersReset() {
        rl.lock();
        try{
            for(int i=0;i<maxPassengers;i++) passengerStates[i] = "---";
            for(int i=0;i<maxPassengers;i++) passengerSituation[i] = "---";
            for(int i=0;i<maxPassengers;i++) passengerLuggage[i] = "-";
            for(int i=0;i<maxPassengers;i++) passengerCollectedLuggage[i] = "-";
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Resets states to start the next flight.
     * Does not write the log file on it's own. The update has to be written by another change. (The first passenger does so upon initialization)
     */
    public void startNextFlight(int flightLuggage) {
        rl.lock();
        try{
            this.porterState = "WPTL";
            this.driverState = "PKAT";
            addFlight();
            setFlightLuggage(flightLuggage);
            passengersReset();
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    //-------------------------------------FINAL REPORT--------------------------------------//

    /**
     * Adds a final desitnation to the final report.
     */
    public void addFinalDestinations() {
        rl.lock();
        try{
            this.finalDestinations++;
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Adds a transit desitnation to the final report.
     */
    public void addTransit() {
        rl.lock();
        try{
            this.transit++;
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Adds a bag to the final report.
     */
    public void addBag() {
        rl.lock();
        try{
            this.bags++;
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    /**
     * Adds a lost bag to the final report.
     */
    public void addLostBag() {
        rl.lock();
        try{
            this.lostBags++;
        }catch(Exception e){}
        finally{
            rl.unlock();
        }
    }

    //----------------------------------------------WRITE FUNCTIONS-------------------------------//

    /**
     * Writes the header of the log file. To be used once per execution.
     * @throws IOException
     */
    public void writeHeader() throws IOException{
        rl.lock();
        FileWriter fw = null;
        try{
            fw = new FileWriter(log, false); // No append
            String title = "               AIRPORT RHAPSODY - Description of the internal state of the problem\n";
            fw.write(title);
            String PPD = "PLANE    PORTER                  DRIVER\n";
            String PPD_vars = "FN BN  Stat CB SR   Stat  Q1 Q2 Q3 Q4 Q5 Q6  S1 S2 S3\n";
            String Passengers = "                                                         PASSENGERS\n";
            String Passengers_vars = "St1 Si1 NR1 NA1 St2 Si2 NR2 NA2 St3 Si3 NR3 NA3 St4 Si4 NR4 NA4 St5 Si5 NR5 NA5 St6 Si6 NR6 NA6\n";
            fw.write(PPD);
            fw.write(PPD_vars);
            fw.write(Passengers);
            fw.write(Passengers_vars);
        }catch(Exception e){}
        finally{
            fw.close();
            rl.unlock();
        }
    }

    /**
     * Writes an update to the log file.
     * @throws IOException
     */
    private void write() throws IOException{
        rl.lock();
        FileWriter fw = null;
        try{
            fw = new FileWriter(log, true); // Append
            String busQueue_Seats = "";
            for(int i=0; i<queue.length; i++) {
                busQueue_Seats += queue[i] + "  ";
            }
            busQueue_Seats += " ";
            for(int i=0; i<seats.length; i++) {
                busQueue_Seats += seats[i] + "  ";
            }
            busQueue_Seats += "\n";
            String line1 = " " + Integer.toString(flight) + " " + Integer.toString(flightLuggage) + "   " + porterState.toString()
                           + "  " + Integer.toString(conveyorLuggage) + "  " + Integer.toString(storeroomLuggage) +  "   "
                           + driverState.toString() + "   " + busQueue_Seats;
            fw.write(line1);

            String line2 = "";
            for(int i=0; i<maxPassengers; i++){
                line2 += passengerStates[i] + " " + passengerSituation[i] + "  " + passengerLuggage[i] + "   " + passengerCollectedLuggage[i] + "  ";
            } 
            line2 += "\n";
            fw.write(line2);

        }catch(Exception e){}
        finally{
            fw.close();
            rl.unlock();
        }
    }

    /**
     * Writes the final report to the log file and closes it.
     * @throws IOException
     */
    public void close() throws IOException{
        rl.lock();
        FileWriter fw = null;
        try{
            fw = new FileWriter(log, true); // Append
            fw.write("\nFinal Report\n");
            fw.write("N. of passengers which have this airport as their final destination = " + finalDestinations + "\n");
            fw.write("N. of passengers which are in transit = " + transit + "\n");
            fw.write("N. of bags that should have been transported in the the planes hold = " + bags + "\n");
            fw.write("N. of bags that were lost = " + lostBags + "\n");
            fw.close();
        }catch(Exception e){}
        finally{
            fw.close();
            rl.unlock();
        }
    }
}