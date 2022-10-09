@isTest
public class InvoicePDFCtrl_Test {
    
    @isTest static void InvoicePDFCtrl_TestMethod() {
        
        Opportunity opp = New Opportunity();
            opp.Name = 'Test Oppty';
            Opp.StageName ='Closed Won';
            opp.CloseDate = date.today()+30;
        insert opp;
        
        Invoice__c inv = New Invoice__c();
        	inv.Opportunity_Name__c = opp.Id;
        insert inv;
        
        Long i = 1000000;
        
        ApexPages.StandardController controller = new ApexPages.StandardController(inv);
        ApexPages.currentPage().getParameters().put('id', String.valueOf(inv.Id));
        InvoicePDFCtrl ipc = New InvoicePDFCtrl(controller);
        ipc.convert(i);
        
    }

}