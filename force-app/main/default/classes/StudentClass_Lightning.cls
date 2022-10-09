public with sharing class StudentClass_Lightning {
    
    
    /*@AuraEnabled
    public static Student_Request_Form__c getStudentDetails(Id sId) {
        List<Student_Request_Form__c> studnetrec = new List<Student_Request_Form__c>();
        if(sId != null)    
         studnetrec = [SELECT Id, Name__c, Email__c FROM Student_Request_Form__c WHERE Id = :sId];
        if(! studnetrec.isEmpty())
         return studnetrec.get(0);
        
        return null;
    }*/
    
     @AuraEnabled
	public static Student_Request_Form__c UpdateStudentDetails(Student_Request_Form__c student) {
        
            system.debug('List of students '+student);
            insert student;
        
        return student;
	}

}