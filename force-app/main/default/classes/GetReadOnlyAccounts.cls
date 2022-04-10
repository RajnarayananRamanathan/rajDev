public with sharing class GetReadOnlyAccounts {
    public GetReadOnlyAccounts() {

    }

    @AuraEnabled 
    public static List<Account> getAllAccounts(){
        try {
            List<Account> accList= [SELECT Id,Name FROM Account];
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}