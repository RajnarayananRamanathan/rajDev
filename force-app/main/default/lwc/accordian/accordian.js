import { LightningElement, track, wire } from 'lwc';
import getAccountContact from '@salesforce/apex/DynamicAccordion.getAccountContacts';

export default class DynamicAccordion extends LightningElement {

    @track accntConts;
   
    @wire(getAccountContact)
    wiredAccountContacts({error, data}){
        if(data){
            this.accntConts = data;
            console.log('Print data ',data);
        }
        if(error){
            console.log('Print error ',error);
        }
    }

    handleToggleSection(event){
        console.log('Print Section Name ',event.detail.openSections);
    }
}