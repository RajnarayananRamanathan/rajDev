public class SaveResultClass {
    
    public static void createAccount()
    {
        Account a = new Account(Name='h');
        Account b = new Account(Name='i');
        Account c = new Account();
        Account d = new Account(Name='j');
        List<Account> accountList = new List<Account>{a,b,c,d};
            List<Account> sucessAccounts = new List<Account>();
        List<Account> failureAccounts = new List<Account>();
        Database.SaveResult[] resultRecords = Database.insert(accountList,false);
        for(Integer i=0;i<resultRecords.size();i++){
            if(resultRecords[i].isSuccess())
            {
                system.debug('sucess --- '+resultRecords[i]);
                // sucessAccounts.add(sr);
            }
            else
            {
                system.debug('error --- '+resultRecords[i]);
                system.debug(accountList[i]);
                for(Database.Error err : resultRecords[i].getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }
    }
    
}