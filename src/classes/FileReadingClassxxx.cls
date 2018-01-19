public with sharing class FileReadingClassxxx {
String fileContent='';
public PageReference readContent() {
fileContent = fileBody.toString();
List<string> allemails = fileContent.split(',');
Employee__c myemail = new Employee__c();
List<Employee__c> lstemails = new List<Employee__c>();
for(Integer i=0;i<allemails.size();i++)
{
myemail = new Employee__c(email__c=allemails[i]);
lstemails.add(myemail);
}
insert lstemails;
return null;
}
public blob fileBody { get; set; }
}