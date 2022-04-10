({
    onChangeHandler : function(component, event, helper) {
        console.log('Inn parent');
        var childComp = component.find('childComponents');
        childComp.callChildMethod(event.getSource().get('v.value'));
    }
})