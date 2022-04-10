public class ComboBoxController {
    
    @AuraEnabled
    public static List<String> CustomerPriority()        
    {
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Account.CustomerPriority__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }  
        system.debug('returnvalues'+pickListValuesList);
        return pickListValuesList;
    }        
}