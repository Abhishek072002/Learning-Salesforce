public class ContactTriggerHandller {
    public static void checkDuplicate(List<Contact> newConT,Map<Id,Contact> oldConT){
        //Same Email(Contact) And AccountId Combination check
        Set<Id> accId = new Set<Id>();
        for(Contact con : newConT){
            accId.add(con.AccountId);
        }
        
        if (accId.isEmpty()) {
            return; // nothing to check
        }
        
        List<Contact> conList = [SELECT ID,Email,AccountID From Contact Where AccountID In :accId];
        
        Map<String,Id> oldComboMap = new Map<String,Id>();
        if(!conList.isEmpty()){
            for(Contact com:conList){
                String oldCombination;
                if(com.Email != null && com.AccountId != null){
                    oldCombination = com.Email +'-'+ com.AccountId;
                }
                oldComboMap.put(oldCombination,com.Id);
            }
        }
        
        String newCombination;
        for(Contact newCom : newConT){
            if (newCom.AccountId == null || newCom.Email == null) {
                continue; // skip records without both fields set
            }
            newCombination = newCom.Email +'-'+ newCom.AccountId;
            
            if(oldComboMap.containsKey(newCombination)){
                Id matchedId = oldComboMap.get(newCombination);
                
                Boolean isDuplicate;
                
                if (oldConT == null) {
                    // insert scenario - any match is a duplicate
                    isDuplicate = true;
                } else {
                    // update scenario - only a duplicate if it matches a DIFFERENT record
                    isDuplicate = (matchedId != newCom.Id);
                }
                
                if (isDuplicate) {
                    newCom.addError('A contact with this email already exists under this account.');
                }
            }   
        }
    }
}