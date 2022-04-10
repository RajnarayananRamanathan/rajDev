import { LightningElement ,wire} from 'lwc';
import getAccountRecord from '@salesforce/apex/AccountLWC.getAccountRecord';

export default class AccountLWCAPEX extends LightningElement {
    @wire(getAccountRecord) accounts;
}