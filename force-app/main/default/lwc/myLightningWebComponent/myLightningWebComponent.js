import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class MyLightningWebComponent extends NavigationMixin(LightningElement) {
 @api buttonText;

 handleClick() {
     alert('Inn navigation');
     console.log('Inn navigation');     
    this[NavigationMixin.Navigate]({
        type: 'comm__namedPage',
        attributes: {
            pageName: 'products'
        },
        state: {
            productName: 'USC'
           }        
    });
   }
}