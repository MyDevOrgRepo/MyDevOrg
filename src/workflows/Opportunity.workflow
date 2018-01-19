<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Opportunity_over_2000_Contract_needs_to_be_created</fullName>
        <ccEmails>testmesfdc@gmail.com,rrjoshi89@gmail.com</ccEmails>
        <description>Opportunity over 2000, Contract needs to be created</description>
        <protected>false</protected>
        <recipients>
            <recipient>rohitj@developer.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_par_2000_contracts_need_to_be_created</template>
    </alerts>
    <alerts>
        <fullName>waiting_for_approval</fullName>
        <ccEmails>rrjoshi89@gmail.com</ccEmails>
        <description>waiting for approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>rohitj@developer.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opportunity_waiting_for_approval</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_approval_status</fullName>
        <description>set approval status</description>
        <field>Appoval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>update approval status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_approval_status_1</fullName>
        <description>Update approval status</description>
        <field>Appoval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>update approval status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_approval_status_2</fullName>
        <field>Appoval_Status__c</field>
        <literalValue>Pending</literalValue>
        <name>update approval status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_approval_status_Reject</fullName>
        <description>update_approval_status_Reject</description>
        <field>Appoval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>update approval status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity par 2000%2C contracts need to be created</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterOrEqual</operation>
            <value>2000</value>
        </criteriaItems>
        <description>Opportunity par 2000, contracts need to be created</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Opportunity_over_2000_Contract_needs_to_be_created</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.CreatedDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
