<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>When_job_posted_at_monster_com</fullName>
        <description>When job posted at monster.com</description>
        <protected>false</protected>
        <recipients>
            <recipient>rohitj@developer.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_App_New_job_Employment_website</template>
    </alerts>
    <rules>
        <fullName>job posting at employment website</fullName>
        <actions>
            <name>When_job_posted_at_monster_com</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employment_Website__c.Web_Address__c</field>
            <operation>equals</operation>
            <value>http://www.monsterindia.com</value>
        </criteriaItems>
        <description>job posting at employment website</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
