@IsTest
private class FlightServiceTest {

    @TestSetup
    static void initData() {
        insert new List<Airport__c>{
            AirportTestDataFactory.buildAirportWithNameWithIataCodeWithLatitudeWithLongitude(
                false,
                AirportTestData.FIRST_AIRTPORT_NAME_TEST,
                AirportTestData.FIRST_IATA_CODE_TEST,
                AirportTestData.FIRST_LATITUDE_TEST,
                AirportTestData.FIRST_LONGITUDE_TEST
            ),
            AirportTestDataFactory.buildAirportWithNameWithIataCodeWithLatitudeWithLongitude(
                false,
                AirportTestData.SECOND_AIRTPORT_NAME_TEST,
                AirportTestData.SECOND_IATA_CODE_TEST,
                AirportTestData.SECOND_LATITUDE_TEST,
                AirportTestData.SECOND_LONGITUDE_TEST
            )
        };
    }

    @IsTest
    static void handleFlightDistanceTest() {
        List<Airport__c> testAirports = AirportSelector.fetchAirports();

        Test.startTest();

        insert new Flight__c(
            DepartureAirport__c = testAirports.get(0).Id,
            ArrivalAirport__c = testAirports.get(1).Id
        );

        Test.stopTest();

        System.assertEquals(1869.309193621214, FlightSelector.fetchFlights().get(0).FlightDistance__c);
    }
}
