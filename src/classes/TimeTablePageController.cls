public class TimeTablePageController
{

    

/*
    public TimeTablePageController(ApexPages.StandardController controller) {
 System.debug('ID is:'+ ApexPages.currentPage().getParameters().get('id'));
        recordID=ApexPages.currentPage().getParameters().get('id');
        selectionBlock=true;
        showTimeTable=false;
        timetable = new TimeTable__c();
        timetables = new List<TimeTable__c>();
        
        /*Will only be executed if page is accessed through "Show TimeTable" Buutton on Division Detail Page*/
      /*if(recordID!=null)
        {
            selectionBlock=false;
            
            /*Preparing input data for query to be executed in showTimeTable() method*/
        /*    currentDivision = [select HeyLightning__Class__c from HeyLightning__Division__c where id=:recordId];
            timetable.HeyLightning__division__c = recordId;
            timetable.HeyLightning__class__c = currentdivision.class__c;
          */  
            /*giving call to showTimeTable() method*/
  /*          showTimeTable();
        }
        currentTab='hi';
        defaultTab='Monday';
        selectedTab=defaultTab;
    }

*/
    public class TimeTableWrapperClass
    {
       public List <HeyLightning__TimeTable__c> ttblst{get;set;}
       public List<HeyLightning__TimeTable__c>sortedList{get;set;}
       public TimeTableWrapperClass(List<HeyLightning__TimeTable__c> ttblst)
       {
           this.ttblst=ttblst;
       }
       
       public List<HeyLightning__TimeTable__c> sortedList()
       {
           HeyLightning__TimeTable__c []sortedList = new HeyLightning__TimeTable__c[6];
           System.debug('ttblst size:'+ttblst.size());
           for(integer i=0;i<ttblst.size();i++)
           {
               if(ttblst[i].HeyLightning__Day__c.equals('Monday'))
               {
                     sortedList.add(0,ttblst[i]);
                     System.debug('Monday:'+ttblst[i]);
               }
               else if(ttblst[i].HeyLightning__Day__c.equals('Tuesday'))
               {
                     sortedList.add(1,ttblst[i]);
                     System.debug('Tuesday:'+ttblst[i]);
               }
               else if(ttblst[i].HeyLightning__Day__c.equals('Wednesday'))
               {
                     sortedList.add(2,ttblst[i]);
                     System.debug('Wednesday:'+ttblst[i]);
               }
               else if(ttblst[i].HeyLightning__Day__c.equals('Thursday'))
               {
                     sortedList.add(3,ttblst[i]);
                     System.debug('Tursday:'+ttblst[i]);
               }
               else if(ttblst[i].HeyLightning__Day__c.equals('Friday'))
               {
               System.debug('In Friday');
                     sortedList.add(4,ttblst[i]);
                     System.debug('Friday:'+ttblst[i]);
               }
               else if(ttblst[i].HeyLightning__Day__c.equals('Saturday'))
               {
                       System.debug('In Saturday');
                     sortedList.add(5,ttblst[i]);
                     System.debug('Saturday:'+ttblst[i]);
               }
           }
           
           System.debug('Sorted List Size:'+sortedlist.size());
           for(integer i=0;i<sortedlist.size();i++)
           {
               System.debug('index is:'+i+' element is:'+sortedlist[i]);
           
           }
           return sortedlist;
       }
    
    }


    public List<HeyLightning__TimeTable__c> timetables{get;set;}
    public HeyLightning__TimeTable__c timetable{get;set;}
    public ApexPages.StandardController c;
    public boolean showTimeTable{get;set;}
    public PageReference clearTimeTable{get;set;}
    public String recordId{get;set;}
    public boolean selectionBlock{get;set;}
    public HeyLightning__Division__c currentDivision{get;set;}
    public String defaultTab{get;set;}
    public String selectedTab{get;set;}
    public PageReference switchToNextTab{get;set;}
    public PageReference switchToPreviousTab{get;set;}
    public PageReference Save{get;set;}
    public List<HeyLightning__TimeTable__c> listToCreate{get;set;}
    public HeyLightning__TimeTable__c placeholderToCreate{get;set;} 
    public boolean EditPage{get;set;}
    public boolean EditTimeTable{get;set;}
    public PageReference Edit_Save{get;set;}
    public PageReference Edit{get;set;}
    public List<TimeTable__c> listToShow{get;set;}
    public boolean editInput{get;set;}
    public String classname{get;set;}
    public String divisionname{get;set;}
    public PageReference checkduplicates{get;set;}
    public String errorMessage{get;set;}
    public Boolean showTimeTablePanel{get;set;}
    public String linkToTimeTable{get;set;}
    public boolean showLink{get;set;}
    /*TimeTables 6 new objects*/
    
    public TimeTable__c monday {get;set;}
       public TimeTable__c tuesday {get;set;}
        public TimeTable__c wednesday {get;set;}
        public TimeTable__c thursday {get;set;}
        public TimeTable__c friday {get;set;}
        public TimeTable__c saturday {get;set;}
        public boolean displayError{get;set;}
        /*TimeTables 6 new objects ends*/
    
    /*    
    public TimeTablePageController() {
        showTimeTable=false;
        timetable = new TimeTable__c();
        timetables = new List<TimeTable__c>();
        for(integer i=0;i<6;i++)
        {
            timetables.add(new timetable__c());
        }
    }
*/

/* changed constructor (Parameterised) */

public TimeTablePageController() {
        TimeTable__c monday = new TimeTable__c();
           TimeTable__c tuesday = new TimeTable__c();
        TimeTable__c wednesday = new TimeTable__c();
        TimeTable__c thursday = new TimeTable__c();
        TimeTable__c friday = new TimeTable__c();
        TimeTable__c saturday = new TimeTable__c();


        listToShow = new List<TimeTable__c>();
        listToCreate = new List<TimeTable__c>();
        System.debug('ID is:'+ ApexPages.currentPage().getParameters().get('id'));
        recordID=ApexPages.currentPage().getParameters().get('id');
        selectionBlock=true;
        showTimeTable=false;
        timetable = new TimeTable__c();
        timetables = new List<TimeTable__c>();
        EditTimeTable=false;
        /*Will only be executed if page is accessed through "Show TimeTable" Buutton on Division Detail Page*/
        if(recordID!=null)
        {
            selectionBlock=false;
            EditPage=true;
            /*Preparing input data for query to be executed in showTimeTable() method*/
            currentDivision = [select name,HeyLightning__Class__c,HeyLightning__Class__r.name from HeyLightning__Division__c where id=:recordId];
           // timetable.HeyLightning__division__c = recordId;
            //timetable.HeyLightning__class__c = currentdivision.class__c;
            
            /*giving call to showTimeTable() method*/
           showTimeTable();
        }
       else
       {
           editInput=true;
           
       }
        
        /*added blank list to avoid index script invalid error*/
      /*  for(integer i=0;i<6;i++)
        {
            timetables.add(new timetable__c());
        }*/
      System.debug('SizeCon:'+timetables.size());  
        for(integer i=0;i<timetables.size();i++)
    {
        System.debug('Cons:'+timetables[i]);
    }
        defaultTab='Monday';
        selectedTab=defaultTab;
        
    }
    
/* changed constructor (Parameterised) */


    public PageReference clearTimeTable()
    {
        showTimeTable=false;
     timetables.clear();  
        return null;
    }

    public PageReference showTimeTable()
    {
    
    showTimeTable=true;
    
    String ttb_division= timetable.HeyLightning__division__c;
    String ttb_class= timetable.HeyLightning__class__c;
    
    System.debug('Division is:'+timetable.HeyLightning__division__c);
    System.debug('Class is:'+timetable.HeyLightning__class__c);
    
    if(!selectionBlock)
    {
       timetables = [select id,HeyLightning__day__c,HeyLightning__StartTime1__c,HeyLightning__EndTime1__c,HeyLightning__StartTime2__c,HeyLightning__EndTime2__c,HeyLightning__StartTime3__c,HeyLightning__EndTime3__c,HeyLightning__StartTime4__c,HeyLightning__EndTime4__c,HeyLightning__StartTime5__c,HeyLightning__EndTime5__c,HeyLightning__StartTime6__c,HeyLightning__EndTime6__c,HeyLightning__subject1__c,HeyLightning__subject2__c,HeyLightning__subject3__c,HeyLightning__subject4__c,HeyLightning__subject5__c,HeyLightning__subject6__c,HeyLightning__teacher1__c,HeyLightning__teacher2__c,HeyLightning__teacher3__c,HeyLightning__teacher4__c,HeyLightning__teacher5__c,HeyLightning__teacher6__c,HeyLightning__class__c,HeyLightning__division__c from TimeTable__c where HeyLightning__division__c=:recordId and class__c=:currentDivision.HeyLightning__class__c order by HeyLightning__Day__c];
    }
    else
    {
        timetables = [select id,HeyLightning__day__c,HeyLightning__StartTime1__c,HeyLightning__EndTime1__c,HeyLightning__StartTime2__c,HeyLightning__EndTime2__c,HeyLightning__StartTime3__c,HeyLightning__EndTime3__c,HeyLightning__StartTime4__c,HeyLightning__EndTime4__c,HeyLightning__StartTime5__c,HeyLightning__EndTime5__c,HeyLightning__StartTime6__c,HeyLightning__EndTime6__c,HeyLightning__subject1__c,HeyLightning__subject2__c,HeyLightning__subject3__c,HeyLightning__subject4__c,HeyLightning__subject5__c,HeyLightning__subject6__c,HeyLightning__teacher1__c,HeyLightning__teacher2__c,HeyLightning__teacher3__c,HeyLightning__teacher4__c,HeyLightning__teacher5__c,HeyLightning__teacher6__c,HeyLightning__class__c,HeyLightning__division__c from TimeTable__c where HeyLightning__division__c=:timetable.HeyLightning__division__c and class__c=:timetable.HeyLightning__class__c order by HeyLightning__Day__c];
    }
   /* TimeTablePageController.TimeTableWrapperClass ttbwrap = new TimeTablePageController.TimeTableWrapperClass(timetables);
     timetables=ttbwrap.sortedList();*/
     
     for(integer i=0;i<timetables.size();i++)
    {
        if(timetables[i].day__c=='Monday')
        {
            monday=timetables[i];
        }
        else if(timetables[i].day__c=='Tuesday')
        {
            Tuesday=timetables[i];
        }
        else if(timetables[i].day__c=='Wednesday')
        {
            wednesday=timetables[i];
        }
        else if(timetables[i].day__c=='Thursday')
        {
            thursday=timetables[i];
        }
        else if(timetables[i].day__c=='Friday')
        {
            friday=timetables[i];
        }
        else if(timetables[i].day__c=='Saturday')
        {
            saturday=timetables[i];
        }
        
    }
     
     
     System.debug('SizeTT:'+timetables.size());
     for(integer i=0;i<timetables.size();i++)
    {
        System.debug('ShowTT:'+timetables[i]);
    }/*
     System.debug('TimeTables[0]'+TimeTables[0]);
     System.debug('TimeTables[1]'+TimeTables[1]);
     System.debug('TimeTables[2]'+TimeTables[2]);
     System.debug('TimeTables[3]'+TimeTables[3]);
     System.debug('TimeTables[4]'+TimeTables[4]);
     System.debug('TimeTables[5]'+TimeTables[5]);
     */
     listToShow=timetables;
    return null;
    }
    
    public PageReference switchToPreviousTab()
    {
       
       System.debug('Selected Tab:'+selectedTab);
       System.debug('Selected tab equality:'+(selectedTab=='Monday'));
       if(selectedTab=='Monday')
       {
           System.debug('in if monday');
           selectedTab='Saturday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Tuesday')
       {
           System.debug('in if Tuesday');
           selectedTab='Monday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Wednesday')
       {
           System.debug('in if Thursday');
           selectedTab='Tuesday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Thursday')
       {
           System.debug('in if Friday');
           selectedTab='Wednesday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Friday')
       {
           System.debug('in if Friday');
           selectedTab='Thururday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       
       else if(selectedTab=='Saturday')
       {
           System.debug('in if Saturday');
           selectedTab='Friday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
        
       System.debug('Changed Tab:'+selectedTab);
        return null;
    }
    
    
      public PageReference Save()
    {
    
    
    /*Code for adding TimeTable of Saturday to the Table as next would not be clicked onto this tab
    
    After clicking this even user redirected to Tab Monday
    */ 
         if(selectedTab=='Saturday')
        {
        
          System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
         
         //selectedTab;
          
          if(!selectionBlock || !editInput)
          {
           placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
           placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;
               placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          selectedTab='Monday'; 
          
          
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
          placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;

          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
            
            
        }
          
       insert listToCreate;
       
       /*
       System.debug('Selected Tab:'+selectedTab);
       System.debug('Selected tab equality:'+(selectedTab=='Monday'));
       if(selectedTab=='Monday')
       {
           System.debug('in if monday');
           selectedTab='Tuesday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Tuesday')
       {
           System.debug('in if Tuesday');
           selectedTab='Wednesday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Wednesday')
       {
           System.debug('in if Thursday');
           selectedTab='Thursday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Thursday')
       {
           System.debug('in if Friday');
           selectedTab='Friday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       else if(selectedTab=='Friday')
       {
           System.debug('in if Friday');
           selectedTab='Saturday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
       
       else if(selectedTab=='Saturday')
       {
           System.debug('in if Saturday');
           selectedTab='Monday';
           System.debug('In if:Changed Tab:'+selectedTab);
       }
        
       System.debug('Changed Tab:'+selectedTab);
       
       */
       
       PageReference pr = new PageReference('/apex/TimeTableDetailPage?id='+placeholderToCreate.HeyLightning__division__c);
       pr.setRedirect(true);
        return pr;
    }
    
    public PageReference switchToNextTab()
    {
   
    System.debug('In switchToNextTab');
        if(selectedTab=='Monday')
        {
                      
            
          System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
          
          System.debug('EditInput flag:'+editInput);
          
          if(!selectionBlock || !editInput)
          {
           placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
          
           /*retrieving class and division names for record insertion starts*/
            
            division__c DivAndClassInfo = [select name,class__r.name from division__c where class__c=:timetable.HeyLightning__class__c and id=:timetable.HeyLightning__division__c ];
         
             classname= DivAndClassInfo.class__r.name;
             divisionname=DivAndClassInfo.name;  
            
            /*retrieving class and division names for record insertion starts*/
          
           placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;                               
           placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          
          selectedTab='Tuesday';
          
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
          placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;

          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
          if(currentDivision!=null)
          {
             System.debug('Division is CurrentDiv:'+currentDivision.HeyLightning__class__r.name);
             System.debug('Class is CrrentDiv:'+currentDivision.name);
             }
             System.debug('Division is:'+timetable.HeyLightning__division__r.name);
             System.debug('Class is:'+timetable.HeyLightning__class__r.name);
         /* timetables.clear();
          timetable.HeyLightning__division__c = recordId;
          timetable.HeyLightning__class__c = currentdivision.class__c;*/
        }
        else if(selectedTab=='Tuesday')
        {
        
        
        
        timetable.HeyLightning__day__c=selectedTab;
         System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
        
          
          
          if(!selectionBlock || !editInput)
          {
          placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
          placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;
          placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          selectedTab='Wednesday';
                    
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
           placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;

          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
             
        }
        else  if(selectedTab=='Wednesday')
        {
        
        
        
        System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
          
          
          
          if(!selectionBlock || !editInput)
          {
          placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
          placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;
               placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          selectedTab='Thursday';
          
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
          placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;
          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
             
        }
        else  if(selectedTab=='Thursday')
        {
        
        System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
          
          
          
          if(!selectionBlock || !editInput)
          {
          placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
          placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;
               placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          selectedTab='Friday';
          
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
          placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;

          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
             
        }
        else if(selectedTab=='Friday')
        {
        
        System.debug('In Monday');
          placeholderToCreate = new HeyLightning__TimeTable__c();
          
          placeholderToCreate.HeyLightning__day__c=selectedTab;
          
          
          
          if(!selectionBlock || !editInput)
          {
          placeholderToCreate.name=currentDivision.HeyLightning__class__r.name+'-'+currentDivision.name+'-'+selectedTab;
           placeholderToCreate.HeyLightning__division__c=recordID;
           placeholderToCreate.HeyLightning__class__c=currentDivision.HeyLightning__class__c;
          }
          else
          {
          placeholderToCreate.name=classname+'-'+divisionname+'-'+selectedTab;
               placeholderToCreate.HeyLightning__division__c=timetable.HeyLightning__division__c;
           placeholderToCreate.HeyLightning__class__c=timetable.HeyLightning__class__c;
          }
          /*setting values for all timeslots*/
          
          selectedTab='Saturday';
          
          placeholderToCreate.HeyLightning__starttime1__c=timetable.HeyLightning__startTime1__c;
          placeholderToCreate.HeyLightning__endtime1__c=timetable.HeyLightning__endTime1__c;
          
          placeholderToCreate.HeyLightning__starttime2__c=timetable.HeyLightning__startTime2__c;
          placeholderToCreate.HeyLightning__endtime2__c=timetable.HeyLightning__endTime2__c;
          
          placeholderToCreate.HeyLightning__starttime3__c=timetable.HeyLightning__startTime3__c;
          placeholderToCreate.HeyLightning__endtime3__c=timetable.HeyLightning__endTime3__c;
          
          placeholderToCreate.HeyLightning__starttime4__c=timetable.HeyLightning__startTime4__c;
          placeholderToCreate.HeyLightning__endtime4__c=timetable.HeyLightning__endTime4__c;
          
          placeholderToCreate.HeyLightning__starttime5__c=timetable.HeyLightning__startTime5__c;
          placeholderToCreate.HeyLightning__endtime5__c=timetable.HeyLightning__endTime5__c;
          
          placeholderToCreate.HeyLightning__starttime6__c=timetable.HeyLightning__startTime6__c;
          placeholderToCreate.HeyLightning__endtime6__c=timetable.HeyLightning__endTime6__c;
          
          
          placeholderToCreate.HeyLightning__teacher1__c=timetable.HeyLightning__teacher1__c;
          placeholderToCreate.HeyLightning__teacher2__c=timetable.HeyLightning__teacher2__c;
          placeholderToCreate.HeyLightning__teacher3__c=timetable.HeyLightning__teacher3__c;
          placeholderToCreate.HeyLightning__teacher4__c=timetable.HeyLightning__teacher4__c;
          placeholderToCreate.HeyLightning__teacher5__c=timetable.HeyLightning__teacher5__c;
          placeholderToCreate.HeyLightning__teacher6__c=timetable.HeyLightning__teacher6__c;
          
          placeholderToCreate.HeyLightning__subject1__c=timetable.HeyLightning__subject1__c;
          placeholderToCreate.HeyLightning__subject2__c=timetable.HeyLightning__subject2__c;
          placeholderToCreate.HeyLightning__subject3__c=timetable.HeyLightning__subject3__c;
          placeholderToCreate.HeyLightning__subject4__c=timetable.HeyLightning__subject4__c;
          placeholderToCreate.HeyLightning__subject5__c=timetable.HeyLightning__subject5__c;
          placeholderToCreate.HeyLightning__subject6__c=timetable.HeyLightning__subject6__c;

          
          
          
          listToCreate.add(placeholderToCreate);
          System.debug('StartTime1 is:'+timetable.HeyLightning__startTime1__c);
             
        }
        
        System.debug('timeTables:'+listToCreate);
        //insert listToCreate;
        
        return null;
    }
    
    
    public PageReference Edit()
    {
    ShowTimeTable=false;
    EditTimeTable=true;
    
    /*
    System.debug('timeTables is:'+timetables);
    System.debug('TimeTable Size:'+timetables.size());
        //update timetables;
        PageReference pr = new PageReference(System.Label.ReDirectToDivision+currentDivision.id);
        pr.setRedirect(true);
        return pr;
        */
        return null;
    
    
    }
    
    public PageReference Edit_Save()
    {
    
    System.debug('Changed values is:'+timetables[0].subject1__c);
    update timetables;
    
    if(currentDivision!=null)
    {
        PageReference pr = new PageReference(System.Label.ReDirectToDivision+currentDivision.id);
        pr.setRedirect(true);
        return pr;
    }
    else
    {
        ShowTimeTable=true;
        EditTimeTable=false;
    }
      
        return null;
    
   
    
    
    }
  
  public PageReference checkduplicates()
  {
  System.debug('In checkDuplicates method()');
        division__c[] tt_counts = [select HeyLightning__TimeTableRecordCount__c from division__c where id=:timetable.Heylightning__division__c and class__c=:timetable.Heylightning__class__c];
        if(tt_counts.size() > 0 && tt_counts[0].HeyLightning__TimeTableRecordCount__c!=0)
        {
        System.debug('In checkDuplicates Method:IF:');
            displayError=true;
            errorMessage='TimeTable for this class and division combination already exists... Please find link below to view the same';
            showTimeTablePanel=false;
            showLink=true;
            linkToTimeTable='/apex/TimeTableDetailPage?id='+timetable.Heylightning__division__c;
        }
        else
        {
        System.debug('In checkDuplicates Method:Else:');
           displayError=false;
           errorMessage='';
           showTimeTablePanel=true;
           showLink=false;
           linkToTimeTable='';
        }
        return null;
  }
  
  
    
 }