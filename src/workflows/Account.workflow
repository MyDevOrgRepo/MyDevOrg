<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Second</fullName>
        <field>birthdate__c</field>
        <formula>NOW()</formula>
        <name>Second</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Branch_Times</fullName>
        <description>Update Branch times according to Branch names</description>
        <field>Branch_Times__c</field>
        <formula>CASE(Branch__c , &apos;France&apos;, &apos;8.30am - 7pm (Mon – Fri)&apos;, 

&apos;Portugal&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES1&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;, 
&apos;Spain - ES2&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES3&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES4&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - Head Office&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - Mallorca&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,

&apos;Mumbai&apos;, &apos;10am - 00:30am (Mon - Fri) and 2:30pm - 9:30pm (Sat)&apos;,

&apos;Gold Coast&apos;, &apos;8am – 6pm Monday to Friday &amp; 9am to 1pm (Sat)&apos;,

&apos;TorFX - Penzance&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Moorgate HO – 3111&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Moorgate HO&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Manchester CD office&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,

&apos;SA - Cape Town&apos;,&apos;9am - 5pm (Mon – Fri)&apos;,
&apos;USA&apos;,&apos;9am - 5pm (Mon – Fri)&apos;

,&apos;&apos;)</formula>
        <name>Update Branch Times</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Branch_Times_as_per_Branch_Names</fullName>
        <description>Update Branch Times as per Branch Names</description>
        <field>Branch_Times__c</field>
        <formula>CASE(Branch__c , &apos;France&apos;, &apos;8.30am - 7pm (Mon – Fri)&apos;, 

&apos;Portugal&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES1&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;, 
&apos;Spain - ES2&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES3&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - ES4&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - Head Office&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,
&apos;Spain - Mallorca&apos;,&apos;9:30am - 2pm &amp; 3pm - 6pm (Mon - Fri)&apos;,

&apos;Mumbai&apos;, &apos;10am - 00:30am (Mon - Fri) and 2:30pm - 9:30pm (Sat)&apos;,

&apos;Gold Coast&apos;, &apos;8am – 6pm Monday to Friday &amp; 9am to 1pm (Sat)&apos;,

&apos;TorFX - Penzance&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Moorgate HO – 3111&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Moorgate HO&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,
&apos;Manchester CD office&apos;,&apos;8am - 8pm (Mon - Thurs); 8am - 7pm (Fri) and 10am - 2pm (Sat) enquiries only&apos;,

&apos;SA - Cape Town&apos;,&apos;9am - 5pm (Mon – Fri)&apos;,
&apos;USA&apos;,&apos;9am - 5pm (Mon – Fri)&apos;

,&apos;&apos;)</formula>
        <name>Update Branch Times as per Branch Names</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updateemail</fullName>
        <field>email__c</field>
        <formula>&apos;abc@123.com&apos;</formula>
        <name>Updateemail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Branch Times</fullName>
        <actions>
            <name>Update_Branch_Times</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Branch Times</description>
        <formula>ISCHANGED(Branch__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
