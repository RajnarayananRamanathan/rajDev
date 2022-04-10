public class accontecreation {
    public static void createtheAcc(){
        
        try
        {            
            Account a = new Account();
            insert a;            
        }
        catch(AccountException e){
            throw new AccountException(e,'lkansldknas');
        }
         catch(Exception e){
            System.debug('Dml Error is Found'+e.getMessage());
            
        }
        
    }
    
    
}