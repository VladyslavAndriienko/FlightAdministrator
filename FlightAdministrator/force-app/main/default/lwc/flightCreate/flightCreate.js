import { LightningElement, wire } from 'lwc';

import fetchAirports from '@salesforce/apex/FlightController.fetchAirports';
import fetchFlightByDepartureAirportIdAndArrivalAirportId from '@salesforce/apex/FlightController.fetchFlightByDepartureAirportIdAndArrivalAirportId';
import saveFlight from '@salesforce/apex/FlightController.saveFlight';

export default class FlightCreate extends LightningElement {

    departureAirportId;
    arrivalAirportId;

    departureAirportIataCode;
    arrivalAirportIataCode;

    flightId;
    flightName;
    flightDistance;

    airportOptions = [];

    areDetailsVisible = false;

    @wire(fetchAirports)
    pupulateAirportOptions({error, data}) {
        if(data) {
            let airportData = [];
            this.airportAllData = [...data];

            data.forEach(
                event => {
                    airportData.push(
                        {
                            label: event.IataCode__c, 
                            value: event.Id
                        }
                    );
                }
            );

            this.airportOptions = [...airportData];
        }
    }

    handleChangeAirport(event) {
        if(event.target.name == 'departureAirportName') {
            this.departureAirportId = event.target.value;
            this.departureAirportIataCode = this.airportOptions.find(option => option.value == this.departureAirportId).label;
        } else if(event.target.name == 'arrivalAirportName') {
            this.arrivalAirportId = event.target.value;
            this.arrivalAirportIataCode = this.airportOptions.find(option => option.value == this.arrivalAirportId).label;
        }
    }

    setFlightResult() {
        fetchFlightByDepartureAirportIdAndArrivalAirportId(
            {
                departureAirportId: this.departureAirportId,
                arrivalAirportId: this.arrivalAirportId
            }
        ).then((result) => {
            this.flightId = result.Id;
            this.flightName = result.Name;
            this.flightDistance = result.FlightDistance__c;
        });
    }

    handleButtonCancel() {
        window.location = window.location.origin + "/lightning/o/Flight__c/list?filterName=Recent";
    }

    handleButtonSave() {
        saveFlight(
            {
                departureAirportId: this.departureAirportId,
                arrivalAirportId: this.arrivalAirportId
            }
        );
    }

    handleButtonClose() {
        window.location = window.location.origin + "/" + this.flightId;
    }

    handleButtonShowFlightResult() {
        this.areDetailsVisible = true;
        this.setFlightResult();
    }
}
