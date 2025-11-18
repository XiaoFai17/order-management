-- Tabel Customer
CREATE TABLE customer (
    id_customer INT PRIMARY KEY,
    nama VARCHAR(255),
    email VARCHAR(255),
    telepon VARCHAR(20),
    alamat TEXT,
    kota VARCHAR(100),
    region VARCHAR(50),
    metode_pembayaran VARCHAR(50)
);

-- Tabel Pengirim
CREATE TABLE pengirim (
    id_pengirim INT PRIMARY KEY,
    nama_pengirim VARCHAR(255),
    metode_pengiriman VARCHAR(100),
    estimasi_hari INT
);

-- Tabel Faktur
CREATE TABLE faktur (
    id_faktur INT PRIMARY KEY,
    id_customer INT,
    id_pengirim INT,
    tanggal DATE,
    status VARCHAR(50),
    FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY (id_pengirim) REFERENCES pengirim(id_pengirim)
);

-- Tabel Barang
CREATE TABLE barang (
    id_barang INT PRIMARY KEY,
    nama_barang VARCHAR(255),
    kategori VARCHAR(100),
    harga_default DECIMAL(10, 2),
    lokasi_gudang VARCHAR(100),
    stok INT
);

-- Tabel Faktur Detail
CREATE TABLE faktur_detail (
    id_faktur INT,
    id_barang INT,
    jumlah INT,
    harga DECIMAL(10, 2),
    total_harga DECIMAL(10, 2),
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
    FOREIGN KEY (id_faktur) REFERENCES faktur(id_faktur)
);

-- View Cluster
CREATE VIEW tampilan_kinerja_penjualan_produk AS
SELECT
    b.id_barang,
    b.nama_barang,
    b.kategori,
    b.harga_default,
    SUM(fd.jumlah) AS total_kuantitas_terjual,
    SUM(fd.total_harga) AS total_pendapatan_dihasilkan,
    AVG(fd.harga) AS harga_jual_rata_rata_per_unit
FROM
    barang b
LEFT JOIN
    faktur_detail fd ON b.id_barang = fd.id_barang
GROUP BY
    b.id_barang, b.nama_barang, b.kategori, b.harga_default;

-- View Forecasting
CREATE VIEW tampilan_penjualan_harian AS
SELECT
    f.tanggal AS tanggal_penjualan,
    SUM(fd.total_harga) AS total_pendapatan_harian,
    COUNT(f.id_faktur) AS jumlah_faktur_harian
FROM
    faktur f
JOIN
    faktur_detail fd ON f.id_faktur = fd.id_faktur
GROUP BY
    f.tanggal
ORDER BY f.tanggal;
