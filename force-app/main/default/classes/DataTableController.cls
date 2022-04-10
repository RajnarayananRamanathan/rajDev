public class DataTableController {
    @auraEnabled
    public static List<SObject> getData(String objectName,String objectFields){
        system.debug('Inn getObjectRecords');
        String queryString = 'SELECT '+objectFields+ ' FROM '+objectName+' LIMIT 10';  
        //List<sObject> resultData = Database.query(queryString);               
        return Database.query(queryString);               
    }    
}