public class FormValidations {

    public String mobilephonevaliation{get;set;}
    public String phone{get;set;}
    public boolean ph{get;set;}
    public String msg{get;set;}
    public boolean ph1=false,ph2=false,ph3=false;
        public void FormValidations()
    {
        
    }
    
    public void mobilephonevaliation()
    {
        System.debug('In function');
        if(phone.length()==9)
        {
            ph1=true;
        }
        if(phone.isNumeric())
        {
            ph2=true;
        }
        if(ph1==true && ph2==true)
        {
            ph=true;
            System.debug('in if');
        }
        else
        {
            System.debug('Ph1='+ph1);
            System.debug('Ph2='+ph2);
            System.debug('in else');
             Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,''+'Error in PH'));
            System.debug('afer showmsg');
        }
    }
    
    public void showMsg(ApexPages.Severity sev, String message)
    {
        ApexPages.Message msg = 
            new ApexPages.Message(sev, message);
        ApexPages.addMessage(msg);
    }
    
}