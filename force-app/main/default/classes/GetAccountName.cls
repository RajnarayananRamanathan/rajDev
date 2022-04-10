public class GetAccountName {
    
    @auraEnabled
    public static Account getAccount(Id RecordId)
    {
        return [SELECT Id,Name FROM Account WHERE Id=:RecordId];
    }
    
    @auraEnabled
    public static List<Account> getAccounts()
    {
        return [SELECT Id,Name,Type FROM Account limit 10];
    }
}