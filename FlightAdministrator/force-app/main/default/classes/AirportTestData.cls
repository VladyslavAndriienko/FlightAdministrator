@IsTest
public class AirportTestData implements IDataBuilder {

    @TestVisible private static final String FIRST_AIRTPORT_NAME_TEST = 'AirportNameTest1';
    @TestVisible private static final String SECOND_AIRTPORT_NAME_TEST = 'AirportNameTest2';

    @TestVisible private static final String FIRST_IATA_CODE_TEST = 'AAA';
    @TestVisible private static final String SECOND_IATA_CODE_TEST = 'BBB';

    @TestVisible private static final Decimal FIRST_LATITUDE_TEST = 52.15949936;
    @TestVisible private static final Decimal SECOND_LATITUDE_TEST = 41.29710400;

    @TestVisible private static final Decimal FIRST_LONGITUDE_TEST = 20.96699613;
    @TestVisible private static final Decimal SECOND_LONGITUDE_TEST = 2.07845900;
    
    Airport__c record;

    public static AirportTestData build() {
        AirportTestData dataFactory = new AirportTestData();
        dataFactory.record = new Airport__c();
        return dataFactory.applyDefaults();
    }

    public AirportTestData applyDefaults() {
        return this
            .withName(FIRST_AIRTPORT_NAME_TEST)
            .withIataCode(FIRST_IATA_CODE_TEST)
            .withLatitude(FIRST_LATITUDE_TEST)
            .withLongitude(FIRST_LONGITUDE_TEST);
    }

    public Airport__c get() {
        return record;
    }

    public AirportTestData save() {
        if(record.Id == null) {
            insert record;
        } else {
            update record;
        }   

        return this;
    }

    public AirportTestData save(Boolean withSave) {
        if(withSave == true) {
            save();
        }

        return this;
    }

    public AirportTestData withName(String name) {
        record.Name = name;
        return this;
    }

    public AirportTestData withIataCode(String iataCode) {
        record.IataCode__c = iataCode;
        return this;
    }

    public AirportTestData withLatitude(Decimal latitude) {
        record.Geolocation__Latitude__s = latitude;
        return this;
    }

    public AirportTestData withLongitude(Decimal longitude) {
        record.Geolocation__Longitude__s = longitude;
        return this;
    }
}