@isTest
private class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> Nyaccounts = new List<Account>();                
        for (Integer i=0;i<50;i++) {
            Nyaccounts.add(new Account(Name = 'Test'+i,BillingState='NY'));
        }
        insert Nyaccounts; 
        
        List<Account> caaccounts = new List<Account>();                
        for (Integer i=0;i<50;i++) {
            caaccounts.add(new Account(Name = 'Test'+i+i,BillingState='CA'));
        }
        insert caaccounts; 
        
    }
    @isTest static void test() {
        Test.startTest();
        
        Contact cont1 = new Contact();
        cont1.FirstName='Test1';
        cont1.LastName='Test1';       
        
        AddPrimaryContact updater = new AddPrimaryContact(cont1, 'CA');
        // startTest/stopTest block to force async processes to run        
        System.enqueueJob(updater);
        Test.stopTest();               
    }
}