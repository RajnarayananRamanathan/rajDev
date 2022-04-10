public class ViewAsPDFController {
    
    public String TempString {get;set;}
    public String TempString1 {get;set;}
    public List<Account> accountList {get;set;}
    
    public String getbuildTable(){
        
        String tmp = '';
        
        for (integer i = 0; i <accountList.size(); i++){ 
            tmp += '<table bordercolor="#FFCC00" width:300" cellpadding="3" cellspacing="3" >' + '<tr>' + 
                '  <td colspan="4" align="center">' + accountList.get(i).Name +'</td></tr>' ;
        }
        
        tmp += '</table>';
        
        return tmp;
    }
    
    
    public ViewAsPDFController()
    {
        accountList= [SELECT Id,Name,AccountNumber FROM Account];
        
        TempString ='<h1>Apex PDF Test</h1>'+
            +'<apex:repeat value="String.escapeHtml4({!accountList})" var="String.escapeHtml4(alist)" id="theRepeat">'+
            +'String.escapeHtml4({!alist.Name})'+
            +'</apex:repeat>';
        
        TempString1 = getbuildTable();
    }
    
}