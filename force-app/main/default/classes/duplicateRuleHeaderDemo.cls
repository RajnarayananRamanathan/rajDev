public class duplicateRuleHeaderDemo {
    public static void method1()
    {
        Database.DMLOptions dml=new Database.DMLOptions();
        dml.DuplicateRuleHeader.allowSave=true;
        
        Account aa=new Account(Name='sFroce');
        Database.SaveResult sr=Database.insert(aa,dml);
        if(sr.isSuccess())
           system.debug('account inserted sucessfully');
    }

}