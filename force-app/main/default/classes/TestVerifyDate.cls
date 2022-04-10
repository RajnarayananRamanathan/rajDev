@isTest
private class TestVerifyDate 
{       
    
    @isTest static void testCaseInsertion()
    {
        test.startTest(); 
        Date myDate = Date.newInstance(2020, 11, 26);
        Date myDate1 = Date.newInstance(2020, 12, 12);
        VerifyDate.CheckDates(myDate,myDate1);
        Date myDate2 = Date.newInstance(2020, 12, 12);
        Date myDate3 = Date.newInstance(2021, 1, 29);
        VerifyDate.CheckDates(myDate2,myDate3);
        test.stopTest();
    }   
    
}