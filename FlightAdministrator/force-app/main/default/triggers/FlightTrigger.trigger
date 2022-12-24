trigger FlightTrigger on Flight__c(before insert) {
    FlightTriggerHandler.instance.handle();
}