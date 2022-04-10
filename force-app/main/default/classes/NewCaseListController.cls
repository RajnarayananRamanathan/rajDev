public class NewCaseListController {
    private  String filterOrder='New';
    public  List<Case> getNewCases()
    {
        List<Case> newCase=[SELECt ID,CaseNumber From Case  WHERE Status = :filterOrder];
    return newCase;
    }

}