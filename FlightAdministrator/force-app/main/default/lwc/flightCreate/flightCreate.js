import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import fetchAirports from '@salesforce/apex/FlightController.fetchAirports';
import fetchFlights from '@salesforce/apex/FlightController.fetchFlights';
import saveFlight from '@salesforce/apex/FlightController.saveFlight';

export default class FlightCreate extends LightningElement {
    departureAirportLabel;
    departureAirportValue;

    arrivalAirportLabel;
    arrivalAirportValue;

    airportOptions = [];
    savedtFlight = [];

    @wire(fetchAirports)
    pupulateAirportOptions({error, data}) {
        if(data) {
            this.airportAllData = [...data];
            let airportData = [];

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

    handleChange(event) {
        if(event.target.name == 'departureAirportName') {
            this.departureAirportLabel = event.target.label;
            this.departureAirportValue = event.target.value;
        } else if(event.target.name == 'arrivalAirportName') {
            this.arrivalAirportLabel = event.target.label;
            this.arrivalAirportValue = event.target.value;
        }
    }

    handleButtonCancel() {
        console.log('Method handleButtonCancel is calling.');
    }

    handleButtonSave() {
        let airportIdsForFlight = [];

        airportIdsForFlight.push(this.departureAirportValue);
        airportIdsForFlight.push(this.arrivalAirportValue);

        saveFlight({airportIds: airportIdsForFlight});
    }
}