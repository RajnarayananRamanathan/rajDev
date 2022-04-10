public class AddPrimaryContact implements Queueable {
    private Contact con;
    private String st;
    public AddPrimaryContact(Contact conRecord, String state) {
        this.con = conRecord;
        this.st = state;
    }
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id,BillingState FROM Account WHERE BillingState=:st];
        List<Contact> contacts = new List<Contact>();
        for (Account account : accounts) {            
            contacts.add(new Contact(FirstName = con.FirstName,LastName = con.LastName));
        }
        Insert contacts;
    }
}