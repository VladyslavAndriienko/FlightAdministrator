public class FlightController {
    
    @AuraEnabled(cacheable=true)
    public static List<Airport__c> fetchAirports() {
        try {
            return AirportSelector.fetchAirports();
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Flight__c fetchFlightByDepartureAirportIdAndArrivalAirportId(Id departureAirportId, Id arrivalAirportId) {
        try {
            return FlightSelector.fetchFlightByDepartureAirportIdAndArrivalAirportId(departureAirportId, arrivalAirportId);
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void saveFlight(Id departureAirportId, Id arrivalAirportId) {
        try {
            FlightService.handleSaveFlight(departureAirportId, arrivalAirportId);
        } catch(Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
