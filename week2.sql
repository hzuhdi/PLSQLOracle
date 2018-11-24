--question 1
--need to know the datatypes before to make sure data is stored
desc EMPLOYEES;

DECLARE
    emp_id NUMBER(6);
    fname VARCHAR2(20);
    lname VARCHAR2(25);
    email VARCHAR2(25);
    pn VARCHAR2(20);
    salary NUMBER(8,2);
BEGIN
    emp_id :=: emp_id;
    
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, SALARY
    INTO emp_id, fname, lname, email, pn, salary
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=emp_id;
    dbms_output.put_line(emp_id || ';' || fname || ';' || lname || ';' || email || ';' || pn || ';' || salary);
    
    EXCEPTION
        WHEN CASE_NOT_FOUND THEN
        dbms_output.put_line('Oops Not Found!');
END;

--question2
select * from JOB_HISTORY