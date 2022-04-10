import { LightningElement } from 'lwc';
import {createRecord} from 'lightning/uiRecordApi';
import Acc_obj from '@salesforce/schema/Account';

export default class AccountCreationLDS extends LightningElement {

    accName='';

    nameChange(event)
    {
        this.accName = event.target.value;
    }

    createAccount()
    {               
        const fields = {'Name' : this.accName};        
        const objectRecordInput = {'apiName' :Acc_obj.objectApiName,fields};        

        createRecord(objectRecordInput)
        .then((res) => {
            console.log('res',res);
          alert('created'+res.id);
        }).catch((error) => {
           alert(error);
        });
       
    }

    
}