global class triggerEvents implements Schedulable
{

   
   global void execute(SchedulableContext sc) {
   System.debug('In Schedulable class execute method');
      sendMailforPassedEnddate smfped = new sendMailforPassedEnddate(); 
      database.executebatch(smfped);
   
}

}