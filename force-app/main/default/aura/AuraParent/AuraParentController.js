({
	myAction : function(component, event, helper) {
		var eventValue = event.getParam('stringValue');
        console.log('eventValue---',eventValue);
        alert('eventValue--'+eventValue);
	}
})