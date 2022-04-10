import { LightningElement,wire,api} from 'lwc';
import Account_Name from '@salesforce/schema/Account.Name';
import { getFieldValue,getRecord } from 'lightning/uiRecordApi';
export default class NameAccountDisplay extends LightningElement {

  @api recordId;
  @wire(getRecord,{recordId:"$recordId",fields:[Account_Name]})
  accountName;

  get accname(){
      return getFieldValue(this.accountName.data,Account_Name);
  }

}