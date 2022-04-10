import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import customSR from '@salesforce/resourceUrl/carousalTest';

export default class carousaltest extends LightningElement {

    connectedCallback() {
        Promise.all([            
            loadStyle(this, customSR),
        ])
            .then(() => {
                alert('Files loaded.');
            })
            .catch(error => {
                alert(error.body.message);
            });
       
    }
   
}