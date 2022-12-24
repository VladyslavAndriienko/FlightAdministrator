public class FlightSelector {

    /**
     * Retrieves all flights.
     *
     * @return list of flights
     */
    public static List<Flight__c> fetchFlights() {
        return [
            SELECT
                Id,
                Name,
                DepartureAirport__c,
                ArrivalAirport__c,
                FlightDistance__c
            FROM
                Flight__c
        ];
    }
}
