CREATE TABLE Dim_Waktu (
    waktu_id SERIAL PRIMARY KEY,  -- ID unik untuk setiap entri waktu
    year INT,                     -- Tahun
    quarter TEXT                  -- Kuartal (Q1, Q2, Q3, Q4)
);

CREATE TABLE Dim_Model (
    model_id SERIAL PRIMARY KEY,    -- ID unik untuk setiap model
    model TEXT,                     -- Nama model kendaraan (misal: Model 3, Model X)
    battery_type TEXT,              -- Jenis baterai (Long Range, Performance, dll.)
    drive_type TEXT,                -- Tipe penggerak (AWD, RWD)
    color TEXT                      -- Warna kendaraan
);

CREATE TABLE Dim_Wilayah (
    wilayah_id SERIAL PRIMARY KEY,  -- ID unik untuk setiap wilayah
    city TEXT,                     -- Kota distribusi kendaraan
    region TEXT,                   -- Wilayah atau provinsi
    country TEXT                   -- Negara
);

CREATE TABLE Dim_Performa (
    performa_id SERIAL PRIMARY KEY,   -- ID unik untuk setiap entri performa
    software_version TEXT,            -- Versi perangkat lunak kendaraan
    efficiency FLOAT,                 -- Efisiensi energi kendaraan (Wh/km)
    charging_time INT,                -- Waktu pengisian daya rata-rata (menit)
    autopilot_enabled BOOLEAN         -- Status aktif/tidaknya fitur Autopilot
);

CREATE TABLE Dim_Pelanggan (
    pelanggan_id SERIAL PRIMARY KEY,  -- ID unik untuk setiap pelanggan
    warranty_period INT,              -- Durasi garansi (dalam tahun)
    update_frequency INT,             -- Frekuensi pembaruan perangkat lunak (per tahun)
    customer_rating FLOAT             -- Rating pelanggan terhadap kendaraan (skala 1-5)
);
