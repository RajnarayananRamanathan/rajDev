import { LightningElement, track, wire} from 'lwc'; 
import getAccountList from '@salesforce/apex/testAccounts.getAccountList';
import updateAccounts from '@salesforce/apex/testAccounts.updateAccounts';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class lwcPageHeader extends LightningElement {
    accounts;
    columns = [        
        { label: 'Name', fieldName: 'Name', type: 'text', editable: true },
        { label: 'Type', fieldName: 'Type', type: 'text'},
        { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true },
        { label: 'Interest', fieldName: 'Interest_Rate__c', type: 'percent', editable: true ,cellAttributes:{ alignment: 'left'}}
    ];  
    error;
    draftValues = [];
    wiredAccountList = [];

    @wire(getAccountList) wiredAccounts(result) 
    {
        this.wiredAccountList = result;
        if (result.data) {            
            this.accounts = result.data;
            this.error = undefined;            
        } else if (result.error) {
            this.error = result.error;
            this.accounts = undefined;
        }
    }
    
    async handleSave( event ) {
        const updatedFields = event.detail.draftValues;        
        await updateAccounts( { data: updatedFields } )
        .then( result => {            
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Your changes are saved.',                    
                    variant: 'success'
                })
            );
            refreshApex(this.wiredAccountList)
            .then(() => {                
                this.draftValues = [];
              });
            
        }).catch( (error) => {            
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or refreshing records',
                    message: error.body.message,
                    variant: 'error'
                })
            );

        });

    }   
}