trigger insertBeforeTrig on Account (before insert,before update) {
    if(Trigger.isInsert){
        if(Trigger.isbefore){
            insertBeforeTrigDemoHandller.accountInser(Trigger.new);
        }
    }else if(trigger.isUpdate){
        if(Trigger.isbefore){
            insertBeforeTrigDemoHandller.accountUpdate(Trigger.new,Trigger.oldMap);
        }
    }

}