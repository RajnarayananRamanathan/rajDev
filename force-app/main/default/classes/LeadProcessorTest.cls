@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();                
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='1'+i, company='1'+i));
        }
        insert leads;              
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();               
    }
}