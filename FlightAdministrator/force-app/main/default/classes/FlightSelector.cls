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

    /**
     * Retrieves flight record by DepartureAirport__c and ArrivalAirport__c.
     * @param departureAirportId departure airport id
     * @param arrivalAirportId arrival airport id
     *
     * @return flight record
     */
    public static Flight__c fetchFlightByDepartureAirportIdAndArrivalAirportId(Id departureAirportId, Id arrivalAirportId) {
        return [
            SELECT
                Id,
                Name,
                DepartureAirport__c,
                ArrivalAirport__c,
                FlightDistance__c
            FROM
                Flight__c
            WHERE 
                DepartureAirport__c = :departureAirportId
                AND ArrivalAirport__c = :arrivalAirportId
            LIMIT 1
        ];
    }
}
