public class insertBeforeTrigDemoHandller {
    public static void accountInser(List<Account> accList){
        for(Account acc: accList){
            if(acc.Industry == null){
                acc.Rating = 'Hot';
                acc.Industry = 'Media';
            }
        }
    }
    public static void accountUpdate(List<Account> accList,Map<Id,Account> accOldMap){
        for(Account acc:accList){
            if(acc.Industry != null && acc.Industry == 'Energy' && accOldMap.get(acc.Id).Industry != 'Energy'){
                acc.Type = 'Prospect';
            }
        }
    }
}