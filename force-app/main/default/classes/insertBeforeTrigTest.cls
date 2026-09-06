@isTest
public class insertBeforeTrigTest {
    @isTest
    static void createAcc(){
        List<Account> accList = new List<Account>();
        for(Integer i =1;i<=13;i++){
            Account a = new Account();
            a.Name = 'TestAccInserBefr'+ i;
            accList.add(a);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        List<Account> newAcc = [Select Id,Name,Rating,Industry From Account];
        Assert.areEqual(13,newAcc.size());
        for(Account ac:newAcc){
            Assert.areEqual('Hot',ac.Rating);
            Assert.areEqual('Media',ac.Industry);
        }
    }
    @isTest
    static void updateAcc(){
        List<Account> accList = new List<Account>();
        for(Integer i =1;i<=13;i++){
            Account a = new Account();
            a.Name = 'TestAccInserBefr'+ i;
            accList.add(a);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        List<Account> newAcc = [Select Id,Name,Rating,Industry,Type From Account];
        List<Account> accToUp = new List<Account>();
        for(Account ac:newAcc){
            ac.Industry = 'Energy';
            accToUp.add(ac);
        }
        update accToUp;
        //Assert.areEqual(13,newAcc.size());
        for(Account upAcc: [Select ID ,Type From Account]){
            Assert.areEqual('Prospect',upAcc.Type);
            //Assert.areEqual('Energy',ac.Industry);
        }
    }
}