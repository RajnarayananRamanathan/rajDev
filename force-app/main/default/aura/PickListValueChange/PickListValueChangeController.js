({
    myAction : function(component, event, helper) {
       /* var listValue = [{value:'Apple',label:'Applee'},
                        {value:'Ball',label:'Ball'}];
        component.set('v.picklistProd',listValue);  */      
    },
    valueChange : function(component, event, helper){
        console.log('event--',event);
        var eventValue = event.getSource().get("v.value");
        console.log(eventValue);
        alert('eventValue--'+eventValue);
    }
})