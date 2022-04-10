public class qwer {
    public static void method1()
    {
        List<List<sObject>> sresults=[FIND 'Mission Control' IN ALL FIELDS RETURNING Contact(FirstName,LastName)];
		System.debug((Contact[])sresults[0]);
    }

}