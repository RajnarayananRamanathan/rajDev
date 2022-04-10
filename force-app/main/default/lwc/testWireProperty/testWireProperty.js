import { LightningElement,wire,api } from 'lwc';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import Account_Name from '@salesforce/schema/Account.Name'
export default class TestWireProperty extends LightningElement {

@api recordId;
@wire(getRecord,{recordId:'$recordId',fields:[Account_Name]})
accountName;

get accName()
{
    console.log('this.accountName.data---',this.accountName.data);
    return getFieldValue(this.accountName.data,Account_Name);
}
}