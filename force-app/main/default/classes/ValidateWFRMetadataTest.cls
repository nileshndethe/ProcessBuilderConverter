@isTest
public with sharing class ValidateWFRMetadataTest {
    

    @isTest
    public static void CanGetRulesEntity() {
        Dom.XmlNode wfr1Node = getWFR1();
        String ruleName = 'wfr_acct1';
        Dom.XmlNode rulesEntity = ValidateWFRMetadata.getRulesEntity(wfr1Node, ruleName);
        Dom.XmlNode verificationEntity = getWFR_rulesEntity();
        System.assertEquals(rulesEntity,verificationEntity );
        
    }


    private static Dom.XmlNode getWFR_rulesEntity() {
        String rulesEntity =  '<rules>' + 
        '<fullName>wfr_acct1</fullName>' + 
        '<actions>' + 
        '<name>UpdateRating</name>' + 
        '<type>FieldUpdate</type>' + 
        '</actions>' + 
        '<actions>' + 
        '<name>Update_Industry</name>' + 
        '<type>FieldUpdate</type>' + 
        '</actions>' + 
        '<actions>' + 
        '<name>Update_Owner</name>' + 
        '<type>FieldUpdate</type>' + 
        '</actions>' + 
        '<actions>' + 
        '<name>Update_Revenue_Currency</name>' + 
        '<type>FieldUpdate</type>' + 
        '</actions>' + 
        '<actions>' + 
        '<name>Update_Text_With_Null</name>' + 
        '<type>FieldUpdate</type>' + 
        '</actions>' + 
        '<active>false</active>' + 
        '<booleanFilter>1 OR 2</booleanFilter>' + 
        '<criteriaItems>' + 
        '<field>Account.Name</field>' + 
        '<operation>notEqual</operation>' + 
        '<value>foobar</value>' + 
        '</criteriaItems>' + 
        '<criteriaItems>' + 
        '<field>Account.AnnualRevenue</field>' + 
        '<operation>greaterThan</operation>' + 
        '<value>5000</value>' + 
        '</criteriaItems>' + 
        '<description>foo</description>' + 
        '<triggerType>onCreateOnly</triggerType>' + 
        '<workflowTimeTriggers>' + 
        '<actions>' + 
        '    <name>timeTrigger1</name>' + 
        '    <type>FieldUpdate</type>' + 
        '</actions>' + 
        '<timeLength>30</timeLength>' + 
        '<workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>' + 
        '</workflowTimeTriggers>' + 
    '</rules>' ;

        Dom.Document doc = new Dom.Document();
        doc.load(rulesEntity);
        return doc.getRootElement();
       
    }


    private static Dom.XmlNode getWFR1() {

        String wfr1String = '<?xml version="1.0" encoding="UTF-8"?>' + 
            '<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">' + 
            '<fieldUpdates>' + 
                '<fullName>UpdateRating</fullName>' + 
                '<field>Rating</field>' + 
                '<literalValue>Hot</literalValue>' + 
                '<name>UpdateRating</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Literal</operation>' + 
                '<protected>false</protected>' + 
                '<reevaluateOnChange>true</reevaluateOnChange>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>Update_Description</fullName>' + 
                '<field>Description</field>' + 
                '<formula>&#39;this description has been updated to foobar&#39;</formula>' + 
                '<name>Update Description</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Formula</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>Update_Industry</fullName>' + 
                '<field>Industry</field>' + 
                '<literalValue>Education</literalValue>' + 
                '<name>Update Industry</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Literal</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>Update_Owner</fullName>' + 
                '<field>OwnerId</field>' + 
                '<lookupValue>test-a3lxc4jylavy@example.com</lookupValue>' + 
                '<lookupValueType>User</lookupValueType>' + 
                '<name>Update Owner</name>' + 
                '<notifyAssignee>true</notifyAssignee>' + 
                '<operation>LookupValue</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>Update_Revenue_Currency</fullName>' + 
                '<field>AnnualRevenue</field>' + 
                '<formula>ABS(23)</formula>' + 
                '<name>Update Revenue (Currency)</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Formula</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>Update_Text_With_Null</fullName>' + 
                '<field>AccountNumber</field>' + 
                '<name>Update Text With Null</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Null</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<fieldUpdates>' + 
                '<fullName>timeTrigger1</fullName>' + 
                '<field>Industry</field>' + 
                '<literalValue>Construction</literalValue>' + 
                '<name>timeTrigger1</name>' + 
                '<notifyAssignee>false</notifyAssignee>' + 
                '<operation>Literal</operation>' + 
                '<protected>false</protected>' + 
            '</fieldUpdates>' + 
            '<rules>' + 
                '<fullName>wfr_acct1</fullName>' + 
                '<actions>' + 
                '<name>UpdateRating</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<actions>' + 
                '<name>Update_Industry</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<actions>' + 
                '<name>Update_Owner</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<actions>' + 
                '<name>Update_Revenue_Currency</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<actions>' + 
                '<name>Update_Text_With_Null</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<active>false</active>' + 
                '<booleanFilter>1 OR 2</booleanFilter>' + 
                '<criteriaItems>' + 
                '<field>Account.Name</field>' + 
                '<operation>notEqual</operation>' + 
                '<value>foobar</value>' + 
                '</criteriaItems>' + 
                '<criteriaItems>' + 
                '<field>Account.AnnualRevenue</field>' + 
                '<operation>greaterThan</operation>' + 
                '<value>5000</value>' + 
                '</criteriaItems>' + 
                '<description>foo</description>' + 
                '<triggerType>onCreateOnly</triggerType>' + 
                '<workflowTimeTriggers>' + 
                '<actions>' + 
                '    <name>timeTrigger1</name>' + 
                '    <type>FieldUpdate</type>' + 
                '</actions>' + 
                '<timeLength>30</timeLength>' + 
                '<workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>' + 
                '</workflowTimeTriggers>' + 
            '</rules>' + 
            '<rules>' + 
                '<fullName>wfr_acct2</fullName>' + 
                '<actions>' + 
                '<name>Update_Description</name>' + 
                '<type>FieldUpdate</type>' + 
                '</actions>' + 
                '<active>false</active>' + 
                '<description>foodesc</description>' + 
                '<formula>ShippingCity == &#39;Foobarville&#39;</formula>' + 
                '<triggerType>onCreateOrTriggeringUpdate</triggerType>' + 
            '</rules>' + 
            '</Workflow>';

        Dom.Document doc = new Dom.Document();
        doc.load(wfr1String);
        Dom.XMLNode wfr1Node = doc.getRootElement();
        return wfr1Node;
    }
}
