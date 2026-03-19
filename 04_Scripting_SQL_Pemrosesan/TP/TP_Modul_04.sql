CREATE TABLE teater (
    nomor_teater VARCHAR2(20) PRIMARY KEY
);

CREATE TABLE kursi (
    nomor_teater VARCHAR2(20),
    nomor_kursi VARCHAR2(5),
    CONSTRAINT fk_teater FOREIGN KEY (nomor_teater) REFERENCES teater(nomor_teater)
);

INSERT ALL
    INTO teater VALUES ('Teater 1')
    INTO teater VALUES ('Teater 2')
    INTO teater VALUES ('Teater 3')
    INTO teater VALUES ('Teater 4')
    INTO teater VALUES ('Teater 5')
SELECT * FROM dual;

INSERT INTO kursi (nomor_teater, nomor_kursi)
SELECT t.nomor_teater, b.huruf || k.angka
FROM teater t
CROSS JOIN (
    SELECT 'A' AS huruf FROM dual UNION ALL 
    SELECT 'B' FROM dual UNION ALL 
    SELECT 'C' FROM dual UNION ALL 
    SELECT 'D' FROM dual UNION ALL 
    SELECT 'E' FROM dual
) b
CROSS JOIN (
    SELECT '1' AS angka FROM dual UNION ALL 
    SELECT '2' FROM dual UNION ALL 
    SELECT '3' FROM dual UNION ALL 
    SELECT '4' FROM dual UNION ALL 
    SELECT '5' FROM dual UNION ALL 
    SELECT '6' FROM dual UNION ALL 
    SELECT '7' FROM dual UNION ALL 
    SELECT '8' FROM dual
) k;

SELECT t.nomor_teater, k.nomor_kursi AS no_k
FROM teater t
JOIN kursi k ON t.nomor_teater = k.nomor_teater
ORDER BY t.nomor_teater, k.nomor_kursi;