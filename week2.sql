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

--q2
DECLARE
    dep_id employees.department_id%type:=&id;
    emp_sal employees.salary%type;
    counter INT:=0;
BEGIN
    UPDATE EMPLOYEES
    SET salary = salary + (salary * 0.05)
    WHERE department_id = dep_id;
    
    SELECT DISTINCT COUNT (employee_id) INTO counter FROM EMPLOYEES WHERE department_id = dep_id;
    dbms_output.put_line('Total Employee raised : ' || counter);
    
    EXCEPTION
        WHEN CASE_NOT_FOUND THEN
        dbms_output.put_line('Dep Id not found');
END;

--q3 still not sure
DECLARE
    CURSOR emp_cursor IS
    SELECT * FROM employees;
    counter INT:=0;
BEGIN
IF (counter <= 20) THEN
    for a in emp_cursor LOOP
        DELETE from employees
        WHERE
        a.salary > 1000 AND a.salary < 4000;
        counter:=counter+1;
    END LOOP;
END IF;
        dbms_output.put_line('Total Employees Deleted : ' || counter);
EXCEPTION
    WHEN CASE_NOT_FOUND THEN
    ROLLBACK;
    dbms_output.put_line('Too much deleted : '|| counter ||' operation aborted');
END;

--q4 THIS one is when using cursor
--but also we can use it without cursor

DECLARE
    input_lname employees.last_name%type:='&last_name';   
    CURSOR emp_cursor(emp_lname employees.last_name%type) IS
    SELECT *
    FROM employees
    WHERE last_name = emp_lname;
    emp_record employees%ROWTYPE;
BEGIN
        FOR a in emp_cursor(input_lname)LOOP
            dbms_output.put_line(a.first_name || ' THIS IS HIS FIRST NAME');
        END LOOP;
        
EXCEPTION
    WHEN CASE_NOT_FOUND THEN
        dbms_output.put_line('Nothing found with last name of : ' || input_lname);
END;