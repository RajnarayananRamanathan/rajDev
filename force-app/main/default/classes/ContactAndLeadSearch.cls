public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String arg){         
        String searchQuery = 'FIND \'' + arg + '\' IN ALL FIELDS RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)'; 
        List<List<SObject>> searchList = search.query(searchQuery);    
        return searchList;
    }    
}