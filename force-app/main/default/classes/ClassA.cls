public with sharing class ClassA {        
    @auraEnabled
    public static List<Test__c> classAmethod()
    {
        system.debug('Inn classAmethod');
        List<Test__c> returnValues = ClassC.classCmethod();
        system.debug('returnValues A' +returnValues);
        return returnValues;
    }
    
}