<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>setApprovalStatusToApproved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>setApprovalStatusToApproved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>setApprovalStatusToRejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>setApprovalStatusToRejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_vendor_approval_status_to_pending</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending For Approval</literalValue>
        <name>update vendor approval status to pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
