@isTest  
private class MetadataServiceTest
{        
    private class WebServiceMockImpl implements WebServiceMock 
    {
        public void doInvoke(
            Object stub, Object request, Map<String, Object> response,
            String endpoint, String soapAction, String requestName,
            String responseNS, String responseName, String responseType) 
        {
            return;
        }
    }    
    
    @IsTest
    private static void coverGeneratedCodeCRUDOperations()
    {	
        // Null Web Service mock implementation
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        // Only required to workaround a current code coverage bug in the platform
        MetadataService metaDataService = new MetadataService();
        // Invoke operations     
        Test.startTest();    
        MetadataService.MetadataPort metaDataPort = new MetadataService.MetadataPort();
        Test.stopTest();
    }               
    
    @IsTest
    private static void coverGeneratedCodeTypes()
    {    	       
        // Reference types
        Test.startTest();
        new MetadataService();
        new MetadataService.RecordType();                
        new MetadataService.RecordTypePicklistValue();        
        new MetadataService.Metadata();
        new MetadataService.PicklistValue();        
        new MetadataService.readMetadata_element();
        new MetadataService.ReadRecordTypeResult();
        new MetadataService.readRecordTypeResponse_element();        
        new MetadataService.GlobalPicklistValue();
        new MetadataService.PicklistValue();
        Test.stopTest();
    }
    
    @IsTest
    private static void elfMissingGetRecordsTest() { // elf patch
        Test.startTest();
        new MetadataService.ReadRecordTypeResult().getRecords();
        Test.stopTest();
    }
    
    @IsTest
    private static void elfMissingGetResultTest() {
        Test.startTest();              
        new MetadataService.readRecordTypeResponse_element().getResult();       
        Test.stopTest();
    }    
}