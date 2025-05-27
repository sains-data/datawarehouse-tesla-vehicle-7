CREATE TABLE Staging_Pengiriman_Kendaraan (
    raw_id SERIAL PRIMARY KEY,      -- ID unik untuk data mentah
    model TEXT,                     -- Nama model kendaraan
    battery_type TEXT,              -- Jenis baterai
    city TEXT,                      -- Kota distribusi
    delivery_date DATE,             -- Tanggal pengiriman
    units_delivered INT,            -- Jumlah kendaraan yang dikirim
    customer_rating FLOAT,          -- Rating pelanggan
    production_delay_days INT,      -- Keterlambatan produksi dalam hari
    average_price NUMERIC,          -- Harga rata-rata per kendaraan
    service_visits INT              -- Jumlah kunjungan servis kendaraan
);
