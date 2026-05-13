SET SERVEROUTPUT ON;
SET LINESIZE 200;
SET PAGESIZE 100;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25) NOT NULL,
    phone_number VARCHAR2(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4)
);

INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', TO_DATE('17-JUN-03', 'dd-MON-yy'), 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', TO_DATE('21-SEP-05', 'dd-MON-yy'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', TO_DATE('13-JAN-01', 'dd-MON-yy'), 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', TO_DATE('03-JAN-06', 'dd-MON-yy'), 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', TO_DATE('21-MAY-07', 'dd-MON-yy'), 'IT_PROG', 6000, NULL, 103, 60);

COMMIT;

PROMPT === ISI TABEL EMPLOYEES ===
SELECT * FROM employees;

CREATE OR REPLACE PROCEDURE increase_salary (
    department_id_in IN employees.department_id%TYPE,
    increase_pct_in IN NUMBER
)
IS
BEGIN
    FOR employee_rec IN (
        SELECT employee_id
        FROM employees
        WHERE department_id = increase_salary.department_id_in
    )
    LOOP
        UPDATE employees emp
        SET emp.salary = emp.salary + (emp.salary * increase_salary.increase_pct_in)
        WHERE emp.employee_id = employee_rec.employee_id;
        
        DBMS_OUTPUT.PUT_LINE ('Updated ' || SQL%ROWCOUNT);
    END LOOP;
END increase_salary;
/

BEGIN
    increase_salary (90, .50);
    ROLLBACK;
END;
/

PROMPT === HASIL SELECT SETELAH ROLLBACK (DEPT 90) ===
SELECT * FROM employees WHERE department_id = 90;