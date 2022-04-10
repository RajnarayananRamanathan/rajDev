global class AccountBatch implements Database.Batchable<Account>,Iterable<Account>,Iterator<Account>{
    
    public integer i;
    List<Account> acc;
    
    public AccountBatch()
    {
        acc = [SELECT Id,Name,Phone FROM Account];
        i = 0;
    }
    
    public Iterator<Account> iterator()
    {
        return this;
    }
    
    public boolean hasNext()
    {
        if(acc.size() <=i)
            return false;
        else
            return true;            
    }
    
    public Account next()
    {
        i++;
        return acc[i-1];
    }
    
    global Iterable<Account> start(Database.BatchableContext bc)
    {        
        return new AccountBatch();
    }
    
    global void execute(Database.BatchableContext bc,List<Account> scope)
    {
        List<Account> act = new List<Account>();
        for(Account acc: scope) {
            acc.phone = '123';
            act.add(acc);
        }
        update act;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }
}