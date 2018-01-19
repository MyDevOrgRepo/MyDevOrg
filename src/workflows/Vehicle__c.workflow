<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>SendVehicalFields</fullName>
        <apiVersion>35.0</apiVersion>
        <description>SendVehicalFields</description>
        <endpointUrl>http://192.168.0.100:46908/jitterbit_ws/?id=f1836db9-acaa-4336-a3d7-b6a493567b0c</endpointUrl>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>rohitj@developer.com</integrationUser>
        <name>SendVehicalFields</name>
        <protected>true</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>SendVehicalFieldsViaOutbondMessages</fullName>
        <actions>
            <name>SendVehicalFields</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Vehicle__c.OwnerId</field>
            <operation>equals</operation>
            <value>Rohit Joshi</value>
        </criteriaItems>
        <description>SendVehicalFieldsViaOutbondMessages</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
