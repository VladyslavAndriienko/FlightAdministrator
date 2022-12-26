/**
 * Class contains service methods for Flight__c obj.
 */
public class FlightService {

    /**
    * Insert new Flight record based on departure airport and arrival airport.
    * @param departureAirportId departure airport id
    * @param arrivalAirportId arrival airport id
    */
    public static void handleSaveFlight(Id departureAirportId, Id arrivalAirportId) {
        if(departureAirportId == null || arrivalAirportId == null) {
            return;
        }

        insert new Flight__c(
            DepartureAirport__c = departureAirportId,
            ArrivalAirport__c = arrivalAirportId
        );
    }
    
    /**
    * Handler for Flight Distance. Calculates FlightDistance__c based on DepartureAirport__c and ArrivalAirport__c.
    * @param flights list of flights
    */
    public static void handleFlightDistance(List<Flight__c> flights) {
        Set<Id> airportIds = new Set<Id>();
        
        for(Flight__c flight : flights) {
            airportIds.add(flight.DepartureAirport__c);
            airportIds.add(flight.ArrivalAirport__c);
        }

        Map<Id, Airport__c> airportIds2Airport = AirportSelector.fetchAirportsByIds(airportIds);

        for(Flight__c flight : flights) {
            if(
                airportIds2Airport.keySet().contains(flight.DepartureAirport__c)
                && airportIds2Airport.keySet().contains(flight.ArrivalAirport__c)
            ) {
                flight.FlightDistance__c = UtilsMethods.calculateDistanceByCoordinates(
                    airportIds2Airport.get(flight.DepartureAirport__c).Geolocation__Latitude__s,
                    airportIds2Airport.get(flight.DepartureAirport__c).Geolocation__Longitude__s,
                    airportIds2Airport.get(flight.ArrivalAirport__c).Geolocation__Latitude__s,
                    airportIds2Airport.get(flight.ArrivalAirport__c).Geolocation__Longitude__s,
                    Constants.EARTH_RADIUS_IN_KILOMETERS
                );
            }
        }
    }
}
