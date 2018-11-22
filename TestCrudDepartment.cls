public class TestCrudDepartment {
    
    private static String GetDirectorEmail(Id officeId){
        IF (officeId!=null)
        {
            try
            {
                Employee__c director = Database.query('SELECT Director__c FROM Office__c WHERE Id=officeId');
                return director.Email__c;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        ELSE
        {
            return null;
        }
    }            
    
    public static Department__c CreateDepartment(String name, Id officeId){       
   
        Department__c  department = new Department__c (
            Name = name,
            Office__c = officeId,
            Office_Director_Email__c=GetDirectorEmail(officeId)
        );
        
        Database.SaveResult sv = Database.insert(department);             
        return department;
    }
    
    
    public static Department__c UpdateDepartment(Id departmentId, String name, Id officeId){       
        Department__c  department = new Department__c (
            Id = departmentId,
            Name = name,
            Office__c = officeId,
            Office_Director_Email__c=GetDirectorEmail(officeId)
        );
        
        Database.SaveResult sv = Database.update(department);             
        return department;
    }     
    
    public static Boolean DeleteDepartment(Id departmentId){
        try{
           delete new Department__c(Id=departmentId); 
        }
        catch(Exception ex){
            return false;
        }
        return true;
    }   
}