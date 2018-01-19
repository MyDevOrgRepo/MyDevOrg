<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_New_Position_Alert</fullName>
        <ccEmails>sanketsupe@gmail.com</ccEmails>
        <description>Email New Position Alert .</description>
        <protected>false</protected>
        <recipients>
            <recipient>CEO</recipient>
            <type>roleSubordinates</type>
        </recipients>
        <recipients>
            <recipient>rohitj@developer.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_APP_New_Position</template>
    </alerts>
    <alerts>
        <fullName>New_position_approval</fullName>
        <description>New position approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>CEO</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>CFO</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Recruiting_App_New_Position_Requires_Approval</template>
    </alerts>
    <fieldUpdates>
        <fullName>Reassign_position_to_the_queue</fullName>
        <description>Assign the Position to the Unclaimed Positions Queue .</description>
        <field>OwnerId</field>
        <lookupValue>Unclaimed_Positions_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Reassign position to the queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Position_status</fullName>
        <description>Update position status</description>
        <field>Status__c</field>
        <literalValue>Closed - Not Approved</literalValue>
        <name>Update Position_status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Position_status_as_Approved</fullName>
        <description>Update position status as open approved</description>
        <field>Status__c</field>
        <literalValue>Open - Approved</literalValue>
        <name>Update_Position_status_as_Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>position_status_pending_approval</fullName>
        <description>updates position status as pending approval, if the CEO hasn’t approved it within certain period of time</description>
        <field>Status__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>position status pending approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Assign Position to Recruiter</fullName>
        <actions>
            <name>Reassign_position_to_the_queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>notEqual</operation>
            <value>Recruiter,Recruiting Manager</value>
        </criteriaItems>
        <description>Reassign position records to a recruiter if they were created by another type of employee</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Assign_Unclaimed_Position_Record_to_Recruiter</name>
                <type>Task</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Sending Email for new positions</fullName>
        <actions>
            <name>Email_New_Position_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>Open - Approved</value>
        </criteriaItems>
        <description>Email alert on creation of new position</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Assign_Unclaimed_Position_Record_to_Recruiter</fullName>
        <assignedTo>Recruiting_Manager</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assign Unclaimed Position Record to Recruiter .</subject>
    </tasks>
</Workflow>
