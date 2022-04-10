({
    doInit: function(component, event, helper) 
    {         
        var action = component.get("c.init");
        action.setCallback(this, function(result)
                           {
                               var accounts = result.getReturnValue();
                               component.set("v.sobject", accounts);
                           });
        $A.enqueueAction(action);
    },
    createContract : function(component, event, helper) 
    {        
        if (helper.validateAccountList(component, event)) 
        {     
            var newAcc = component.get("v.conInfo");            
            if(newAcc.Name!="")
            {         
                if(helper.validateUrl(component,event))
                {             
                    var action = component.get("c.saveAccount");
                    action.setParams({ 
                        "accList": newAcc
                    });
                    action.setCallback(this, function(a) 
                                       {
                                           var state = a.getState();
                                           if (state === "SUCCESS") 
                                           {
                                               var name = a.getReturnValue();                                        
                                               component.set("v.MasterId",name);
                                               helper.saveAccountList(component, event);                                                                                                           
                                               var navEvt = $A.get("e.force:navigateToSObject");
                                               navEvt.setParams({"recordId":name,"slideDevName": "detail"});
                                               navEvt.fire();          
                                               
                                               var toastEvent = $A.get("e.force:showToast");
                                               toastEvent.setParams({
                                                   "type":"Success",
                                                   "title": "Success!",
                                                   "message": "The record has been saved successfully."
                                               });
                                               
                                           }
                                           else
                                           {                                              
                                               component.set("v.showErrors",true);
                                               component.set("v.errorMessage","Please Check All the Values");               
                                           }               
                                           toastEvent.fire();
                                       });                    
                    $A.enqueueAction(action);
                    
                }
            }
            else
            {
                component.set("v.showErrors",true);
                component.set("v.errorMessage","Please Fill Mapping Contract Name");
            }
        }               
    },
    
    onControllerFieldChange : function(component, event, helper) {
        var parentValue = component.find('parentpicklist').get('v.value');
        var action = component.get("c.init1");
        var check=false;
        action.setParams({"parentValue":parentValue});
        action.setCallback(this, function(result){
            var demooo = result.getReturnValue();          
            var copy= component.get("v.conInfo.Contract_Type__c");            
            component.set("v.dependentOptions", demooo);
            if(demooo.length==0)
            {
                component.set("v.conInfo.Contract_Type__c","");               
            }
            else
            {
                for(var temp in demooo)
                {
                    if(temp==copy)
                    {
                        check=true;
                    }
                }
                if(check==false)
                {
                    component.set("v.conInfo.Contract_Type__c","");
                }
            }
            
        });	
        $A.enqueueAction(action);
        if(parentValue !="")
            component.set("v.disabledPick",false);
        else
            component.set("v.disabledPick",true);
    },
    
    addRow: function(component, event, helper) 
    {
        helper.addAccountRecord(component, event);
    },
    
    removeRow: function(component, event, helper) 
    {        
        var accountList = component.get("v.targetList");        
        var selectedItem = event.currentTarget;        
        var index = selectedItem.dataset.record;
        accountList.splice(index, 1);
        component.set("v.targetList", accountList);
    },
    onClickCancel : function(component, event, helper)
    {                        
        component.find("overlayLibMappingCreate").notifyClose();        
    },
    handleCloseClick : function(component, event, helper)
    {                        
        component.set("v.showErrors",false);   
    }
})