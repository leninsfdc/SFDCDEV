public class InvoicePDFCtrl {

    public Invoice__c ivrec{get;set;}
    
    public String invoiceid{get;set;}
    
    public string wordText{set;get;}
    
    public long teja{get;set;}
    public integer amt{get;set;}
    public string panNo{get;set;}

    public InvoicePDFCtrl(ApexPages.StandardController controller) {
    
        invoiceid=ApexPages.currentPage().getParameters().get('id');
        
        System.debug('***************invoice of Record id *******************'+invoiceid);
        
        ivrec=[SELECT Invoice_NoU__c,Discount__c,Invoice_No__c,Account_Name__c,Consultant_Name__c,Contact_Person__c,Customer_Id__c,Date__c,Due_Date__c,Gross_Amount__c,Id,Months__c,Name,Opportunity_Name__c,PAYMENT_TERMS__c,Net_Amount__c FROM Invoice__c where id=:invoiceid];
        
        amt=Integer.valueOf(ivrec.Net_Amount__c);
        teja = amt;
        wordText=convert(teja);
        
       System.debug('**************************************'+wordText);
        panNo = System.Label.PAN_NO;

    }
    
    public string convert() {
        wordText=convert(numberval);
        return null;
    }

    public long numberval { get; set; }

    public String[] units = new String[]{'Zero ','One ','Two ','Three ','Four ','Five ','Six ','Seven ','Eight ','Nine ','Ten ',
        'Eleven ','Twelve ','Thirteen ','Fourteen ','Fifteen ',
        'Sixteen ','Seventeen ','Eighteen ','Nineteen '};
    public String[] tens = new String[]{'','','Twenty','Thirty','Forty','Fifty','Sixty','Seventy','Eighty','Ninety'};
  
    //This method is used to convert the integer to words
    public  String convert(long i) {
      //
      if( i < 20)  return units[integer.valueOf(i)];
      if( i < 100) return tens[integer.valueOf(i)/10] + ((math.mod(i , 10) > 0)? '' + convert(math.mod(i , 10)):'');
      if( i < 1000) return units[integer.valueOf(i)/100] + ' Hundred ' + ((math.mod(i , 100) > 0)?' ' + convert(math.mod(i , 100)):'');
      if( i < 10000) return units[integer.valueOf(i)/1000] + ' Thousand ' + ((math.mod(i , 1000) > 0)?' ' + convert(math.mod(i , 1000)):'');
      if( i < 100000) return convert(i / 1000) + ' Thousand ' + ((math.mod(i , 1000) > 0)? '' + convert(math.mod(i ,1000)):'') ;
      if( i < 1000000) return units[integer.valueOf(i)/100000] + ' Lakh ' + ((math.mod(i , 100000) > 0)? '' + convert(math.mod(i ,100000)):'') ;
      if( i < 10000000) return convert(i / 100000) + ' Lakh ' + ((math.mod(i , 100000) > 0)? '' + convert(math.mod(i ,100000)):'') ;
      if(i < 100000000) return units[integer.valueOf(i)/10000000] + ' Crore ' + ((math.mod(i , 10000000) > 0)? '' + convert(math.mod(i , 10000000)):'') ;
      if(i < 1000000000) return convert(i / 10000000) + 'Crore ' + ((math.mod(i , 10000000) > 0)? '' + convert(math.mod(i , 10000000)):'') ;
      
      return convert(i / 1000000000) + ' Crore ' + ((math.mod(i , 1000000000) > 0) ? '' + convert(math.mod(i , 1000000000)):'') ;
    }

}