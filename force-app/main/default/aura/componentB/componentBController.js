({
    handleEvent : function(component, event, helper) {
        alert('Inn 1 c');
        var response = event.getParam("teststring"); 
        component.set('v.dataValue',response);
        alert('Inn 2 c');
    }
})