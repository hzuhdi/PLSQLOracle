--Question 1
DECLARE 
   student_name  varchar2(40);
   student_number int(11);
BEGIN 
    student_name:=:student_name;
    student_number:=:student_number;
   dbms_output.put_line('My Name is ' || student_name || ' And my student accont is :' || student_number);
END; 

--Question 2
DECLARE 
   datenow  DATE := SYSDATE;
   datetomorrow DATE;
   dayt NUMBER(2);
   dtname VARCHAR(10);
   dtmname VARCHAR(10);
   yname VARCHAR(20);  
BEGIN 
    datetomorrow := datenow + 1;
    dayt := TO_CHAR(datetomorrow, 'DD');
    dtname := TO_CHAR(datetomorrow,'DAY');
    dtmname := TO_CHAR(datetomorrow, 'Mon');
    yname := TO_CHAR(datetomorrow, 'YEAR');
    dbms_output.put_line('Tomorrow : ' || dtname || ' ' || dayt || ' ' || dtmname || ' ' || yname);
END; 

--QUESTION 3
DECLARE
    fnum INT:=0;
    fnum2 INT:=0;
    fnum3 NUMBER(2);
    tomul INT;
    res INT;
BEGIN
    tomul:=:tomul;
    --basic loop
    dbms_output.put_line('Basic LOOP');
    LOOP
        fnum:= fnum+1;
        res := fnum * tomul;
        dbms_output.put_line(fnum || ' * ' || tomul || ' = ' || res);
        exit WHEN fnum = 10;
    END LOOP;
    
    --whileloop
    dbms_output.put_line('While LOOP');
    WHILE fnum2 <10 LOOP
        fnum2:=fnum2+1;
        res := fnum2 * tomul;
        dbms_output.put_line(fnum2 || ' * ' || tomul || ' = ' || res);
    END LOOP;
    
    --forloop
    dbms_output.put_line('For LOOP');
    FOR fnum3 in 1 .. 10 LOOP
        res := fnum3 * tomul;

        dbms_output.put_line(fnum3 || ' * ' || tomul || ' = ' || res);
    
    END LOOP;
END;

--QUESTION 4
DECLARE
    fibofirst INT :=0;
    fibosecond INT :=1;
    fibotemp INT;
    fibolimit NUMBER(2);
BEGIN
    fibolimit:=:fibolimit;
    dbms_output.put_line(fibofirst);
    dbms_output.put_line(fibosecond);
    FOR a in 1 .. fibolimit LOOP
        fibotemp := fibofirst + fibosecond;
        dbms_output.put_line(fibotemp);        
        fibofirst:= fibosecond;
        fibosecond:= fibotemp;
    END LOOP;
END;