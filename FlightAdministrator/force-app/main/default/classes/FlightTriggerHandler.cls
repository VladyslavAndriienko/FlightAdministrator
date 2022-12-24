public class FlightTriggerHandler extends TriggerHandler {

    public static FlightTriggerHandler instance {
        get {
            return instance == null ? new FlightTriggerHandler() : instance;
        }
        private set;
    }
    
    public override void beforeInsert() {
        FlightService.handleFlightDistance(Trigger.new);
    }
}