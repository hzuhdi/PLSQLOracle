--Question 1
DECLARE
    v_dep_id employees.department_id%TYPE := &id;   
    CURSOR emp_cursor IS
    SELECT *
    FROM EMPLOYEES
    WHERE department_id = v_dep_id
    ORDER BY last_name;
    emp_record emp_cursor%rowtype;
BEGIN
    open emp_cursor;
LOOP
    FETCH emp_cursor into emp_record;
    dbms_output.put_line(emp_record.last_name || ' ' ||emp_record.first_name);
    EXIT WHEN emp_cursor%NOTFOUND;
END LOOP;
    CLOSE emp_cursor;
END;



--EXERCISE 3 NUMBER 2
DECLARE
    CURSOR dep_cursor IS
    SELECT department_id, department_name
    FROM departments
    ORDER BY department_id;
    
    CURSOR emp_cursor IS
    SELECT first_name, last_name, department_id
    FROM employees
    ORDER BY department_id;
BEGIN
    FOR b in dep_cursor LOOP
        dbms_output.put_line(b.department_id || ' ' || b.department_name);
        FOR a in emp_cursor LOOP
            IF a.department_id = b.department_id THEN
                dbms_output.put_line('-- ' || a.first_name || ' ' || a.last_name);
            END IF;
        END LOOP;
    END LOOP;
END;




--Number 3
DECLARE
    CURSOR emp_cursor IS
    SELECT salary
    FROM employees
    ORDER BY salary ASC; --important 
    shortSal NUMBER(8,2):=0;
    salaryVar NUMBER(8,2):=0;
    countVar INT:=0;
BEGIN
        FOR a in emp_cursor LOOP
            IF salaryVar < 15000 THEN    
                shortSal := (a.salary * 0.05);
                a.salary := a.salary + shortSal;
                --for make a total of salary raised
                salaryVar := salaryVar + shortSal;
                countVar := countVar + 1;
                    IF salaryVar > 15000 THEN
                        salaryVar := salaryVar - shortSal;
                        countVar := countVar - 1;
                        --decremented by the last input
                    END IF;
                --for counting a total of employee raised
            END IF;
        END LOOP;
        -- we need to let shortSal variable turned into 0 again
        -- as a reusable variable
        shortSal := 0;
        DBMS_OUTPUT.PUT_LINE('Total money spent : ' || salaryVar);
        DBMS_OUTPUT.PUT_LINE('Total Employee : ' || countVar);
END;