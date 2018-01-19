public class Lead_Distribute_Schedular implements Schedulable{

    public Lead_Distribute_Schedular()
    {
        
    }
    
    public void execute(SchedulableContext SC)
    {
    string cronid;
cronid=sc.getTriggerId();

CronTrigger scheduledjob=new CronTrigger(Id=cronid);
string value=[Select CronExpression From CronTrigger where id=:cronid limit 1].CronExpression;
List <string> value1 =value.split(' ');

system.abortJob(scheduledjob.Id); //abort scheduled job

Datetime sysTime = System.now();
integer minute=integer.valueof(value1[1]);
integer hour1=sysTime.hour();
if(integer.valueOf(value1[1])==55)
{
minute=0;
}
else
{
minute=minute+5;
}

String chron_exp = '' + sysTime.second() + ' ' + minute + ' 0-23 * * ?';
//SchedulerMassEmail scheduler = new SchedulerMassEmail();
Lead_Distribute_Schedular scheduler = new Lead_Distribute_Schedular();
         String batchid = Database.executeBatch(new Distribute_Leads(),20);
         System.debug('Batch Id is:'+batchid);
//    System.schedule('Schedule Lead_Distribution', '0 2 * * * ?', new Lead_Distribute_Schedular());
string id=System.schedule('DistibutLeadsAfter5Minutes',chron_exp,scheduler);
System.debug('Schedular  job id:'+id);
    }
    
    

}