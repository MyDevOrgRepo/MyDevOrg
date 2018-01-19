global class setPositionStatus {

       webservice static String markOpenApproved(String positionId) {    
        //get the lead
        Position__c l = new Position__c();        
       l = [select id,status__c from position__c where id =:positionId];
       
            //l.status__c = 'Open - Approved';
            //update Status value on the position
             if(l.status__c == 'New Position No') {
                l.status__c = 'Open - Approved';
             }
            update l; 
        
        return '/' + positionId; // take us back to the refreshed page
     }

    
}