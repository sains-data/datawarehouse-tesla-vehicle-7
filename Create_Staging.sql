CREATE TABLE Staging_Pengiriman_Kendaraan (
    raw_id INT PRIMARY KEY AUTO_INCREMENT,  -- ID unik untuk setiap entri data
    year INT,                               -- Tahun
    quarter TEXT,                            -- Kuartal (Q1, Q2, Q3, Q4)
    region TEXT,                             -- Wilayah atau provinsi
    model TEXT,                              -- Model kendaraan
    units_delivered INT,                     -- Jumlah kendaraan yang dikirim
    average_price_usd FLOAT,                 -- Harga rata-rata (USD)
    production_delay_days INT,               -- Keterlambatan produksi (dalam hari)
    battery_type TEXT,                       -- Jenis baterai
    drive_type TEXT,                         -- Jenis penggerak
    color TEXT,                              -- Warna kendaraan
    range_km INT,                            -- Jarak tempuh kendaraan (KM)
    charging_time_min INT,                   -- Waktu pengisian daya (menit)
    efficiency_kwh_per_100km FLOAT,          -- Efisiensi energi (kWh/100 km)
    co2_saved_tons FLOAT,                    -- CO2 yang diselamatkan (Tons)
    customer_rating FLOAT,                   -- Rating pelanggan (skala 1-5)
    warranty_years INT,                      -- Durasi garansi (tahun)
    number_of_recalls INT,                   -- Jumlah panggilan kembali
    software_version TEXT,                   -- Versi perangkat lunak
    autopilot_enabled BOOLEAN,               -- Status autopilot
    total_miles_driven FLOAT,                -- Total jarak yang telah ditempuh
    update_frequency_per_year INT,           -- Frekuensi pembaruan perangkat lunak
    battery_replacement_rate FLOAT,          -- Tingkat penggantian baterai
    service_visits_per_year INT              -- Jumlah kunjungan servis per tahun
);
