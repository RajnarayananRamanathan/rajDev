import { LightningElement,wire } from 'lwc';
import messageChannel from '@salesforce/messageChannel/sample__c';
import { subscribe, MessageContext } from 'lightning/messageService';

export default class EventCompB extends LightningElement {

    messageReceived;    

    @wire(MessageContext)
    messageContext;   

   connectedCallback() {
        this.handleSubscribe();
    }
    handleSubscribe() {
        subscribe(this.messageContext, messageChannel, (message) => {
            console.log(message.messageText);
            this.messageReceived = message.messageText;
        });
    }
}