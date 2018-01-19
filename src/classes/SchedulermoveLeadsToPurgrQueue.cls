global class SchedulermoveLeadsToPurgrQueue implements Schedulable
{
    global void execute(SchedulableContext SC) {

      moveLeadsToPurgeQueue mltp = new moveLeadsToPurgeQueue();
      String batchid=Database.executeBatch(mltp,200);

   }

}