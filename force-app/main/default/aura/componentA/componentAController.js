({
    doInit : function(component, event, helper) {       
        var event = component.getEvent("cmpEvent"); 
        
        //set the response value inside eventResponse of componentEvent attribute   
        event.setParams({
            "teststring" : "This is response from parent "
        });         
        //fire the event    
        event.fire();            
    }
})