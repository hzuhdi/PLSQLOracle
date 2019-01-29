/*
1. 
Create a procedure by which the age of death of an existing president is entered. 
If the president is already deceased, a warning message should be given and the age of death should not be modified.
*/
CREATE OR REPLACE PROCEDURE pres_death(
    v_name IN president.pres_name%type,
    v_age IN president.death_age%type,
    v_death OUT president.death_age%type
) IS
BEGIN
    SELECT death_age INTO v_death FROM president WHERE pres_name = v_name;
    IF(v_death IS NULL) THEN
        UPDATE president SET death_age = v_age WHERE pres_name = v_name ;
        p(v_death);
    ELSE 
        p('Sorry You cant modify this president');
        p(v_death);
    END IF;
END;

--Invoke the president
    DECLARE
        v_death president.death_age%type;
    BEGIN
        pres_death('CARTER J M', 83, v_death);
    END;

SELECT * FROM president;
ROLLBACK;

/*
2. Procedure Press Hobby
*/
CREATE OR REPLACE PROCEDURE new_hobby_shin (
    v_presname IN pres_hobby.pres_name%type,
    v_hobby IN pres_hobby.hobby%type
    ) IS
v_count_p NUMBER:=0;
v_count_h NUMBER:=0;
insert_excep_p EXCEPTION;
insert_excep_h EXCEPTION;
BEGIN
    SELECT DISTINCT COUNT(pres_name) INTO v_count_p FROM pres_hobby WHERE pres_name = v_presname;
    SELECT DISTINCT COUNT(hobby) INTO v_count_h FROM pres_hobby WHERE hobby = v_hobby;
    
    IF(v_count_h = 0) THEN
        RAISE insert_excep_h;
    ELSIF (v_count_p = 0) THEN
        RAISE insert_excep_p;
    ELSE 
        INSERT INTO pres_hobby (pres_name, hobby) VALUES(v_presname, v_hobby);
    END IF;
    
EXCEPTION
    WHEN insert_excep_h THEN 
            p('Sorry no such hobbies');
    WHEN insert_excep_p THEN
            p('No such president');
END;

/*
Invoke the procedure
DECLARE
    v_count_p NUMBER;
    v_count_h NUMBER;
BEGIN
    new_hobby_shin('Bu G', 'FISHING');
    p(v_count_p);
    p(v_count_h);
END;

ALTER TRIGGER PRES_HOBBY_LIMIT DISABLE;
*/

/*
3. Create a stored function called AGE_PRESIDENT that returns the age of the president at 
the time of his inauguration. Use this function in the following select statement:  
*/
CREATE OR REPLACE FUNCTION AGE_PRESIDENT(
v_name IN administration.pres_name%type, 
v_ianu IN administration.year_inaugurated%type
)
RETURN NUMBER AS
    v_age president.birth_yr%type;
BEGIN
    SELECT BIRTH_YR 
    INTO v_age
    FROM president
    WHERE pres_name = v_name;  
    v_age := v_ianu - v_age;
    RETURN v_age;
END;

/*
Invoke 
*/
SELECT a.* , AGE_PRESIDENT(pres_name,year_inaugurated) age FROM administration a; 
SELECT * FROM administration
select * from president

/*
4. 
Create a select statement that displays the source 
code of the function AGE_PRESIDENT you just created in exercise 3.
*/
--Getting all the function
SELECT object_name
FROM   user_objects
WHERE  object_type = 'FUNCTION';

--Getting the bodyy of the function
SELECT text
FROM   user_source
WHERE name = 'AGE_PRESIDENT'
AND type = 'FUNCTION';

/*
5. Create a procedure that places the names of all presidents who were
born in one specific state, in a temporary table. Display the contents of this table. 
*/

