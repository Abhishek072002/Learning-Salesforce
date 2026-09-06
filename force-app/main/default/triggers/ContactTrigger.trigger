trigger ContactTrigger on Contact (before insert,before update) {
    if(Trigger.isInsert && Trigger.isbefore){
        ContactTriggerHandller.checkDuplicate(Trigger.new,null);
    }else if(Trigger.isUpdate && Trigger.isbefore){
        ContactTriggerHandller.checkDuplicate(Trigger.new,Trigger.oldMap);
    }
}