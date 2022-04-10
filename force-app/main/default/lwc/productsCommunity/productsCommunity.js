import { LightningElement,api } from 'lwc';

export default class ProductsCommunity extends LightningElement {
    @api urlParam = 'Appelles';
    
  /*  connectedCallback() {
        console.log('Inn new 1');
        let testURL = window.location.href;
        console.log('Inn new 2',testURL);
        let newURL = new URL(testURL).searchParams;
        console.log('Inn new 3',newURL);
        console.log('id ===> '+newURL.get('productName'));
        this.urlParam = newURL.get('productName');        
    }*/
}