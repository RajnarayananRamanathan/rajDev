({  
    // To prepopulate the seleted value pill if value attribute is filled
    doInit : function( component, event, helper ) {
        $A.util.toggleClass(component.find('resultsDiv'),'slds-is-open');
        if( $A.util.isEmpty(component.get('v.uniqueId')) ) {
            component.set('v.uniqueId',Math.random());
        }
        if( !$A.util.isEmpty(component.get('v.value')) ) {
            helper.searchRecordsHelper( component, helper );
        }
    },

    // When a keyword is entered in search box
    searchRecords : function( component, event, helper ) {
        if(!$A.util.isEmpty(component.get('v.searchString'))) {
            helper.searchRecordsHelper( component, helper );
        } else {
            $A.util.removeClass(component.find('resultsDiv'),'slds-is-open');
        }
    },

    // When an item is selected
    selectItem : function( component, event, helper ) {
        if(!$A.util.isEmpty(event.target.id)) {
            var recordsList = component.get('v.recordsList');
            var selectedRecord;
            var index = recordsList.findIndex(x => x.Id === event.target.id)
            if(index != -1) {
                selectedRecord = recordsList[index];
            }
            component.set('v.selectedRecord',selectedRecord[component.get('v.fieldName')]);
            component.set('v.value',selectedRecord.Id);
            $A.util.removeClass(component.find('resultsDiv'),'slds-is-open');
        }
    },

    // To remove the selected item.
    removeItem : function( component, event, helper ) {
        component.set('v.selectedRecord','');
        component.set('v.value','');
        component.set('v.searchString','');
        setTimeout( function() {
            component.find( 'inputLookup' ).focus();
        }, 250);
    },

    // To close the dropdown if clicked outside the dropdown.
    blurEvent : function( component, event, helper ) {
        $A.util.removeClass(component.find('resultsDiv'),'slds-is-open');
    },
})