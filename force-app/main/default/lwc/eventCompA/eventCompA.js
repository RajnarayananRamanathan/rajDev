import { LightningElement,wire} from 'lwc';
import messageChannel from '@salesforce/messageChannel/sample__c';
import {publish, MessageContext} from 'lightning/messageService'

export default class EventCompA extends LightningElement {

    @wire(MessageContext)
    messageContext;

    handleClick()
    {
        let message = {messageText: 'This is a test'};
        publish(this.messageContext, messageChannel, message);
    }
}