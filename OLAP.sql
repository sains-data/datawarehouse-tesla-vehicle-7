-- Total Penjualan Per Bulan
SELECT t.year, t.quarter, SUM(s.`Units Delivered` * s.`Average Price (USD)`) AS total_sales
FROM Staging_Pengiriman_Kendaraan s
JOIN Dim_Waktu t ON s.year = t.year AND s.quarter = t.quarter
GROUP BY t.year, t.quarter
ORDER BY t.year, t.quarter;

-- Rata-Rata Transaksi Per Pelanggan
SELECT c.pelanggan_id, AVG(s.`Units Delivered` * s.`Average Price (USD)`) AS avg_transaction_per_customer
FROM Staging_Pengiriman_Kendaraan s
JOIN Dim_Pelanggan c ON s.`Customer Rating` = c.customer_rating
GROUP BY c.pelanggan_id
ORDER BY avg_transaction_per_customer DESC;

-- Produk Terlaris Berdasarkan Wilayah
SELECT w.region, s.model, SUM(s.`Units Delivered`) AS total_units_sold
FROM Staging_Pengiriman_Kendaraan s
JOIN Dim_Wilayah w ON s.region = w.region
GROUP BY w.region, s.model
ORDER BY total_units_sold DESC;

-- Produk Terlaris Berdasarkan Wilayah
SELECT w.region, s.model, SUM(s.`Units Delivered`) AS total_units_sold
FROM Staging_Pengiriman_Kendaraan s
JOIN Dim_Wilayah w ON s.region = w.region
GROUP BY w.region, s.model
ORDER BY total_units_sold DESC;
