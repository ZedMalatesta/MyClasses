public class TestCrudOffice {        

    public static Office__c CreateOffice(String name, Id employeeId){        
        
        /*directorId = null
        if (employeeId!=null)
        {
            try
            {
                Employee__c director = Employee__c(Id=employeeId);
                if (director.)
                {
                    
                }
                
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        else
        {
            return null;
        }*/
        
        Office__c  office = new Office__c (
            Name = name,
            Director__c = employeeId
        );
        
        Database.SaveResult sv = Database.insert(office);             
        return office;
    }
    
    
    public static Office__c UpdateOffice(Id officeId, String name){       
        Office__c office = new Office__c (
            Id = officeId,
            Name = name
        );
        
        Database.SaveResult sv = Database.update(office);             
        return office;
    }     
    
    public static Boolean DeleteOffice(Id officeId){
        try{
           delete new Office__c(Id=officeId); 
        }
        catch(Exception ex){
            return false;
        }
        return true;
    }   
}