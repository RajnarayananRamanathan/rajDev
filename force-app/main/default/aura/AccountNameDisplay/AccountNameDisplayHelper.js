({
    helperMethod : function(component,event,helper) {
        
        var action = component.get('c.getAccount');
        action.setParams({RecordId:component.get('v.recordId')});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS')
            {
                component.set('v.accountData',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);        
    }
})