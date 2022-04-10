public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer n,String name){
        List<Contact> contactsList = new List<Contact>();
        for(Integer i = 0;i < n ;i++){
            contactsList.add(new Contact(FirstName = 'Test'+i,LastName = name));
        }
        return contactsList;
    }
    
}