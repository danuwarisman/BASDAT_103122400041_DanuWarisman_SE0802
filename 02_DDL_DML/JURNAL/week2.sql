-- ====================================================================
-- NAMA : DANU WARISMAN
-- NIM  : 103122400041
-- ====================================================================

-- 1. PEMBUATAN TABEL (DDL)

CREATE TABLE film (
    id_film CHAR(5) PRIMARY KEY,
    judul VARCHAR2(50),
    sinopsis VARCHAR2(200),
    tahun NUMBER(4),
    durasi NUMBER(3)
);

CREATE TABLE theater (
    id_theater CHAR(5) PRIMARY KEY,
    harga NUMBER,
    kapasitas NUMBER,
    kelas VARCHAR2(20)
);

CREATE TABLE member (
    id_member CHAR(5) PRIMARY KEY,
    nama VARCHAR2(50),
    no_hp VARCHAR2(15),
    tgl_lahir DATE,
    email VARCHAR2(50)
);

CREATE TABLE jadwal (
    id_jadwal CHAR(5) PRIMARY KEY,
    id_film CHAR(5),
    id_theater CHAR(5),
    periode_start DATE,
    periode_end DATE,
    FOREIGN KEY (id_film) REFERENCES film(id_film),
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
);

CREATE TABLE inventaris (
    id_inventaris CHAR(5) PRIMARY KEY,
    id_theater CHAR(5),
    nomor_kursi VARCHAR2(5),
    FOREIGN KEY (id_theater) REFERENCES theater(id_theater)
);

CREATE TABLE transaksi (
    kode_pemesanan CHAR(5) PRIMARY KEY,
    id_jadwal CHAR(5),
    id_member CHAR(5),
    status VARCHAR2(20),
    tanggal DATE,
    total_harga NUMBER,
    FOREIGN KEY (id_jadwal) REFERENCES jadwal(id_jadwal),
    FOREIGN KEY (id_member) REFERENCES member(id_member)
);


-- 2. PENGISIAN DATA TABEL (DML - INSERT)

-- Data Tabel Film
INSERT INTO film (id_film, judul, sinopsis, tahun, durasi) VALUES ('01', 'totoro', 'totoro ghibli', 2010, 180);
INSERT INTO film (id_film, judul, sinopsis, tahun, durasi) VALUES ('02', 'detektif', 'detektif conan', 2015, 180);

-- Data Tabel Theater
INSERT INTO theater (id_theater, harga, kapasitas, kelas) VALUES ('01', 50000, 100, 'Regular');
INSERT INTO theater (id_theater, harga, kapasitas, kelas) VALUES ('02', 75000, 80, 'VIP');

-- Data Tabel Member (Identitas Asli Danu Warisman)
INSERT INTO member (id_member, nama, no_hp, tgl_lahir, email) VALUES ('01', 'Danu Warisman', '082133417122', TO_DATE('12-12-2003', 'DD-MM-YYYY'), 'danuwarisman514@gmail.com');
INSERT INTO member (id_member, nama, no_hp, tgl_lahir, email) VALUES ('02', 'Danu Student', '082133417122', TO_DATE('12-12-2003', 'DD-MM-YYYY'), 'danuwarisman@student.telkomuniversity.ac.id');

-- Data Tabel Jadwal
INSERT INTO jadwal (id_jadwal, id_film, id_theater, periode_start, periode_end) VALUES ('01', '01', '01', TO_DATE('01-06-2025', 'DD-MM-YYYY'), TO_DATE('07-06-2025', 'DD-MM-YYYY'));
INSERT INTO jadwal (id_jadwal, id_film, id_theater, periode_start, periode_end) VALUES ('02', '02', '02', TO_DATE('02-06-2025', 'DD-MM-YYYY'), TO_DATE('08-06-2025', 'DD-MM-YYYY'));

-- Data Tabel Inventaris
INSERT INTO inventaris (id_inventaris, id_theater, nomor_kursi) VALUES ('01', '01', 'A1');
INSERT INTO inventaris (id_inventaris, id_theater, nomor_kursi) VALUES ('02', '01', 'A2');

-- Data Tabel Transaksi
INSERT INTO transaksi (kode_pemesanan, id_jadwal, id_member, status, tanggal, total_harga) VALUES ('01', '01', '01', 'Lunas', TO_DATE('01-06-2026', 'DD-MM-YYYY'), 50000);
INSERT INTO transaksi (kode_pemesanan, id_jadwal, id_member, status, tanggal, total_harga) VALUES ('02', '02', '02', 'Pending', TO_DATE('02-12-2026', 'DD-MM-YYYY'), 75000);

COMMIT;


-- 3. MANIPULASI DATA (DML - UPDATE)

-- Update 1: Mengubah durasi film id '01'
UPDATE film SET durasi = 185 WHERE id_film = '01';
SELECT * FROM film WHERE id_film = '01';
-- Update 2: Menyesuaikan harga theater kelas Regular id '01'
UPDATE theater SET harga = 60000 WHERE id_theater = '01';
SELECT * FROM theater WHERE id_theater = '01';
-- Update 3: Memperbarui nomor HP profil member utama Danu
UPDATE member SET no_hp = '082133417122' WHERE id_member = '01';
SELECT * FROM member WHERE id_member = '01';
-- Update 4: Mengubah status transaksi kode '02' menjadi Lunas
UPDATE transaksi SET status = 'Lunas' WHERE kode_pemesanan = '02';
SELECT * FROM transaksi WHERE kode_pemesanan = '02';
-- Update 5: Mengubah posisi nomor kursi pada inventaris id '01'
UPDATE inventaris SET nomor_kursi = 'B1' WHERE id_inventaris = '01';
SELECT * FROM inventaris WHERE id_inventaris = '01';
COMMIT;


-- 4. MANIPULASI DATA (DML - DELETE)

-- Delete 1: Menghapus data kursi cadangan pada tabel inventaris
DELETE FROM inventaris WHERE id_inventaris = '02';
SELECT * FROM inventaris;

-- Delete 2: Menghapus baris catatan transaksi member kedua
DELETE FROM transaksi WHERE id_member = '02';
SELECT * FROM transaksi;
COMMIT;
