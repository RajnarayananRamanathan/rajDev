import { LightningElement } from 'lwc';

export default class Displaythepicklist extends LightningElement {

   get products(){
     return [{value:'Apple',label:'Applee'},{value:'Banana',label:'Banaana'}];
   } 

   changeValue(event)
   {
    alert(event.target.value);
   }
}