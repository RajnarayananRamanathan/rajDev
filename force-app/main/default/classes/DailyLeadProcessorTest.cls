@isTest
private class DailyLeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();                
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastname='1'+i, company='1'+i,LeadSource = ''));
        }
        insert leads;                
    }
    @isTest static void test() {
        Test.startTest();   
        DailyLeadProcessor reminder = new DailyLeadProcessor();
        String sch = '20 30 8 10 2 ?';
        String jobID = System.schedule('Remind Opp Owners', sch, reminder);
        Test.stopTest();               
    }
}