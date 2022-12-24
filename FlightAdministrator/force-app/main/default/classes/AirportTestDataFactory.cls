@IsTest
public class AirportTestDataFactory {

    public static Airport__c buildAirport(Boolean withSave) {
        return AirportTestData.build()
            .save(withSave)
            .get();
    }

    public static Airport__c buildAirportWithNameWithIataCodeWithLatitudeWithLongitude(
        Boolean withSave, 
        String name, 
        String iataCode, 
        Decimal latitude,
        Decimal longitude
    ) {
        return AirportTestData.build()
            .withName(name)
            .withIataCode(iataCode)
            .withLatitude(latitude)
            .withLongitude(longitude)
            .save(withSave)
            .get();
    }
}
