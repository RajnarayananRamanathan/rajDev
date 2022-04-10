({
    getController : function(component, event, helper) {
        component.testMethod();
    },
    anotherController : function(component, event, helper) {
        component.set('v.testAtt','Value is there');
    }
    
})