import { LightningElement } from 'lwc';

export default class PicklistTest extends LightningElement {

    get options() {
        return [
            { label: 'None', value: '' },
            { label: 'A', value: 'Apple' },
            { label: 'B', value: 'Bat' },
            { label: 'C', value: 'Cup' },
        ];
    }
    value='';

    handleChange(event){
        alert(event.detail.value)        
    }
}