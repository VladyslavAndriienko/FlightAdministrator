public class FlightController {
    
    @AuraEnabled(cacheable=true)
    public static List<Airport__c> fetchAirports() {
        try {
            return AirportSelector.fetchAirports();
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Flight__c> fetchFlights() {
        try {
            return FlightSelector.fetchFlights();
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void saveFlight(List<Id> airportIds) {
        try {
            FlightService.handleSaveFlight(airportIds);
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
