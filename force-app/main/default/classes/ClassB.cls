public without sharing class ClassB {
    
    @auraEnabled
    public static List<Test__c> classBmethod()
    {        
        system.debug('Inn classBmethod');
        List<Test__c> returnValues = ClassC.classCmethod();
        system.debug('returnValues B' +returnValues); 
        return returnValues;
    }
}