public class myTableController
{
public List<position__c> pos{get;set;}
        public List<position__c> add{get;set;}
    public myTableController(ApexPages.StandardController controller) {

    }

        

        
        
       public  myTableController()
        {
        
        }
        
        public List<position__C> add()
        {
            pos = [select name from position__c];
            return pos;
        }

}