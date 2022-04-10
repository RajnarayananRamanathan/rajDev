public inherited sharing class DynamicAccordion {
    public DynamicAccordion() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountContacts(){
        return [SELECT Name, (SELECT Name from Contacts) from Account];
    }
}