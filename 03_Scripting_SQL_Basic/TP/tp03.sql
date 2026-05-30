-- ====================================================================
-- NAMA : DANU WARISMAN
-- NIM  : 103122400041
-- ====================================================================

-- 1. PEMBUATAN TABEL MAHASISWA (DDL)

CREATE TABLE mahasiswa (
    id CHAR(5) PRIMARY KEY,
    nama VARCHAR2(50),
    tempat_lahir VARCHAR2(30),
    tanggal_lahir DATE,
    nomor_hp VARCHAR2(15),
    email VARCHAR2(50),
    tinggi_badan NUMBER(3),
    berat_badan NUMBER(3)
);


-- 2. PENGISIAN DATA SEBANYAK 15 ROWS (DML)
-- Baris 1 & 2 diisi menggunakan variasi data profil asli Danu Warisman

INSERT INTO mahasiswa VALUES ('01', 'Danu Warisman', 'Purwokerto', TO_DATE('12-12-2003', 'DD-MM-YYYY'), '082133417122', 'danuwarisman514@gmail.com', 172, 65);
INSERT INTO mahasiswa VALUES ('02', 'Danu Student', 'Banyumas', TO_DATE('12-12-2003', 'DD-MM-YYYY'), '082133417122', 'danuwarisman@student.telkomuniversity.ac.id', 172, 65);
INSERT INTO mahasiswa VALUES ('03', 'Radita', 'Klaten', TO_DATE('14-02-2003', 'DD-MM-YYYY'), '081234560003', 'radita@gmail.com', 172, 68);
INSERT INTO mahasiswa VALUES ('04', 'Felix Dika', 'Jakarta', TO_DATE('30-08-2002', 'DD-MM-YYYY'), '081234560004', 'felix@gmail.com', 175, 70);
INSERT INTO mahasiswa VALUES ('05', 'Marta Siro', 'Medan', TO_DATE('11-03-2003', 'DD-MM-YYYY'), '081234560005', 'marta@gmail.com', 165, 55);
INSERT INTO mahasiswa VALUES ('06', 'Hary Putra', 'Surabaya', TO_DATE('25-07-2002', 'DD-MM-YYYY'), '081234560006', 'hary@gmail.com', 168, 58);
INSERT INTO mahasiswa VALUES ('07', 'Tika Lestari', 'Padang', TO_DATE('19-09-2003', 'DD-MM-YYYY'), '081234560007', 'tika@gmail.com', 160, 48);
INSERT INTO mahasiswa VALUES ('08', 'Putri Ayu', 'Bogor', TO_DATE('04-11-2002', 'DD-MM-YYYY'), '081234560008', 'putri@gmail.com', 159, 49);
INSERT INTO mahasiswa VALUES ('09', 'Aris Nanta', 'Banjar', TO_DATE('15-06-2003', 'DD-MM-YYYY'), '081234560009', 'nanta@gmail.com', 171, 67);
INSERT INTO mahasiswa VALUES ('10', 'Aulia Safitri', 'Solo', TO_DATE('08-12-2002', 'DD-MM-YYYY'), '081234560010', 'aulia@gmail.com', 163, 53);
INSERT INTO mahasiswa VALUES ('11', 'Zaki Zahran', 'Palembang', TO_DATE('27-01-2003', 'DD-MM-YYYY'), '081234560011', 'zaki@gmail.com', 174, 71);
INSERT INTO mahasiswa VALUES ('12', 'Rani Wijaya', 'Makassar', TO_DATE('10-10-2002', 'DD-MM-YYYY'), '081234560012', 'rani@gmail.com', 161, 51);
INSERT INTO mahasiswa VALUES ('13', 'Farah Dibba', 'Bandung', TO_DATE('03-03-2003', 'DD-MM-YYYY'), '081234560013', 'farah@gmail.com', 162, 50);
INSERT INTO mahasiswa VALUES ('14', 'Wulandari', 'Lampung', TO_DATE('17-04-2002', 'DD-MM-YYYY'), '081234560014', 'wulandari@gmail.com', 160, 50);
INSERT INTO mahasiswa VALUES ('15', 'Kumi Tanaka', 'Semarang', TO_DATE('29-09-2003', 'DD-MM-YYYY'), '081234560015', 'kumi@gmail.com', 178, 75);

