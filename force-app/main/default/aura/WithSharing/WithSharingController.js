({
    myAction : function(component, event, helper) {
        
        var action = component.get("c.classAmethod");
        action.setCallback(this,function(response){
            
            if(response.getState() === 'SUCCESS'){                
                component.set("v.AccountList",JSON.stringify(response.getReturnValue()));
            }
            
        });
        $A.enqueueAction(action);
    }
})