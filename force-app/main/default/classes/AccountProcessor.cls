public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<Id> accountIds) {  
        List<Account> accs = [Select Id, Name,Number_of_Contacts__c, (Select Id, Name from Contacts) from Account WHERE Id IN:accountIds];
        for(Integer i = 0;i<accs.size();i++)
        {
            accs[i].Number_of_Contacts__c = (accs[i].contacts).size();
        }
        update accs;
    }
    
}