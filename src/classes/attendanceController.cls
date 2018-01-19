public class attendanceController
{
        public Date dateFilter {get;set;}

        public String id{get;set;}
        public boolean showselectionblock {get;set;}
        public boolean showAttendanceTable {get;set;}
        public boolean showTable{get;set;}
        public String title{get;set;}    

        public List<selectOption> classVals{get;set;}
        public List<selectOption> divVals{get;set;}

        public List<SelectOption> cls_options{get;set;}
        public List<SelectOption> div_options{get;set;}
        public List<division__c> divisionnames{get;set;}
        public division__c div {get;set;}
        public Set<String> divisions{get;set;}
        public Set<String> classes{get;set;}
        public String classPlaceHolder{get;set;}
        public String divPlaceHolder{get;set;}
        public list<Student__c> stdlst{get;set;}
        public list<attendance__c> attendancelst {get;set;}
        public String classid{get;set;}
        
        public PageReference LoadStudents{get;set;}
        public PageReference SaveAttendance{get;set;}
        public PageReference showAttendnaceReport{get;set;}
        
        public List<attendance__c> attendancereport{get;set;}
            
    public attendanceController()
    {
        dateFilter =  System.Today();
        
        
        id = ApexPages.CurrentPage().getParameters().get('id');
        classid= ApexPages.CurrentPage().getParameters().get('class');
        System.debug('id is:'+id);
        System.debug('class is:'+classid);
        
        showAttendanceTable=false;
        showTable = false;
        if(id!=null)
        {
        
            title='Aattendance Report - '+System.today();
            showselectionblock = false;
            
           // div = [select class__c from division__C where id=:id];
            LoadStudents();
        }
        else
        {
            showselectionblock = true;
            title = 'Select class and division';
            classVals();
            divvals();
        }
        
    }
    
    public List<SelectOption> classVals()
    {
        cls_options = new List<SelectOption>();
        div_options = new List<SelectOption>();
        divisionnames = [select name,class__r.name from division__c];
        
        Set<String> divisions = new Set<String>();
        Set<String> classes = new Set<String>();
        
        for(division__c div:divisionnames)
        {
                divisions.add(div.name);
                classes.add(div.class__r.name);    
        }
        
        for(String cls:classes)
        {
            cls_options.add(new SelectOption(cls,cls));
        }
        cls_options.sort();
        System.debug('cls is:'+cls_options);        

        return cls_options;
        
    }
    
    public List<SelectOption> divVals()
    {
        
        div_options = new List<SelectOption>();
                
        Set<String> divisions = new Set<String>();
        
        for(division__c div:divisionnames)
        {
                divisions.add(div.name);
        }
        
                
        for(String divs:divisions)
        {
             div_options.add(new SelectOption(divs,divs));
             
        }
        div_options.sort();
              System.debug('divs is:'+div_options);        
        return div_options;
    }
    
    public PageReference LoadStudents()
    {
    
    showAttendanceTable=true;
    attendancelst = new List<attendance__c>();
    
    if(id==null)
    {
        stdlst = [select id,name,class__c,division__c from student__c where class__r.name=:classPlaceHolder and division__r.name=:divPlaceHolder];
    }
     else
     {
         stdlst = [select id,name,class__c,division__c from student__c where class__c=:classid and division__c=:id];
     }  
                for(integer i=0;i<stdlst.size();i++)
                {
                    attendance__c atnd = new attendance__c(studentname__c=stdlst[i].id,absent__c=false,present__c=false,reason_if_absent__c='',name=String.valueOf(System.today()),class__c=stdlst[i].class__c,division__c=stdlst[i].division__c);
                    attendancelst.add(atnd);
             
        }
        
        return null;
    }
   
    public PageReference SaveAttendance()
    {
    
          for(attendance__c atend:attendancelst)
          {
              System.debug('Student:'+atend.studentname__c+'Present:'+atend.present__c);
              System.debug('Student:'+atend.studentname__c+'Absent:'+atend.absent__c);
          }
    
         insert attendancelst;
                     
         division__c divs = [select attendance_reported__c from division__c where id=:id];
         divs.attendance_reported__c = true;
         update divs;
         
            PageReference pr = new PageReference(System.Label.RA_ReDirectToDivision+stdlst[0].division__c);
            pr.setRedirect(true);
            return pr;
    }
    
    public PageReference showAttendnaceReport()
    {
    
        showTable=true;
    
   // Datetime dt = datetime.newInstance(dateFilter.year(), dateFilter.month(),dateFilter.day());
   // System.debug('Only Date is:'+dt);
           attendancereport = [select name,studentname__r.name,present__c,absent__c,reason_if_absent__c from attendance__c where class__r.name=:classPlaceHolder and division__r.name=:divPlaceHolder and name=:String.valueOf(dateFilter)];
                return null;
                
    }
    
}