global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> opptys = [SELECT Id,LeadSource
                             FROM Lead
                             WHERE LeadSource = ''];
        for(Integer i = 0;i<opptys.size();i++)
        {
            opptys[i].LeadSource = 'Dreamforce';
        }
        Update opptys;
    }
}