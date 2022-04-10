@isTest
private class TestRestrictContactByName 
{   
    
    @isTest static void testCaseInsertion()
    {
        test.startTest(); 
        Contact contactRecord = new Contact(FirstName = 'Raj',LastName = 'INVALIDNAME');
        try{
        insert contactRecord;
        }
        catch(Exception e)
        {
            
        }
        test.stopTest();
    }   
    
}