public with sharing class AccountLWC {
    public AccountLWC() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountRecord(){
        return [SELECT Id,Name FROM Account];
        
    }
}