global class Demo implements Iterator<Contact> {
    List <Contact> con{get; set;}
    Integer i{get;set;}
    
    public Demo()
    {
        con = [SELECT Id,lastname FROM Contact LIMIT 5];
        i=0;
    }
    
    global Boolean hasNext()
    {
        if(i>=con.size())
            return false;
        else
            return true;
    }
    global Contact next()
    {
        if(i==con.size())
        {
            return null;
        }
        i++;
        return con[i-1];
    }
    

}