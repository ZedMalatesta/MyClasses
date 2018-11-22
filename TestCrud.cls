public class TestCrud {
    
    public static Employee__c CreateEmployee(String firstName, String lastName, Id departmentId){
        Employee__c employee = new Employee__c(
            Name = lastName,
            First_Name__c = firstName,
            Department__c = departmentId
      
        );
        
        /*String name = employee.get('Name');
        name='Vasya';
        employee.put('Name', 'Vasya');*/
        
        Database.SaveResult sv = Database.insert(employee);             
        return employee;
    }    
    
    public static Employee__c UpdateEmployee(Id employeeId, String firstName, String lastName){
        Employee__c employee = new Employee__c(
            Id = employeeId,
            Name = lastName,
            First_Name__c = firstName
      
        );
     
        Database.SaveResult sv = Database.update(employee);      
        
        return employee;
    }    
    
    public static Boolean DeleteEmployee(Id employeeId){
        try{
           delete new Employee__c(Id=employeeId); 
        }
        catch(Exception ex){
            return false;
        }
        return true;
    }   
}