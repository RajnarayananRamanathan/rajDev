({
    doInit:function(component, event, helper)
    {
        helper.helperMethod(component, event, helper);
    },
    myAction : function(component, event, helper) {
        console.log('Inn child');
        var vals = event.getParam('arguments');
        console.log('vals',vals);
        console.log('vals',vals.pickValue);
        if(vals){     
            console.log('vals 12',vals.pickValue);
            component.set("v.pickValue",vals.pickValue);
            component.set("v.pickValue","Test");
        }
    }
})