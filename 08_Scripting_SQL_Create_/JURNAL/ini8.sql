SET LINESIZE 200;
SET PAGESIZE 100;
COLUMN department_name FORMAT A25;
COLUMN last_name FORMAT A15;
COLUMN email FORMAT A25;
COLUMN vendor_name FORMAT A20;
COLUMN address FORMAT A15;
COLUMN item_name FORMAT A25;

CREATE TABLE department (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100),
    manager_id NUMBER,
    location_id NUMBER
);

CREATE TABLE employee (
    employee_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    salary NUMBER(10,2),
    commission_pct NUMBER(4,2),
    hire_date DATE NOT NULL,
    department_id NUMBER,
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE vendor (
    vendor_id NUMBER PRIMARY KEY,
    vendor_name VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20),
    address VARCHAR2(255)
);

CREATE TABLE product_item (
    item_id NUMBER PRIMARY KEY,
    item_name VARCHAR2(100) NOT NULL,
    price NUMBER(15,2),
    stock_quantity NUMBER,
    vendor_id NUMBER,
    CONSTRAINT fk_item_vendor FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
);

ANALYZE TABLE department COMPUTE STATISTICS;
ANALYZE TABLE employee COMPUTE STATISTICS;
ANALYZE TABLE vendor COMPUTE STATISTICS;
ANALYZE TABLE product_item COMPUTE STATISTICS;

INSERT INTO department VALUES (10, 'Administration', 101, 1500);
INSERT INTO department VALUES (20, 'Marketing', 102, 1600);
INSERT INTO department VALUES (30, 'Purchasing', 103, 1700);
INSERT INTO department VALUES (40, 'Human Resources', 104, 1800);
INSERT INTO department VALUES (50, 'IT Support', 105, 1900);
INSERT INTO department VALUES (60, 'Public Relations', 106, 2000);
INSERT INTO department VALUES (70, 'Sales', 107, 2100);
INSERT INTO department VALUES (80, 'Software Engineering', 108, 2200);
INSERT INTO department VALUES (90, 'Executive', 109, 2300);
INSERT INTO department VALUES (100, 'Finance', 110, 2400);

INSERT INTO employee VALUES (1, 'Warisman', 'warisman@company.com', 8000, 0.1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 80);
INSERT INTO employee VALUES (2, 'Santoso', 'santoso@company.com', 7500, NULL, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 80);
INSERT INTO employee VALUES (3, 'Pratama', 'pratama@company.com', 9000, 0.15, TO_DATE('2023-11-10', 'YYYY-MM-DD'), 80);
INSERT INTO employee VALUES (4, 'Wijaya', 'wijaya@company.com', 6000, NULL, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 50);
INSERT INTO employee VALUES (5, 'Kusuma', 'kusuma@company.com', 5500, NULL, TO_DATE('2025-03-12', 'YYYY-MM-DD'), 50);
INSERT INTO employee VALUES (6, 'Siregar', 'siregar@company.com', 12000, 0.2, TO_DATE('2022-08-22', 'YYYY-MM-DD'), 90);
INSERT INTO employee VALUES (7, 'Setiawan', 'setiawan@company.com', 6500, NULL, TO_DATE('2024-07-30', 'YYYY-MM-DD'), 10);
INSERT INTO employee VALUES (8, 'Nugroho', 'nugroho@company.com', 7200, 0.05, TO_DATE('2024-09-18', 'YYYY-MM-DD'), 70);
INSERT INTO employee VALUES (9, 'Saputra', 'saputra@company.com', 7100, 0.05, TO_DATE('2024-10-25', 'YYYY-MM-DD'), 70);
INSERT INTO employee VALUES (10, 'Hidayat', 'hidayat@company.com', 8500, NULL, TO_DATE('2023-05-14', 'YYYY-MM-DD'), 100);

INSERT INTO vendor VALUES (101, 'PT Tekno Maju', '081234567890', 'Jakarta');
INSERT INTO vendor VALUES (102, 'CV Abadi Jaya', '081298765432', 'Bandung');
INSERT INTO vendor VALUES (103, 'Global Parts ID', '081345678901', 'Surabaya');
INSERT INTO vendor VALUES (104, 'Sentosa Elektronik', '081456789012', 'Semarang');
INSERT INTO vendor VALUES (105, 'Bintang Hardware', '081567890123', 'Yogyakarta');
INSERT INTO vendor VALUES (106, 'Mitra Sejahtera', '081678901234', 'Malang');
INSERT INTO vendor VALUES (107, 'Karya Mandiri', '081789012345', 'Solo');
INSERT INTO vendor VALUES (108, 'Sinar Mas Supplies', '081890123456', 'Denpasar');
INSERT INTO vendor VALUES (109, 'Data Lintas Nusantara', '081901234567', 'Medan');
INSERT INTO vendor VALUES (110, 'Mekar Tech', '082012345678', 'Makassar');

INSERT INTO product_item VALUES (1001, 'Laptop ThinkPad', 15000000, 50, 101);
INSERT INTO product_item VALUES (1002, 'Mechanical Keyboard', 800000, 100, 102);
INSERT INTO product_item VALUES (1003, 'Wireless Mouse', 350000, 150, 102);
INSERT INTO product_item VALUES (1004, 'Monitor 24 Inch', 2500000, 40, 104);
INSERT INTO product_item VALUES (1005, 'Server Rack 42U', 12000000, 10, 109);
INSERT INTO product_item VALUES (1006, 'Network Switch 24 Port', 4500000, 25, 109);
INSERT INTO product_item VALUES (1007, 'Ergonomic Chair', 1200000, 80, 106);
INSERT INTO product_item VALUES (1008, 'Office Desk', 1800000, 60, 106);
INSERT INTO product_item VALUES (1009, 'UPS 1000VA', 1100000, 30, 105);
INSERT INTO product_item VALUES (1010, 'SSD 1TB NVMe', 1500000, 120, 103);

COMMIT;

PROMPT === TABEL DEPARTMENT ===
SELECT * FROM department;

PROMPT === TABEL EMPLOYEE ===
SELECT * FROM employee;

PROMPT === TABEL VENDOR ===
SELECT * FROM vendor;

PROMPT === TABEL PRODUCT ITEM ===
SELECT * FROM product_item;

ANALYZE TABLE department COMPUTE STATISTICS;
ANALYZE TABLE employee COMPUTE STATISTICS;
ANALYZE TABLE vendor COMPUTE STATISTICS;
ANALYZE TABLE product_item COMPUTE STATISTICS;

CREATE VIEW empvu80 AS
SELECT 
    employee_id AS id_number,
    last_name AS name,
    salary,
    department_id
FROM employee
WHERE department_id = 80;

PROMPT === ISI VIEW EMPVU80 ===
SELECT * FROM empvu80;

DESC empvu80;

CREATE INDEX idx_emp_dept ON employee(department_id);