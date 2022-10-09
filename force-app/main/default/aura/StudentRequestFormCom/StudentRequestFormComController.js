({
    /*doInit : function(component, event, helper) {
        
       // var recid ='a024P00000naRz4';
        var recid = component.get("v.recordId");
        
        //Calling server side controller's getStudentDetails() method.
        var action = component.get('c.getStudentDetails');
        
        //Set method parameter of updateStudent() method, where "v.recordId" returns object record id of current screen.
        // action.setParams({"sId": component.get("v.recordId")});
        action.setParams({"sId": recid});
        
        action.setCallback(this, function(response){
            //<response.getState()> return response status as SUCCESS/ERROR/INCOMPLETE etc.
            var state = response.getState();
            console.log("state="+state)
            //If response from server side is <SUCCESS>, then we will set the component attribute "stud".
            if (state === 'SUCCESS'){
                var responseStudentRecord = response.getReturnValue();
                component.set('v.stud', responseStudentRecord);
            }else if (state === 'INCOMPLETE') {
                //Offline message display logic.
                var toastEvent = $A.get('e.force:showToast');
                toastEvent.setParams({
                    "title": 'OFFLINE!',
                    "message": 'You are in offline.'
                });
                toastEvent.fire();
            }else if (state === 'ERROR') {
                //Error message display logic.
                var errors = response.getError();
                var toastEvent = $A.get('e.force:showToast');
                toastEvent.setParams({
                    "title": 'ERROR!',
                    "message": errors[0].message
                });
                toastEvent.fire();
            }else {
                //Unknown message display logic.
                var toastEvent = $A.get('e.force:showToast');
                toastEvent.setParams({
                    "title": 'UNKOWN!',
                    "message": 'Unknown error.'
                });
                toastEvent.fire();
            }
        });
        
        $A.enqueueAction(action);
    },*/
    
    doSave : function(component, event, helper) {
        var action = component.get('c.UpdateStudentDetails');
        
        var stud = component.get('v.stud');
        alert(stud);
       
        console.log(component.get('v.stud'));
        
        alert(component.get('v.stud'));
        
        action.setParams({"student": component.get('v.stud')});
        
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log("state="+state)
            if (state == 'SUCCESS'){
               alert('Okay ');
               //var evt = $A.get("e.force:navigateToComponent");
                //evt.setParams({componentDef : "c:StudentRequestFormThanksCom"});
                
            }
          //evt.fire();
        });
        
        $A.enqueueAction(action, false);
 }
    
})