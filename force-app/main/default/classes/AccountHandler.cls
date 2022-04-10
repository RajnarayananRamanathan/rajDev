public class AccountHandler {
    
    public static Account insertNewAccount(String accountName){ 
        Account acct = new Account(Name=accountName);
        try{
            insert acct;
            return acct;
        }
        catch(Exception e)
        {
            return null;   
        }
        
    }
}