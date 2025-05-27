-- Membuat Non-Clustered Index pada kolom delivery_date di tabel Fakta_Pengiriman_Kendaraan
CREATE INDEX idx_delivery_date
ON Fakta_Pengiriman_Kendaraan (delivery_date);

-- Membuat Non-Clustered Index pada kolom model_id di tabel Fakta_Pengiriman_Kendaraan
CREATE INDEX idx_model_id
ON Fakta_Pengiriman_Kendaraan (model_id);

-- Membuat Non-Clustered Index pada kolom wilayah_id di tabel Fakta_Pengiriman_Kendaraan
CREATE INDEX idx_region_id
ON Fakta_Pengiriman_Kendaraan (wilayah_id);

-- Membuat Non-Clustered Index pada kolom pelanggan_id di tabel Fakta_Pengiriman_Kendaraan
CREATE INDEX idx_customer_id
ON Fakta_Pengiriman_Kendaraan (pelanggan_id);

-- Membuat Composite Index pada kolom model_id dan wilayah_id
CREATE INDEX idx_model_region
ON Fakta_Pengiriman_Kendaraan (model_id, wilayah_id);
