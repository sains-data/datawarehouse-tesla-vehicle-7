CREATE TABLE DataMart_KepuasanPelanggan AS
SELECT
   f.delivery_date,
   m.model,
   r.region,
   f.avg_customer_rating,
   f.service_visits
FROM Fakta_Pengiriman_Kendaraan f
JOIN Dim_Model m ON f.model_id = m.model_id
JOIN Dim_Wilayah r ON f.wilayah_id = r.wilayah_id
WHERE f.avg_customer_rating IS NOT NULL;