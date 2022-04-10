public class TestClass {
    
    @auraEnabled
    public static List<AccountResult> getAccountData(Id accountId){
        List<AccountResult> results = new List<AccountResult>();
        for(Account acct: [SELECT Id,name,(SELECT Id FROM Cases),(SELECT Id FROM Contacts),
                           (SELECT Id FROM Opportunities)
                           FROM Account WHERE Id =:accountId]){
                               results.add(new AccountResult(acct));   
                           }        
        return results;        
    }
    
    class AccountResult {
        @AuraEnabled public Id id {get; set;}
        @AuraEnabled public String name {get; set;}
        @AuraEnabled public List<Case> cases {get; set;}
        @AuraEnabled public List<Contact> contacts {get; set;}
        @AuraEnabled public List<Opportunity> opportunities {get; set;}
        
        public AccountResult(Account a) {
            this.id = a.id;
            this.name = a.name;
            this.cases = a.cases;
            this.contacts = a.contacts;
            this.opportunities = a.opportunities;
        }
        
    }
}