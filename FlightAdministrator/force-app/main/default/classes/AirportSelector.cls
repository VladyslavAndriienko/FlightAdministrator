public class AirportSelector {
    
    /**
     * Retrieves all airports.
     *
     * @return list of airports
     */
    public static List<Airport__c> fetchAirports() {
        return [
            SELECT
                Id,
                Name,
                City__c,
                Country__c,
                Geolocation__c,
                IataCode__c
            FROM
                Airport__c
        ];
    }
    
    /**
     * Retrieves airports by ids.
     * @param airportIds airport ids 
     *
     * @return map of airports
     */
    public static Map<Id, Airport__c> fetchAirportsByIds(Set<Id> airportIds) {
        return new Map<Id, Airport__c> ([
            SELECT
                Id,
                Name,
                City__c,
                Country__c,
                Geolocation__c,
                Geolocation__Latitude__s,
                Geolocation__Longitude__s,
                IataCode__c
            FROM
                Airport__c
            WHERE
                Id IN :airportIds
        ]);
    }
}