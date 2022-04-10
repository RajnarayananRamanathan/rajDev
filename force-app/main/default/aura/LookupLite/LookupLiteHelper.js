({
    searchRecordsHelper : function(component, helper) {
        $A.util.removeClass(component.find("Spinner"), "slds-hide");
        var fieldName = component.get('v.fieldName');
        var action = component.get('c.fetchRecords');
        //action.setStorable();
        action.setParams({
            'objectName' : component.get('v.objectName'),
            'filterField' : fieldName,
            'searchString' : component.get('v.searchString')
        });
        action.setCallback(this,function(response){
            var result = response.getReturnValue();
            console.log('result'+result);
            if(response.getState() === 'SUCCESS') {
                // To check if records are present or not
                if(result.length > 0) {
                    var value = component.get('v.value');
                    // To check if value is prepopulated in value attribute or not
                    if( $A.util.isEmpty(value) ) {
                        $A.util.addClass(component.find('resultsDiv'),'slds-is-open');
                        helper.dynamicCreation(component, result, fieldName);
                        component.set('v.recordsList',result);
                    } else {
                        var index = result.findIndex(x => x.Id === value)
                        if(index != -1) {
                            var selectedRecord = result[index];
                        }
                        component.set('v.selectedRecord',selectedRecord[fieldName]);
                    }
                } else {
                    helper.dynamicCreation(component, 'No Data Found', fieldName);
                    $A.util.addClass(component.find('resultsDiv'),'slds-is-open');
                }
            } else {
                helper.dynamicCreation(component, 'No Server Response or client is offline', fieldName);
            }
            $A.util.addClass(component.find("Spinner"), "slds-hide");
        });
        $A.enqueueAction(action);
    },

    // Dynamic creation of div for dropdown list
    dynamicCreation : function(component, recordsList, fieldName) {
        var recordId = 'record-'+component.get('v.uniqueId');
        var recordDiv = document.getElementById(recordId);
        while (recordDiv.firstChild) recordDiv.removeChild(recordDiv.firstChild);
        
        if(Array.isArray(recordsList) && recordsList.length) {
            const len = recordsList.length;
            for(let k = 0; k<len; k++) {
                var li = document.createElement("li");
                li.id = recordsList[k].Id;
                li.appendChild(document.createTextNode(recordsList[k][fieldName]));
                recordDiv.appendChild(li);
            }
        } else {
            var li = document.createElement("li");
            li.id = '';
            li.appendChild(document.createTextNode(recordsList));
            recordDiv.appendChild(li);
        }
    }
})