public class SavepointDemo {
    public static void method1()
    {
        Account a=new Account(Name='CR7');
        insert a;
        System.assert(null,[SELECT AccountNumber FROM Account WHERE Id=:a.Id].AccountNumber	);
        
        Savepoint sp=Database.setSavepoint();
        
        a.AccountNumber='123';
        update a;
        System.assertEquals('123',[SELECT AccountNumber FROM Account WHERE Id=:a.Id].AccountNumber);
        
        Database.rollback(sp);
        System.assertEquals(null,[SELECT AccountNumber FROM Account WHERE Id=:a.Id].AccountNumber);
    }

}