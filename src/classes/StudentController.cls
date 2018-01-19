public class StudentController
{

    //public void showLimitedRecords{get;set;}
   // public List<Student__c> stdlst {get;set;}
  
  //  public List<Student__c> studentsToShow{get;set;}
    //public String getSelectedRange{get;set;}
    //public List<Student__c> showLimitedRecords{get;set;} 
    
     public List<Opportunity> stdlst {get;set;}
     public List<Opportunity> studentsToShow{get;set;}
    public String getSelectedRange{get;set;}
    public List<Opportunity> showLimitedRecords{get;set;} 
    public boolean hidePreviousPage{get;set;}
    
    public integer counter{get;set;}
    public integer limitsize{get;set;}
    public integer totalsize{get;set;}
    public integer selectedrange{get;set;}
    
    public StudentController()
    {
    
    counter=0;
    limitsize=0;
    totalsize=0;
    selectedrange=0;
    
   // stdlst = new List<Student__c>();
   stdlst = new List<Opportunity>();
     //stdlst = [select first_name__c,last_name__c,email__c,phone__c,mobile__c,class__r.name,division__c from Student__c];
     stdlst=[select name,amount,account.name,stagename from opportunity];
     //studentsToShow = new List<Student__c>();
     studentsToShow = new List<Opportunity>();
     totalsize=stdlst.size();
     for(integer i=0;i<10;i++)
         {
                studentsToShow.add(stdlst.get(i));
         }
     
    }
    
    public PageReference showLimitedRecords()
    {
    
    studentsToShow.clear();
    System.debug('In showLimitedRecords');
    System.debug('getSelectedRange:'+getSelectedRange);
    selectedrange = Integer.valueOf(getSelectedRange);
       System.debug('selected Range:'+selectedrange);
       System.debug('2nd element of the list:'+stdlst.get(2));
       if(selectedrange<totalsize)
       {
         for(integer i=0;i<selectedrange;i++)
         {
                studentsToShow.add(stdlst.get(i));
         }
        }
        else
        {
            for(integer i=0;i<totalsize;i++)
         {
         System.debug('i is:'+i);
                studentsToShow.add(stdlst.get(i));
         }
        
        } 
         System.debug('studentsToShow size:'+studentsToShow.size());
         return null;
    }
    
    
    public void ShowFirstPage()
    {
             counter=0;
       studentsToShow.clear();
       
       if((counter+limitsize)<=totalsize)
       {
         for(integer i=0;i<limitsize;i++)
         {
                studentsToShow.add(stdlst.get(i));
         }
        }
        else
        {
            for(integer i=0;i<totalsize;i++)
         {
         System.debug('i is:'+i);
                studentsToShow.add(stdlst.get(i));
         }
        
        } 
    
    hidePreviousPage=false;
    
    }
    
    
    public PageReference ShowNextPage()
    {
             System.debug('In Next Page Method');
       studentsToShow.clear();
       limitsize= Integer.valueOf(getSelectedRange);
       counter+=limitsize;
       System.debug('counter is:'+counter);
       if((counter+limitsize)<totalsize)
       {
       System.debug('in NextPage If:');
         for(integer i=counter;i<(counter+limitsize);i++)
         {
                studentsToShow.add(stdlst.get(i));
         }
        }
        else
        {
            for(integer i=0;i<totalsize;i++)
         {
         System.debug('i is:'+i);
                studentsToShow.add(stdlst.get(i));
         }
        
        }
        System.debug('list size is:'+studentsToShow.size());
        System.debug('List is:'+studentsToShow); 
          hidePreviousPage=true;
    return null;
    }
    
    public PageReference ShowPreviousPage()
    {
             System.debug('In Previous Page Method');
       studentsToShow.clear();
       limitsize= Integer.valueOf(getSelectedRange);
       counter-=limitsize;
       System.debug('counter is:'+counter);
       if((counter+limitsize)<totalsize)
       {
       System.debug('in NextPage If:');
         for(integer i=counter;i<(counter+limitsize);i++)
         {
                studentsToShow.add(stdlst.get(i));
         }
        }
        else
        {
            for(integer i=0;i<totalsize;i++)
         {
         System.debug('i is:'+i);
                studentsToShow.add(stdlst.get(i));
         }
        
        }
        System.debug('list size is:'+studentsToShow.size());
        System.debug('List is:'+studentsToShow); 
    return null;
    }
    
    
    public PageReference ShowLastPage()
    {
             System.debug('In Previous Page Method');
       studentsToShow.clear();
       limitsize= Integer.valueOf(getSelectedRange);
       counter=totalsize-limitsize;
       System.debug('counter is:'+counter);
       
        
            for(integer i=counter;i<totalsize;i++)
         {
         System.debug('i is:'+i);
                studentsToShow.add(stdlst.get(i));
         }
        
        
        System.debug('list size is:'+studentsToShow.size());
        System.debug('List is:'+studentsToShow); 
        hidePreviousPage=true;
    return null;
    }
    
}