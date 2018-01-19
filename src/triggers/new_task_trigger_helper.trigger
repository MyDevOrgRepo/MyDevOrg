trigger new_task_trigger_helper on Task (after update,after insert) {

    List<task> t1 = Trigger.new;
  List<id> l1 = new List<id>();
     
     List<id> whatids = new List<id>();
     List<id> whoids = new List<id>();
     
     List<id> accids = new list<id>();
     List<id> conids = new List<ID>();
     List<id> oppids = new list<id>();

            
        for(task t2:t1)
    {
        l1.add(t2.whatid);
        if(t2.whatid!=null)
        whatids.add(t2.whatid);
        if(t2.whoid!=null)
        whoids.add(t2.whoid);
        
    }
System.debug('What id :'+whatids);
    System.debug('Who id:'+whoids);
    System.debug('Size Whatid'+whatids.size());
    System.debug('Size Whoid'+whoids.size());
     if(whatids!=null)
     {
             for(id id1:whatids)
         {
                 String idToCheck = (String)id1;
                 if(idToCheck.startsWith('001'))
                 {
                     accids.add(id1);
                 }
                 else if(idToCheck.startsWith('006'))
                 {
                     oppids.add(id1);
                 }
                 
     
         }
         System.debug('accountids:'+accids);
         System.debug('opportunity ids:'+oppids);
     }
     if(whoids!=null)
     {
         for(id id1:whoids)
         {
             String idToCheck=id1;
             if(idToCheck.startsWith('003'))
             {
                 conids.add(id1);
             }
     
         }
     
     }
     
     
    /*
   Position__c s1=[select id,  first_activity_date__c,(select TaskCompletedDateTime__c from activityHistories where istask=true order by TaskCompletedDateTime__c   limit 1)   from position__C where id =:l1];

         if(Trigger.isAfter)
        {
             if(Trigger.isupdate)
              {     
                  for(task t2:t1)
                  {
                      
                          System.debug('in if');
                          
                           
                        String s12=s1.getSObjects('activityHistories')[0].get('TaskCompletedDateTime__c')+'';
        //          System.debug('s12'+s1.getSObjects('activityHistories')[0].get('TaskCompletedDateTime__c'));
      //                System.debug('s12:boolean:'+s12.equals('null'));
                          if(!s12.equals('null'))
                          {
   /*                   String[] myD = s12.split('-');
                              System.debug('myD:'+myD);
                        Integer myYear = integer.valueOf(myD[0]);
                        Integer myMonth = integer.valueOf(myD[1]);
                        String m1= myD[2];
                        String[] other =m1.split(' ');
                        Integer myDate = integer.valueOf(other[0]);
                        String[]  other12 =other[1].split(':');
                        Integer myhrs = integer.valueOf(other12[0]);
                        Integer myMin = integer.valueOf(other12[1]);
    */                          
                      //string str1='';
                              
                       
                        //str1=myMonth+'/'+myDate+'/'+myYear+' '+myhrs+':'+myMin+' AM';
                          //System.debug('str1:'+str1);
                       //   s1.first_activity_date__c=(DateTime)s1.getSObjects('activityHistories')[0].get('TaskCompletedDateTime__c');
                      
                         //str1=myMonth+'/'+myDate+'/'+myYear+' '+myhrs+':'+myMin+' PM';
                          //System.debug('str1:'+str1);
                      
                      
                        //s1.first_activity_date__c=DateTime.parse(str1);
                        //s1.first_activity_date__c=(DateTime)s1.getSObjects('activityHistories')[0].get('TaskCompletedDateTime__c');
              /*       }
                      else
                      {
                          s1.first_activity_date__c=DateTime.now();
                      }
                        update s1;
                        
                      
                  }
                  }
                  }
      */            
                  if(Trigger.isAfter)
                    {
                         if(Trigger.isInsert)
                          {  
                           Map<id,Integer> countTaskAcc = new  Map<id,Integer>();
                             Map<id,Integer> countTaskCon = new  Map<id,Integer>();
                              Map<id,Integer> countTaskopp = new  Map<id,Integer>();
                              if(whoids!=null)
                              {
                          List<AggregateResult> tskcnt = [select whoid,count(id) cnt from task where whoid in :whoids group by whoid];
                          for(AggregateResult agr : tskcnt)
                          {
                              String setwhoid=(String)(agr.get('whoid'));
                              setwhoid=setwhoid.substring(0,15);
                              Integer setTaskCount=(Integer)agr.get('cnt');
                              countTaskCon.put((ID)setwhoid,setTaskCount);
                          }
                          System.debug('Map of cons is:'+countTaskCon);
                          }
                          if(accids!=null)
                          {
                           List<AggregateResult> tskaccnt = [select whatid,count(id) cnt from task where whatid in :accids group by whatid];
                           for(AggregateResult agr : tskaccnt)
                          {
                              String setwhoid=(id)(agr.get('whatid'));
                              setwhoid = setwhoid.substring(0,15);
                              Integer setTaskCount=(Integer)agr.get('cnt');
                              countTaskAcc.put((ID)setwhoid,setTaskCount);
                          }
                          System.debug('Map of Accounts is:'+countTaskAcc);
                          }
                          
                           if(oppids!=null)
                           {
                           List<AggregateResult> tskopp = [select whatid,count(id) cnt from task where whatid in :oppids group by whatid];
                           
                           for(AggregateResult agr : tskopp)
                          {System.debug('In opportunity for loop');
                              String setwhoid=(id)(agr.get('whatid'));
                              System.debug('String opportunity whoid:'+setwhoid);
                              setwhoid = setwhoid.substring(0,15);
                              System.debug('String opportunity id:'+setwhoid);
                              Integer setTaskCount=(Integer)agr.get('cnt');
                              System.debug('opportunity Count is:'+setTaskCount);
                              countTaskOpp.put((ID)setwhoid,setTaskCount);
                          }
                          System.debug('Map of Opportunity is:'+countTaskOpp);
                          }
                          
                          
                          List<Lookuptask__c> ltask = [select Account__c,Contact__c,Opportunity__C from Lookuptask__c];
                            
                              List<Lookuptask__c> ltask2 = new List<Lookuptask__c>();
                              for(Lookuptask__c ltask1:ltask)
                              {
                                      if(countTaskAcc.containsKey(ltask1.Account__c))
                                      {System.debug('In account debug');
                                          ltask1.AccountTasksCount__c=countTaskAcc.get(ltask1.Account__c);
                                          ltask2.add(ltask1);
                                      }
                                      else if(countTaskCon.containsKey(ltask1.Contact__c))
                                      {System.debug('In contact debug');
                                       ltask1.ContactTasksCount__C=countTaskCon.get(ltask1.Contact__c);
                                          ltask2.add(ltask1);
                                      }
                                      else if(countTaskOpp.containsKey(ltask1.Opportunity__c))
                                      {System.debug('In opportunity debug');
                                      ltask1.OpportunityTasksCount__C=countTaskCon.get(ltask1.opportunity__c);
                                          ltask2.add(ltask1);
                                      }
                                      
                                      
                              
                              }
                              
                              update ltask2;
                              
                              
                           /*   List<Account> lstacc  = [select id,(select count() cnt from tasks) from account where id =:accids];
                              List<Contact> lstcon  = [select id,(select count() from tasks) from account where id =:l1.conids];
                              List<Opportunity> lstopp  = [select id,(select count() from tasks) from account where id =:l1.oppids];
                              
                              for(Account acc:lstacc)
                              {
                                      countTaskAcc.put(acc.id,acc.getObjects('tasks')[0].get('count'));
                              
                              }
                             */ 
                          }    
                      }
                  
                  
                  
              
    
    
       
    
    
}