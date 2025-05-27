CREATE TABLE Fakta_Pengiriman_Kendaraan (
    fakta_id INT AUTO_INCREMENT PRIMARY KEY,  -- ID unik untuk setiap entri fakta
    model_id INT,                             -- Foreign key dari Dim_Model
    wilayah_id INT,                           -- Foreign key dari Dim_Wilayah
    waktu_id INT,                             -- Foreign key dari Dim_Waktu
    performa_id INT,                          -- Foreign key dari Dim_Performa
    pelanggan_id INT,                         -- Foreign key dari Dim_Pelanggan
    units_delivered INT,                      -- Jumlah kendaraan yang dikirim
    production_delay_days INT,                -- Keterlambatan produksi (dalam hari)
    average_price NUMERIC,                    -- Harga rata-rata per kendaraan
    service_visits INT,                       -- Jumlah kunjungan servis per tahun
    FOREIGN KEY (model_id) REFERENCES Dim_Model(model_id),
    FOREIGN KEY (wilayah_id) REFERENCES Dim_Wilayah(wilayah_id),
    FOREIGN KEY (waktu_id) REFERENCES Dim_Waktu(waktu_id),
    FOREIGN KEY (performa_id) REFERENCES Dim_Performa(performa_id),
    FOREIGN KEY (pelanggan_id) REFERENCES Dim_Pelanggan(pelanggan_id)
);
