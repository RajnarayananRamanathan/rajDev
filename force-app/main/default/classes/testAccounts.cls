public with sharing class testAccounts {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        list<Account> a = [select id,name,type,phone,Interest_Rate__c from account limit 100];        
       return a;
    }

    @AuraEnabled
    public static string updateAccounts( Object data ) {
        
        List < Account > accsForUpdate = ( List < Account > ) JSON.deserialize(
            JSON.serialize( data ),
            List < Account >.class
        );
        try {
            update accsForUpdate;
            return 'Success: Account(s) updated successfully';
        }
        catch (Exception e) {
            return 'The following exception has occurred: ' + e.getMessage();
        }

    }
     
}