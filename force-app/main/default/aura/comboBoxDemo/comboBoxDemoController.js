({
	doInit : function(component, event, helper) {        
        var temp=[];
		var action=component.get("c.CustomerPriority");               
        action.setCallback(this, function(response) {            
            var temp1=response.getReturnValue();
            temp1.forEach(function(element)
                          {
                              temp.push({value:element,label:element});
                          });
            component.set("v.options",temp);           
        });
        
         $A.enqueueAction(action);
	}
})