public class SpringCMApiEnvironment {
    public static SpringCMApiEnvironment__mdt getApiEnvironment() {
        //SpringCMEos.RetrieveEnvironment environment = new SpringCMEos.RetrieveEnvironment();
        //String environmentPrefix = environment.getEnvironmentPrefix();

        //system.debug('environment is ' +environment);
        //system.debug('environmentPrefix is ' +environmentPrefix);

        URL orgdomain = URL.getOrgDomainUrl();
            system.debug('orgdomain is ' +orgdomain);
            String instance;
            system.debug('string value of domain is ' +string.valueof(orgdomain));
            if(string.valueOf(orgdomain).contains('sandbox'))
            {  instance = 'UAT'; }
            else
            {  instance = 'PROD'; }

            SpringCMApiEnvironment__mdt meta = new SpringCMApiEnvironment__mdt();
            List<SpringCMApiEnvironment__mdt> lstmeta = New List<SpringCMApiEnvironment__mdt>();
            lstmeta = [Select DeveloperName, API_Account_ID__c, Audience__c, Datacenter__c, Integration_Key__c, Integration_User_ID__c,
                      Private_Key__c, Version__c from SpringCMAPIEnvironment__mdt where DeveloperName = :instance LIMIT 1 ];
            system.debug('lstmeta size ' +lstmeta.size());
            
            return lstmeta[0];
        
        
        //Default to PROD if for some reason its blank        
        //String environmentqueryname = instance;

       /* String prefix;
        if (String.isNotBlank(environmentPrefix)) 
            prefix = environmentPrefix.substringBefore('.').toLowerCase();

        if (prefix=='na11' || prefix=='na21' || prefix=='www')
            environmentqueryname = 'PROD';

        else if (prefix=='uatna11' || prefix=='uat')
            environmentqueryname = 'UAT';

        else if (prefix=='qana11' || prefix=='qana21' || prefix=='qa')
            environmentqueryname = 'QA';

        else if (prefix=='qarna11')
            environmentqueryname = 'QAR';
        
        if (Test.isRunningTest())
            environmentqueryname = 'TEST';

        environmentqueryname = 'UAT'; */
        
        /*return [SELECT Client_Id__c, Client_Secret__c, AuthEndpoint__c
                FROM SpringCMApiEnvironment__mdt
                WHERE DeveloperName =: environmentqueryname]; */
    }
}