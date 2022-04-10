({
    myAction : function(component, event, helper) { 
        console.log('1');
        var appEvent = $A.get('e.c:ApplicationEventTest');
        console.log('2');
        appEvent.setParams({"passedValue":"a","passedValue1":"b"});
        console.log('3');
        appEvent.fire();
    }
})