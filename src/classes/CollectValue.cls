public class CollectValue {
    
    public CollectValue(ApexPages.StandardController controller) {   
    }
     public Location__c location {get;set;} 
     
    
      public void save() {
        location = new Location__c();
        User u = [select firstname from user where id=:userinfo.getuserid()];
        string username = u.firstname;
        location.User_Name__c=username;
        location.Name='BNT SOFT';
        location.Latitude__c='18.5673214';
        location.Longitude__c='73.8245493';
        insert location;
      
        }

}