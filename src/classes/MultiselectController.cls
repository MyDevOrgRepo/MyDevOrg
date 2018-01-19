public with sharing class MultiselectController {
    // SelectOption lists for public consumption
    public SelectOption[] leftOptions { get; set; }
    public SelectOption[] rightOptions { get; set; }
  
 public SelectOption[] selectedContacts { get; set; }
    public SelectOption[] allContacts { get; set; }
  
 public String message { get; set; }
  
 public MultiselectController() {
        selectedContacts = new List<SelectOption>();
         
        List<Contact> contacts = [SELECT Name, Id FROM Contact];    
        allContacts = new List<SelectOption>();
        for ( Contact c : contacts ) {
            allContacts.add(new SelectOption(c.Id, c.Name));
        }
    }
     
    // Parse &-separated values and labels from value and 
    // put them in option
    private void setOptions(SelectOption[] options, String value) {
        options.clear();
        String[] parts = value.split('&');
        for (Integer i=0; i<parts.size()/2; i++) {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i*2], 'UTF-8'), 
              EncodingUtil.urlDecode(parts[(i*2)+1], 'UTF-8')));
        }
    }
     
    // Backing for hidden text field containing the options from the
    // left list
    public String leftOptionsHidden { get; set {
           leftOptionsHidden = value;
           setOptions(leftOptions, value);
        }
    }
     
    // Backing for hidden text field containing the options from the
    // right list
    public String rightOptionsHidden { get; set {
           rightOptionsHidden = value;
           setOptions(rightOptions, value);
        }
    }
  
 public PageReference save() {
        message = 'Selected Contacts: ';
        Boolean first = true;
        for ( SelectOption so : selectedContacts ) {
            if (!first) {
                message += ', ';
            }
            message += so.getLabel() + ' (' + so.getValue() + ')';
            first = false;
        }
         
        return null;       
    }
}