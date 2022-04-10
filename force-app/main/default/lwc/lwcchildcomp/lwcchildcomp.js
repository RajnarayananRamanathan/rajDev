import { api, LightningElement } from 'lwc';

export default class Lwcchildcomp extends LightningElement {

    productValue = 'Citrus';
    @api
    callingFunction(productname)
    {    
    this.productValue = productname;
    const toParent = new CustomEvent('fromchild',{detail:{Dong:'Real'}});
    this.dispatchEvent(toParent);
    }
}