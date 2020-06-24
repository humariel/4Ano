import threads.*;
import monitors.*;
import operations.*;

import utils.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * Main class, that instantiates all shared memory regions and starts all threads.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public class AirportRhapsody {

    public static void main(String[] args) throws IOException{
                          
        Random r = new Random();

        int nrVoos = args.length > 0 ? Integer.parseInt(args[0]) : 5;
        int nrPassengers = args.length > 1 ? Integer.parseInt(args[1]) : 6;
        int nrBags = args.length > 2 ? Integer.parseInt(args[2]) : 2;
        int busSize = args.length > 3 ? Integer.parseInt(args[3]) : 3;
        utils.Constants.setK(nrVoos);
        utils.Constants.setN(nrPassengers);
        utils.Constants.setM(nrBags);
        utils.Constants.setT(busSize);

        List<List<Bag>> bagsPerFlight = new ArrayList<>(nrVoos);
        String[][] passengersDestination = new String[nrPassengers][nrVoos];
        List<List<List<Bag>>> passengersBags = new ArrayList<>(nrPassengers);

        for(int p = 0; p < nrPassengers; p++) {
            passengersBags.add(new ArrayList<>());
            for(int v = 0; v < nrVoos; v++) {

                passengersBags.get(p).add(new ArrayList<>());
                if(bagsPerFlight.size() <= v)
                    bagsPerFlight.add(new ArrayList<>()); 

                Boolean goHome = r.nextBoolean();
                passengersDestination[p][v] =  goHome ? "H" : "T";

                int nrRandomBags = r.nextInt(nrBags + 1);
                int bagsLost = r.nextInt(100);
                bagsLost = bagsLost < 5 ? 2 : (bagsLost < 25 ? 1 : 0);

                for(int b = 0; b < nrRandomBags; b++) {
                    Bag bag = new Bag(UUID.randomUUID().toString(), passengersDestination[p][v]);
                    passengersBags.get(p).get(v).add(bag);
                }
                
                int bagsToAdd = bagsLost > nrRandomBags ? nrRandomBags : nrRandomBags - bagsLost;
                for(int b = 0; b < bagsToAdd; b++) {
                    bagsPerFlight.get(v).add(passengersBags.get(p).get(v).get(b));
                }
                
            }
        }

        File log = new File("log.txt");
        Repository rep = new Repository(log);
        rep.writeHeader();

        ArrivalLounge arrivalLounge = new ArrivalLounge(rep, bagsPerFlight);
        BaggageCollectionPoint BaggageCollectionPoint = new BaggageCollectionPoint(rep);
        ArrivalTerminalTransferQuay arrivalTerminalTransferQuay = new ArrivalTerminalTransferQuay(rep);
        DepartureTerminalTransferQuay departureTerminalTransferQuay = new DepartureTerminalTransferQuay(rep);
        ArrivalTerminalExit arrivalTerminalExit = new ArrivalTerminalExit(rep);
        DepartureTerminalEntrance departureTerminalEntrance = new DepartureTerminalEntrance(rep);
        TemporaryStorageArea temporaryStorageArea = new TemporaryStorageArea(rep);
        BaggageReclaimOffice baggageReclaimOffice = new BaggageReclaimOffice(rep);
        
        Porter porter = new Porter(r.nextInt(), (IArrivalLoungePorter) arrivalLounge, (IBaggageCollectionPointPorter) BaggageCollectionPoint, (ITemporaryStorageAreaPorter) temporaryStorageArea);
        porter.start();
        BusDriver busdriver = new BusDriver(r.nextInt(), (IArrivalTerminalTransferQuayBusdriver) arrivalTerminalTransferQuay, (IDepartureTerminalTransferQuayBusdriver) departureTerminalTransferQuay);
        busdriver.start();
        Passenger[] passengers = new Passenger[nrPassengers];
        for(int i = 0; i < nrPassengers; i++) {
            passengers[i] = new Passenger(i, r.nextInt(), passengersDestination[i], passengersBags.get(i), (IArrivalLoungePassenger) arrivalLounge, (IBaggageCollectionPointPassenger) BaggageCollectionPoint, (IArrivalTerminalTransferQuayPassenger) arrivalTerminalTransferQuay, (IDepartureTerminalTransferQuayPassenger) departureTerminalTransferQuay, (IArrivalTerminalExitPassenger) arrivalTerminalExit, (IDepartureTerminalEntrancePassenger) departureTerminalEntrance, (IBaggageReclaimOfficePassenger) baggageReclaimOffice);
            passengers[i].start();
        } 

        try {
            porter.join();
            busdriver.join();
            for(int i = 0; i < nrPassengers; i++) {
                passengers[i].join();
            }
        } catch (Exception e) {

        }finally{
            rep.close();
        }

    }
           
}
