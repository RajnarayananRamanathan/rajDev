public class AccountException extends Exception 
{
    public AccountException(Exception e, string sourceClass)
    {        
        system.debug('Exeption Name ******' + e);
    }
}