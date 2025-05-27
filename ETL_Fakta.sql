INSERT INTO Fakta_Pengiriman_Kendaraan (model_id, wilayah_id, waktu_id, performa_id, pelanggan_id, units_delivered, production_delay_days, average_price, service_visits)
SELECT m.model_id, w.wilayah_id, t.waktu_id, p.performa_id, c.pelanggan_id, s.`Units Delivered`, s.`Production Delay (Days)`, s.`Average Price (USD)`, s.`Service Visits (Per Year)`
FROM staging s
JOIN Dim_Model m ON s.model = m.model
JOIN Dim_Wilayah w ON s.region = w.region
JOIN Dim_Waktu t ON s.year = t.year AND s.quarter = t.quarter
JOIN Dim_Performa p ON s.`Software Version` = p.software_version
JOIN Dim_Pelanggan c ON s.`Customer Rating` = c.customer_rating;
