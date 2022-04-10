@RestResource(urlMapping='/apexSecurityRest')
global with sharing class ApexSecurityRest {
    @HttpGet
    global static Contact doGet() {
        Id recordId = RestContext.request.params.get('id');
        Contact result;
        if (recordId == null) {
            throw new FunctionalException('Id parameter is required');
        }
        List<Contact> results = [SELECT id, Name, Description, Title, Top_Secret__c, Account.Name FROM Contact WHERE Id = :recordId];
        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.READABLE, results);
        if (!securityDecision.getRecords().isEmpty()) {
            result = (Contact)securityDecision.getRecords()[0];
            if (result.isSet('Description')){
                result.Description = result?.Account?.Name;
            }
            else {
             throw new SecurityException('You don\'t have access to all contact fields required to use this API');
           	}
        }
        return result;
    }
    public class FunctionalException extends Exception{}
    public class SecurityException extends Exception{}
}