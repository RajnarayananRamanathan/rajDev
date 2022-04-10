({
    myAction : function(component, event, helper) {
        var compevent = component.getEvent('compEvent');
        compevent.setParams({"stringValue":"Test Value"});
        compevent.fire();
    }
})