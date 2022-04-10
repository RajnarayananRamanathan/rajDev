public class ContactsListController {
    private String sortOrder='Lastname';
    
    public List<Contact> getContacts()
    {
        List<Contact> results=Database.query(' SELECt ID,FirstName,LastName,Title,Email ' + ' From Contact ' + ' ORDER BY '+ sortOrder+' ASC '+' LIMIT 10 ');
        
    return results;
    }
    public void sortByLastName() {
    this.sortOrder = 'LastName';
}
    
public void sortByFirstName() {
    this.sortOrder = 'FirstName';
}
}