@isTest
public class AccountProcessorTest {
    
    @testsetup
    static void createTestData() 
    {                      
        test.startTest();
        Account testAccount = new Account();
        testAccount.Name='Test Account' ;
        INSERT testAccount;       
        
        Contact cont = new Contact();
        cont.FirstName='Test';
        cont.LastName='Test';
        cont.Accountid= testAccount.id;
        insert cont;
        
        Account testAccount1 = new Account();
        testAccount1.Name='Test Account a' ;
        INSERT testAccount1; 
        
        Contact cont1 = new Contact();
        cont1.FirstName='Test1';
        cont1.LastName='Test1';
        cont1.Accountid= testAccount1.id;
        insert cont1;
        
        test.stopTest();
    }
    
    @IsTest
    private static void testSendSms() {        
        Test.startTest();
        List<Id> accIds = new List<Id>();
        List<Account> acc = [SELECT Id FROM Account];
        for(Account a : acc)
            accIds.add(a.id);
        
        AccountProcessor.countContacts(accIds);
        Test.stopTest();                      
    }
}