-- Membuat tabel Dim_Waktu (Dimensi Waktu)
CREATE TABLE Dim_Waktu (
    waktu_id SERIAL PRIMARY KEY,
    date DATE,            -- Tanggal spesifik
    month INT,            -- Bulan dalam bentuk angka
    quarter INT,          -- Kuartal (1 hingga 4)
    year INT              -- Tahun
);

-- Membuat tabel Dim_Model (Dimensi Model)
CREATE TABLE Dim_Model (
    model_id SERIAL PRIMARY KEY,
    model TEXT,            -- Nama model kendaraan (misal: Model 3, Model Y)
    battery_type TEXT,     -- Jenis baterai (Long Range, Performance, dll.)
    drive_type TEXT,       -- Tipe penggerak (AWD, RWD)
    color TEXT             -- Warna kendaraan
);

-- Membuat tabel Dim_Wilayah (Dimensi Wilayah)
CREATE TABLE Dim_Wilayah (
    wilayah_id SERIAL PRIMARY KEY,
    city TEXT,             -- Kota tujuan distribusi
    region TEXT,           -- Wilayah atau provinsi
    country TEXT           -- Negara
);

-- Membuat tabel Dim_Performa (Dimensi Performa)
CREATE TABLE Dim_Performa (
    performa_id SERIAL PRIMARY KEY,
    software_version TEXT,     -- Versi perangkat lunak terinstal
    efficiency FLOAT,          -- Efisiensi energi kendaraan (Wh/km)
    charging_time INT,         -- Waktu pengisian daya rata-rata (menit)
    autopilot_enabled BOOLEAN  -- Status aktif/tidaknya fitur Autopilot
);

-- Membuat tabel Dim_Pelanggan (Dimensi Pelanggan)
CREATE TABLE Dim_Pelanggan (
    pelanggan_id SERIAL PRIMARY KEY,
    warranty_period INT,        -- Durasi garansi (bulan)
    update_frequency INT,       -- Frekuensi pembaruan software (bulan)
    customer_rating FLOAT       -- Rating pelanggan terhadap kendaraan (skala 1-5)
);