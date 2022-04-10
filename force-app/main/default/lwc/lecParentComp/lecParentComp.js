import { LightningElement } from 'lwc';

export default class LecParentComp extends LightningElement {
    
    products = [];
    fromC= 'test';
    connectedCallback(){
        this.products = [{value:'Apple',label:'Aaple'},{value:'Banana',label:'banaana'}];
    }

    changehandle(event){
     this.template.querySelector('c-lwcchildcomp').callingFunction(event.target.value);
    }

    fromChildData(event){
        this.fromC = event.detail.Dong;
    }
}