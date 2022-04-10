({
    doInit : function(component, event, helper) {
        console.log('Inn dataTable init',component.get('v.objectName'));
        console.log('col',component.get('v.columns'));
        var action = component.get("c.getData");
        action.setParams({objectName : component.get('v.objectName'),
                          objectFields : component.get('v.fields')});
        action.setCallback(this,function(response){
            console.log('response',response.getState());
            if(response.getState() === "SUCCESS"){
                console.log('result ',response.getReturnValue());
                component.set('v.data',response.getReturnValue());
            }            
        });
        $A.enqueueAction(action);
    }
})