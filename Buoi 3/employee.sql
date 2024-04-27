alter session set "_ORACLE_SCRIPT"=true;
CREATE USER employee IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, DBA TO employee;

-- Sử dụng Schema
ALTER SESSION SET CURRENT_SCHEMA = employee;


create table employee
(
id int primary key,
name nvarchar2(50),
salary int,
id_manager int references employee(id)
);

delete from employee;

insert into employee values(1, 'Phong', 500, null);
insert into employee values (2, 'Tri',800,1);
insert into employee values (3,'Nguyen', 800, 1);
insert into employee values (4,'Thanh',900,2);

select * from employee;


DROP TRIGGER TRG_TEST;


-- truong hop 1
set serveroutput on;

CREATE OR REPLACE TRIGGER TRG_TEST
AFTER UPDATE OF salary ON employee
FOR EACH ROW
DECLARE
    v_Count NUMBER;
BEGIN
    SELECT count(*)
    INTO v_count
    FROM employee
    WHERE salary =1000;
    dbms_output.put_line('Total employee are ' || v_count);
END;

update employee
set salary=1000
where salary=800;


-- truong hop 2
set serveroutput on;
CREATE OR REPLACE TRIGGER TRG_TEST
AFTER UPDATE OF salary ON employee
DECLARE
    v_Count NUMBER;
BEGIN
    SELECT count(*)
    INTO v_count
    FROM employee
    WHERE salary =1000;
    dbms_output.put_line('Total employee are ' || v_count);
END;

update employee
set salary=1000
where salary=800;


-- truong hop 3
CREATE OR REPLACE TRIGGER TRG_TEST
AFTER UPDATE OF salary ON employee
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_Count NUMBER;
BEGIN
    SELECT count(*) INTO v_count
    FROM employee
    WHERE salary = 1000;
    dbms_output.put_line('Total employee are ' || v_count);
END;

update employee
set salary=1000
where salary =800;


-- truong hop 4

CREATE OR REPLACE TRIGGER TRG_TEST
FOR UPDATE ON employee
COMPOUND TRIGGER
    /* Declaration Section */
    v_count NUMBER;
    AFTER EACH ROW IS
    BEGIN 
        dbms_output.put_line('Update is done');
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM employee
        WHERE salary = 1000;
        dbms_output.put_line('Total employee are ' || v_count);
    END AFTER STATEMENT;
END TUA_TEST;

update employee
set salary=1000
where salary =800;


CREATE OR REPLACE TRIGGER TRG_TEST
FOR UPDATE ON employee
COMPOUND TRIGGER
  /* Declaration Section */
  v_count NUMBER;
  AFTER EACH ROW IS
  BEGIN
      dbms_output.put_line('Update is done');
  END AFTER EACH ROW;

  AFTER STATEMENT IS
  BEGIN
      SELECT count(*) INTO v_count
      FROM employee
      WHERE salary = 1000;
      dbms_output.put_line('Total employee are ' || v_count);
  END AFTER STATEMENT;
END TRG_TEST;

update employee
set salary=1000
where salary =800;


--------------------------------------------------------------------------------------


BEGIN 
COMMIT;
SET TRANSACTION NAME 'update_salary';

UPDATE EMPLOYEE
SET salary = salary + 500000
WHERE Empno = 1;
COMMIT; -- hoac ROLLBACK
END;
/

-------------------------------------------------------------------------------

-- rollback
BEGIN
    COMMIT;
    SET TRANSACTION NAME 'tadda';
    INSERT INTO Employee VALUES
          (10,'Name10',TO_DATE('1/1/1998','dd/mm/yyyy'),8, 
          3,TO_DATE('1/1/2000','dd/mm/yyyy'),2000000,1,1,'Note1','mail10@com.vn'); 
    INSERT INTO Employee VALUES 
          (12,'Name12',TO_DATE('1/1/1998','dd/mm/yyyy'),8, 
          3,TO_DATE('1/1/2000','dd/mm/yyyy'),2500000,1,1,'Note1','mail12@com.vn'); 
     EXCEPTION WHEN DUP_VAL_ON_INDEX
     THEN
        ROLLBACK;
        dbms_output.put_line('abc');
END;
/


-- commit
BEGIN
    UPDATE EMPLOYEE
    SET level_employee = 3
    WHERE Empno = 3;
    COMMIT;
    ROLLBACK;
END;
/


-- rollback to savepoint
BEGIN 
    UPDATE EMPLOYEE
    SET salary = salary + 500000
    WHERE empno = 1;
    SAVEPOINT diem_1;

    UPDATE employee
    SET salary = 0
    WHERE empno = 1;
    SAVEPOINT diem_2;
    COMMIT;
END;
/

----------------------------------------------------------------


CREATE OR REPLACE PROCEDURE test_autonomous
AS  
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    UPDATE employee
    SET employee.salary = employee.salary + 700000
    WHERE employee.empno = 1;
    ROLLBACK;
END;
/

BEGIN 
    UPDATE EMPLOYEE
    SET employee.salary = employee.salary + 500000
    WHERE employee.empno = 1;
    TEST_AUTONOMOUS;
    COMMIT;
END;
/


---------------------------------------------------------------

CREATE OR REPLACE PROCEDURE test_none_autonomous
AS
BEGIN
    UPDATE EMPLOYEE
    SET employee.salary = employee.salary + 500000
    WHERE employee.empno = 1;
    ROLLBACK;
END;
/


CREATE OR REPLACE PROCEDURE test_autonomous
AS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    UPDATE EMPLOYEE
    SET employee.SALARY = employee.salary + 500000
    WHERE employee.empno = 1;
    ROLLBACK;
END;
/


BEGIN
    UPDATE EMPLOYEE
    SET employee.salary + 500000
    WHERE employee.empno = 10 AND employee.STATUS = 0;
    TEST_AUTONOMOUS;
    COMMIT;
END;


