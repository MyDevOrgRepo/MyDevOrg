trigger position_updation on Position__c (before update) {
    System.debug('Entry point');
    List<position__c> psn = [select name from position__c];
    System.debug('Got the list');
for(position__c p:trigger.new)
{String str=p.Name;
    System.debug('In first for');
    for(position__c p1:psn)
    {System.debug('In second for');
     String str1=p1.name;
     System.debug('str:'+str+'    str1:'+str1);
        if(str.equals(str1))
        {
                    System.debug('before');
                   p.addError('Position title cannot be updated!!!');
                    System.debug('after');
        }
    }
}
}