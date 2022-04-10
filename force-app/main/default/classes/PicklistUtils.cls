/**
* Utility class for working with Picklists
*/
global with sharing class PicklistUtils {
    
    public static void fun(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String host = System.Url.getSalesforceBaseURL().toExternalForm();
        String url = host + '/services/data/v42.0/ui-api/object-info/Task/picklist-values/0120o000000vzcnAAA/Subject';        
        request.setEndpoint(url);
        request.setMethod('GET');  
        request.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
        HttpResponse response;        
        response = http.send(request);  
        system.debug('response.getBody()--'+response.getBody());
        Map<String, Object> meta = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        system.debug(meta);
        List<SelectOption> optionsList = new List<SelectOption>();
        optionsList.add(new SelectOption('--None--', ''));
        if(meta.containsKey('values')){                                
            for(Object o: (List<Object> )meta.get('values')){
                Map<String, object > temp = (Map<String, object>)o;                    
                optionsList.add(new SelectOption((String)temp.get('label'), (String)temp.get('value')));
            }
        } 
    }
}