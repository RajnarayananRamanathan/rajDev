public inherited sharing class ClassC {
    
    public static List<Test__c> classCmethod()
    {
        List<Test__c> testList = new List<Test__c>();
        
        try
        {
            testList = [SELECT Id,Name,Test_Field__c FROM Test__c LIMIT 10]; 
        }
        catch(Exception e)
        {
            system.debug('Access Error');  
        }
        
        return testList;
    }
}