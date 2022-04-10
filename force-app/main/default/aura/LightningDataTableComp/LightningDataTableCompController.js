({
    myAction : function(component, event, helper) {
        console.log('Inside');
        component.set('v.columns',[{label:'Account Name',fieldName:'Name',type:'text'},
                                   {label:'Account Type',fieldName:'Type',type:'text'}]);
        
        var action = component.get('c.getAccounts');
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('state---',state)
            if(state === 'SUCCESS'){
                console.log('result',response.getReturnValue());
                component.set('v.accountList',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        console.log('Outside');
        
    }
})