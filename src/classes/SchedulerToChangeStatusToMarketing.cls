global class SchedulerToChangeStatusToMarketing implements Schedulable
{
    global void execute(SchedulableContext SC) {

      changeStatusToMarketing cstm = new changeStatusToMarketing();
      String batchid=Database.executeBatch(cstm,200);

   }

}