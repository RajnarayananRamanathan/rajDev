public with sharing class LookupLiteController {
    
    @AuraEnabled 
    public static List<sObject> fetchRecords( String objectName, String filterField, String searchString ) 
    {
        String query = 'SELECT Id,Name FROM Account';
        
        return Database.query(query);
    }
}