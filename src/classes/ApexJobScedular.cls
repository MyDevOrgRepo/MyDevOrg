public class ApexJobScedular implements Schedulable{
    String query;
    ApexJobTest ajt = new ApexJobTest();
    List<opportunity> oppToAdd;
    
    
    public ApexJobScedular()
    {
        //query='select name from opportunity limit 1';
        oppToAdd = ajt.insertOpp();
    }
    
    public void execute(SchedulableContext sc)
    {
        ID batchid   = Database.executeBatch(new ApexJobTestInsertBatch(oppToAdd),200);
        System.debug('Batch Id:'+batchid);
    }

}