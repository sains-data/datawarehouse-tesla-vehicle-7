-- Membuat tabel Fakta_Pengiriman_Kendaraan (Tabel Fakta Pengiriman Kendaraan)
CREATE TABLE Fakta_Pengiriman_Kendaraan (
    delivery_id SERIAL PRIMARY KEY,      -- ID unik untuk pengiriman kendaraan
    model_id INT REFERENCES Dim_Model(model_id), -- Foreign key ke Dim_Model
    wilayah_id INT REFERENCES Dim_Wilayah(wilayah_id), -- Foreign key ke Dim_Wilayah
    waktu_id INT REFERENCES Dim_Waktu(waktu_id), -- Foreign key ke Dim_Waktu
    performa_id INT REFERENCES Dim_Performa(performa_id), -- Foreign key ke Dim_Performa
    pelanggan_id INT REFERENCES Dim_Pelanggan(pelanggan_id), -- Foreign key ke Dim_Pelanggan
    units_delivered INT,                 -- Jumlah kendaraan yang dikirim
    production_delay_days INT,           -- Lama keterlambatan produksi (dalam hari)
    average_price NUMERIC,               -- Harga rata-rata kendaraan (USD)
    service_visits INT,                  -- Jumlah kunjungan servis kendaraan
    battery_replacement_rate FLOAT,      -- Rasio penggantian baterai
    total_miles_driven INT,              -- Total jarak tempuh kendaraan (dalam mil)
    number_of_recalls INT,               -- Jumlah recall produk
    CO2_saved FLOAT,                     -- Estimasi pengurangan emisi CO2 (ton)
    resale_value FLOAT,                  -- Nilai jual kembali kendaraan (%)
    avg_customer_rating FLOAT,           -- Rating pelanggan terhadap kendaraan (skala 1-5)
    delivery_date DATE                   -- Tanggal pengiriman kendaraan
);