COMMIT;
SELECT * FROM mahasiswa;

-- 3. EKSEKUSI FUNGSI-FUNGSI BUILT-IN ORACLE

-- a) Fungsi Karakter dan String
SELECT 
    nama,
    LOWER(nama) AS huruf_kecil,
    UPPER(nama) AS huruf_besar,
    INITCAP(nama) AS kapital_awal,
    CONCAT(nama, ' Mahasiswa') AS gabung_teks,
    LENGTH(nama) AS jumlah_huruf,
    SUBSTR(nama, 1, 4) AS potong_empat_huruf,
    LPAD(nama, 20, '*') AS rata_kanan_pad,
    RPAD(nama, 20, '*') AS rata_kiri_pad,
    LTRIM('   DATABASE') AS bersihkan_kiri,
    RTRIM('DATABASE   ') AS bersihkan_kanan,
    INSTR(nama, 'a') AS posisi_huruf_a,
    REPLACE(nama, 'a', '@') AS ganti_huruf
FROM mahasiswa;

-- b) Fungsi Tanggal dan Waktu
SELECT 
    nama,
    tanggal_lahir,
    TO_CHAR(tanggal_lahir, 'MM') AS bulan_angka,
    TO_CHAR(tanggal_lahir, 'MON') AS bulan_singkat,
    TO_CHAR(tanggal_lahir, 'MONTH') AS bulan_lengkap,
    TO_CHAR(tanggal_lahir, 'DD') AS angka_tanggal,
    TO_CHAR(tanggal_lahir, 'DY') AS nama_hari_singkat,
    TO_CHAR(tanggal_lahir, 'YYYY') AS tahun_empat_digit,
    TO_CHAR(tanggal_lahir, 'YY') AS tahun_dua_digit,
    TO_CHAR(tanggal_lahir, 'RR') AS tahun_format_rr,
    TO_CHAR(SYSDATE, 'AM') AS penanda_am_pm,
    TO_CHAR(SYSDATE, 'HH') AS jam_format_12,
    TO_CHAR(SYSDATE, 'HH24') AS jam_format_24,
    TO_CHAR(SYSDATE, 'MI') AS menit_sekarang,
    TO_CHAR(SYSDATE, 'SS') AS detik_sekarang,
    ADD_MONTHS(tanggal_lahir, 6) AS tambah_6_bulan,
    SYSDATE AS tanggal_hari_ini,
    LAST_DAY(tanggal_lahir) AS hari_terakhir_bulan,
    NEXT_DAY(tanggal_lahir, 'MONDAY') AS hari_senin_berikutnya,
    MONTHS_BETWEEN(SYSDATE, tanggal_lahir) AS selisih_hitungan_bulan,
    ROUND(tanggal_lahir, 'MONTH') AS pembulatan_ke_bulan,
    ROUND(tanggal_lahir, 'YEAR') AS pembulatan_ke_tahun
FROM mahasiswa;


-- c) Fungsi Konversi
SELECT 
    nama,
    TO_NUMBER(id) AS id_menjadi_number,
    TO_CHAR(tanggal_lahir, 'DD-MM-YYYY') AS tanggal_format_baru,
    TO_CHAR(tinggi_badan) AS tinggi_menjadi_char,
    TO_DATE('17-08-1945', 'DD-MM-YYYY') AS contoh_konversi_date
FROM mahasiswa;


-- d) Fungsi Numerik
SELECT 
    nama,
    ABS(berat_badan - 70) AS selisih_berat_mutlak,
    MOD(tinggi_badan, 5) AS sisa_bagi_tinggi,
    FLOOR(tinggi_badan / 3) AS pembulatan_bawah_tinggi,
    POWER(tinggi_badan, 2) AS tinggi_pangkat_dua,
    ROUND(tinggi_badan / 3, 2) AS pembulatan_desimal,
    CEIL(berat_badan / 4) AS pembulatan_atas_berat
FROM mahasiswa;