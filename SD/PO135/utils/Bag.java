package utils;

/**
 * Class to represent a piece of luggage.
 * 
 * @author Gonçalo Vítor
 * @author Gabriel Silva
 */

public class Bag {

    /**
     * Bag identifier
     */
    private String id;

    /**
     * The bag destination. Defined according to the passengers situation.
     */
    private String destination;

    /**
     * Bag constructor
     * @param id Id of the bag
     * @param destination Destination of the bag
     */
    public Bag(String id, String destination) {
        this.id = id;
        this.destination = destination;
    }

    /**
     * Getter for the bag's id.
     * @return A String containing the bag's id.
     */
    public String getId() {
        return this.id;
    }

    /**
     * Getter for the bag's destiantion.
     * @return A String containing the bag's destination.
     */
    public String getDestination() {
        return this.destination;
    }

    /**
     * Sets the destination to the given String.
     * @param destination String indicating if the owner of the bag is boarding another flight or leaving home.
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * String representation of a bag.
     */
    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", destination='" + getDestination() + "'" +
            " }";
    }

}