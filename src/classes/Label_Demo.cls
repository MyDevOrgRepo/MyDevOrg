public class Label_Demo {

    public PageReference getmyposition { get; set; }

    
    public PageReference getmyposition()
    {
        PageReference pr = new PageReference(System.Label.Dynamic_value_for_position);
pr.setredirect(true);
return pr;
    }
    
}