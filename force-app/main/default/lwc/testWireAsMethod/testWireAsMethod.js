import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, api, wire } from 'lwc';
import AccountName from '@salesforce/schema/Account.Name';

export default class TestWireAsMethod extends LightningElement {
    @api recordId;
    accountData;
    errordata;
    @wire(getRecord, { recordId: '$recordId', fields: [AccountName] })
    wireAccountData({ error, data }) {
        if (data) {
            console.log('data', data);
            console.log('data fields', data.fields.Name.value);
            this.accountData = data.fields.Name.value;
        }
        else
            this.errordata = error;
    }
}