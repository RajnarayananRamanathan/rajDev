({
    myAction : function(component, event, helper) {
        console.log('inside child');
        var evenl = event.getParams('arguments');
        alert('evenl1--'+evenl.passedValue);
        alert('evenl2--'+evenl.passedValue1);
    }
})