global class Distribute_Leads implements Database.Batchable<SObject>{

    List<Lead> MumbaiLeadQ;
        List<Lead> FranceLeadQ;
            List<Lead> leadsToUpdate = new List<Lead> ();
             Map<DateTime,user> MumbaiTeam= new Map<DateTime,user>();



     global Iterable<sObject> start(Database.BatchableContext BC){
          //return Database.getQueryLocator(query);
                return getAllLeads();
       }
       
       public id getMaxAwaitedUser(String groupName)
       {
                List<GroupMember> grpmbr = [select userorgroupid from groupmember where group.name=:groupName];
                List<id> userids = new List<id>();
                for(GroupMember grpmeb:grpmbr)
                {
                    userids.add(grpmeb.userorgroupid);
                }

                List<user> users = [select id,username,Last_Lead_Assigned__c,last_opportunity_assigned__c from user where id in :userids order by Last_Lead_Assigned__c];
                System.debug('Date Lists are:'+users);
               
                DateTime maxAwaitedTime  = users[0].Last_Lead_Assigned__c;

                for(user u:users)
                {
                    MumbaiTeam.put(u.Last_Lead_Assigned__c,u);
//    maxAwaitedTime.add(u.Last_Lead_Assigned__c);
                }

               /* List<lead> lstLead = [select id,ownerid from lead where owner.name='MumbaiLeadQ'];
                List<lead> leadsToUpdate = new List<Lead>();
                for(Lead lead1:lstLead)
                {
                    lead1.ownerid=MumbaiTeam.get(maxAwaitedTime).id;
                    leadsToUpdate.add(lead1);
                }

                update leadsToUpdate;
*/
                user u1 = MumbaiTeam.get(maxAwaitedTime);
                u1.last_lead_assigned__C = System.now();
                update u1;
                System.debug('MaxAwaitedUser is:'+users[0].username);
       return u1.id;
       }
       
        global void execute(Database.BatchableContext BC, List<sObject> scope)
        {
        
              List<GroupMember> FranceTeam = [select UserOrGroupId from GroupMember where group.name='FranceTeam'];
              List<GroupMember> MumbaiTeam= [select UserOrGroupId from GroupMember where group.name='MumbaiTeam'];
              
            for(SObject leadRecords:scope)
            {
                if(leadRecords instanceof Lead)
                {
                        Lead leadRec = (Lead)leadRecords;
                
                            if(leadRec.owner.name.equals('MumbaiLeadQ'))
                            {
                                //leadRec.ownerid='00528000000yAby';
                                //leadRec.ownerid=MumbaiTeam[0].UserOrGroupId ;
                                id owneridLead =getMaxAwaitedUser('MumbaiLeadQ'); 
                                leadRec.ownerid=owneridLead;
                                System.debug('getMaxAwaitedUser:'+owneridLead);
                                leadsToUpdate.add(leadRec);
                            }
                            else if(leadRec.owner.name.equals('FranceLeadQ'))
                            {
                                //leadRec.ownerid='00528000000ymCA';
//                                leadRec.ownerid=FranceTeam[0].UserOrGroupId ;
                                leadRec.ownerid=getMAxAwaitedUser('FranceLeadQ');
                                leadsToUpdate.add(leadRec);
                            }
                
                }
            }
            
             if(leadsToUpdate.size()>0)
                    update leadsToUpdate;
            
         }

       global void finish(Database.BatchableContext BC)
       {

            // Logic to be Executed at finish

       }

    public List<Lead> getAllLeads()
    {
          return [select id,owner.id,owner.name from lead where owner.name='MumbaiLeadQ' OR owner.name='FranceLeadQ'];
    }
    
    
    public void processLeads(List<Lead> leadsToBeProcessed)
    {System.debug('In Process: '+leadsToBeProcessed.size());
            for(Lead lead:leadsToBeProcessed)
            {System.debug('In for');
                    if(lead.owner.name.equals('MumbaiLeadQ'))
                    {
                        lead.ownerid='00528000000yAby';
                        leadsToUpdate.add(lead);
                    }
                    else if(lead.owner.name.equals('FranceLeadQ'))
                    {
                        lead.ownerid='00528000000ymCA';
                        leadsToUpdate.add(lead);
                    }
                    
            }
            System.debug('List is:'+leadsToUpdate);
                 if(leadsToUpdate.size()>0)
                    update leadsToUpdate;
   
    }
    

}