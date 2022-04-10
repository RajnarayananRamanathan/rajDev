import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/GetAccountName.getAccounts';

export default class LwcdataTable extends LightningElement {

    data = [];
    error;
    columns = [];

connectedCallback()
{
    this.columns = [{label:'Account Name',fieldName:'Name',type:'text'},
                {label:'Account Type',fieldName:'Type',type:'text'}];

    getAccounts().then(result =>{ this.data = result}).catch(error => {this.error = error});        
}

}