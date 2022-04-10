public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id)
    {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response'+response.getBody());        
        Map<String, Object>animal= new Map<String,Object>();        
        
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animal = (Map<String, Object>) results.get('animal');
        }
        return(String)animal.get('name');                
    }
    
}