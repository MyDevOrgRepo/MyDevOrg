public class LibraryAccountTriggerHandler {

    Map<ID,HeyLightning__Student__c> stds;
    Map<ID,HeyLightning__Staff__c> stfs;
    Map<ID,HeyLightning__Employee_SM__c> emps;
    List<HeyLightning__Library_Account__c> hllalst;
    public LibraryAccountTriggerHandler()
    {
        
    }
    
 	   /*Global Intializations*/
        List<String> stdlist = new List<String>();
    	List<String> stflist = new List<String>();
    	List<String> emplist = new List<String>();    

    
    public void getLookupDetails(List<HeyLightning__Library_Account__c> lalst)
    {
                
        for(HeyLightning__Library_Account__c la:lalst)
                {
                    if(la.HeyLightning__Associated_Student__c!=null)
                    {
                        
                        stdlist.add(la.HeyLightning__Associated_Student__c);
                        System.debug('Instance of student');
                    }
                    else if(la.HeyLightning__Associated_Staff__c!=null)
                    {
                        System.debug('Instance of Staff');
                        stflist.add(la.HeyLightning__Associated_Staff__c);
                        
                    }
                    else if(la.HeyLightning__Associated_Employee__c!=null)
                    {
                        emplist.add(la.HeyLightning__Associated_Employee__c);
                        
                        System.debug('Instance of Employee');
                    }
                    else
                    {
                        System.debug('Others');
                    }
                }
                
               	stds = new Map<ID,HeyLightning__Student__c>([select HeyLightning__first_name__c,HeyLightning__last_name__c,HeyLightning__email__c,HeyLightning__phone__c,HeyLightning__mobile__c from HeyLightning__Student__c where id in :stdlist]);
                stfs = new Map<ID,HeyLightning__Staff__c>([select HeyLightning__first_name__c,HeyLightning__last_name__c,HeyLightning__email__c,HeyLightning__phone__c,HeyLightning__mobile__c from HeyLightning__Staff__c where id in :stflist]);
                emps = new Map<ID,HeyLightning__Employee_SM__c>([select HeyLightning__first_name__c,HeyLightning__last_name__c,HeyLightning__email__c,HeyLightning__phone__c,HeyLightning__mobile__c from HeyLightning__Employee_SM__c where id in :emplist]);
				hllalst = [select HeyLightning__Associated_Student__c,HeyLightning__Associated_Staff__c,HeyLightning__Associated_Employee__c from HeyLightning__Library_Account__c];
    }
    
     			      
    		
    
    
    
    public void checkDuplicates(List<HeyLightning__Library_Account__c> lalst)
    {
        for(HeyLightning__Library_Account__c laNew: lalst)
        {
            for(HeyLightning__Library_Account__c laOld: hllalst)
            {
                if(laNew.HeyLightning__Associated_Student__c!=null && laNew.HeyLightning__Associated_Student__c.equals(laOld.HeyLightning__Associated_Student__c))
                {
            		laNew.addError('Library Account with Student '+stds.get(laNew.HeyLightning__Associated_Student__c).HeyLightning__first_name__c+' '+stds.get(laNew.HeyLightning__Associated_Student__c).HeyLightning__last_name__c+' already exists');        
                }
                else if(laNew.HeyLightning__Associated_Staff__c!=null && laNew.HeyLightning__Associated_Staff__c.equals(laOld.HeyLightning__Associated_Staff__c))
                {
                    laNew.addError('Library Account with Staff '+stfs.get(laNew.HeyLightning__Associated_Staff__c).HeyLightning__first_name__c+' '+stfs.get(laNew.HeyLightning__Associated_Staff__c).HeyLightning__last_name__c+' already exists');
                }
                else if(laNew.HeyLightning__Associated_Employee__c!=null && laNew.HeyLightning__Associated_Employee__c.equals(laOld.HeyLightning__Associated_Employee__c))
                {
                    laNew.addError('Library Account with Employee '+emps.get(laNew.HeyLightning__Associated_Employee__c).HeyLightning__first_name__c+' '+emps.get(laNew.HeyLightning__Associated_Employee__c).HeyLightning__last_name__c+' already exists');
                }
            }
        }
    }
    
    
    /*Used to autofill details of the selected Student/Staff/Employee*/
    public void autoFillDetails(List<HeyLightning__Library_Account__c> lalst)
    {
        		checkDuplicates(lalst);
                    System.debug('Map is:Emp:'+emps);
                for(HeyLightning__Library_Account__c la:lalst)
                {
                    if(la.HeyLightning__Associated_Student__c!=null)
                    {
                        HeyLightning__Student__c stdc = stds.get(la.HeyLightning__Associated_Student__c);
                        la.HeyLightning__First_Name__c = stdc.HeyLightning__First_Name__c;
                        la.HeyLightning__Last_Name__c = stdc.HeyLightning__Last_Name__c;
                        la.HeyLightning__email__c = stdc.HeyLightning__email__c;
                        la.HeyLightning__phone__c = stdc.HeyLightning__phone__c;
                        la.HeyLightning__mobile__c = stdc.HeyLightning__mobile__c;
                    }
                    else if(la.HeyLightning__Associated_Staff__c!=null)
                    {
                        HeyLightning__Staff__c stf = stfs.get(la.HeyLightning__Associated_Staff__c);
                        la.HeyLightning__First_Name__c = stf.HeyLightning__First_Name__c;
                        la.HeyLightning__Last_Name__c = stf.HeyLightning__Last_Name__c;
                        la.HeyLightning__email__c = stf.HeyLightning__email__c;
                        la.HeyLightning__phone__c = stf.HeyLightning__phone__c;
                        la.HeyLightning__mobile__c = stf.HeyLightning__mobile__c;
                    }
                    else if(la.HeyLightning__Associated_Employee__c!=null)
                    {
                     	HeyLightning__Employee_SM__c emp = emps.get(la.HeyLightning__Associated_employee__c);
                        la.HeyLightning__First_Name__c = emp.HeyLightning__First_Name__c;
                        la.HeyLightning__Last_Name__c = emp.HeyLightning__Last_Name__c;
                        la.HeyLightning__email__c = emp.HeyLightning__email__c;
                        la.HeyLightning__phone__c = emp.HeyLightning__phone__c;
                        la.HeyLightning__mobile__c = emp.HeyLightning__mobile__c;   
                    }
                }
    }
    
}