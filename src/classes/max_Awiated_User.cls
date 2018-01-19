public class max_Awiated_User
{
      List<GroupMember> grpMember = new List<GroupMember>();
      List<id> userids = new List<id>();
        public max_Awiated_User()
        {
                  List<GroupMember> grpMember = [select UserOrGroupId from GroupMember where group.name='MumbaiLeadQ'];
        List<id> mumbaiUserIds = new List<id>();
               for(GroupMember grp:grpMember)
                {
                    userids.add(grp.userorgroupid);
                }
        List<user> usersMumbai= [select id,name,last_lead_assigned__c from user where id in:mumbaiUserIds];
        Map<DateTime,user> leadAssigneTimeByUser = new Map<DateTime,user>();
        
        for(User u:usersMumbai)
        {
            leadAssigneTimeByUser.put(u.last_lead_assigned__c,u);
        }
        List<lead> leads = [select id,ownerId from lead];
        for(Lead lead: leads)
        {
                
        }
        
        }
         
         
         
}