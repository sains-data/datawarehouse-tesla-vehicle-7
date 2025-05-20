# 📘 Misi 1 – Dokumentasi Spesifikasi Data Warehouse Tesla

## 🏭 Latar Belakang

Industri manufaktur, khususnya manufaktur otomotif modern seperti **Tesla**, bergantung pada **data** untuk mendukung otomatisasi, efisiensi produksi, layanan pelanggan, dan pengambilan keputusan strategis. Tesla mengelola data dalam jumlah besar yang mencakup:

- Produksi dan pengiriman kendaraan,
- Performa kendaraan,
- Kepuasan pelanggan,
- Layanan purna jual.

Karena itu, dibutuhkan sistem **Data Warehouse** untuk menyimpan dan mengintegrasikan data dari berbagai proses bisnis agar dapat dianalisis secara multidimensi.

---

## 🎯 Tujuan Sistem

Sistem ini dirancang untuk mendukung:

- ⚙️ Efisiensi produksi dan distribusi kendaraan.
- 😊 Analisis kepuasan dan pengalaman pelanggan.
- 🔋 Prediksi kebutuhan layanan purna jual (servis & baterai).
- 🧠 Insight strategis untuk pengembangan produk dan software.
- 🌍 Pemahaman performa kendaraan per wilayah dan waktu.

---

## 👥 Daftar Stakeholder & Kebutuhannya

| Departemen                   | Kebutuhan Informasi                                         |
|-----------------------------|--------------------------------------------------------------|
| Produksi                    | Monitoring keterlambatan produksi per model dan waktu       |
| Distribusi & Logistik       | Jumlah pengiriman per wilayah dan kuartal                   |
| Customer Service            | Model dengan angka servis dan penggantian baterai tertinggi |
| Tim Pengembangan Produk     | Relasi antara software, recall, dan rating pelanggan        |
| Manajemen Regional Penjualan| Tren efisiensi dan performa per wilayah                     |
| Eksekutif Strategis / CEO   | Gambaran performa bisnis secara keseluruhan                 |

---

## 📊 Fakta dan Dimensi

### 🧱 Tabel Fakta: `fakta_pengiriman`

| Kolom                    | Deskripsi |
|--------------------------|-----------|
| Units Delivered          | Jumlah kendaraan yang dikirim per wilayah/kuartal |
| Production Delay (Days)  | Keterlambatan produksi |
| Average Price (USD)      | Harga rata-rata kendaraan |
| Service Visits           | Frekuensi kunjungan servis |
| Battery Replacement Rate | Persentase penggantian baterai |
| Total Miles Driven       | Jarak tempuh kendaraan |
| Number of Recalls        | Jumlah produk recall |
| CO2 Saved (Tons)         | Emisi yang dihemat |
| Resale Value (%)         | Persentase nilai jual kembali |
| Avg Customer Rating      | Rata-rata rating pelanggan |

---

### 🧾 Tabel Dimensi

| Dimensi       | Kolom                                | Deskripsi |
|---------------|---------------------------------------|-----------|
| `dim_waktu`   | Year, Quarter                         | Periode pengiriman |
| `dim_model`   | Model, Battery Type, Drive Type, Color| Detail model kendaraan |
| `dim_wilayah` | Region                                | Wilayah distribusi |
| `dim_performa`| Range, Efficiency, Charging Time, Autopilot Enabled, Software Version | Atribut performa kendaraan |
| `dim_pelanggan`| Warranty, Update Frequency, Customer Rating | Atribut purna jual & pelanggan |

---

## 🗂️ Struktur Star Schema

Model ini menggunakan **Star Schema** di mana satu tabel fakta terhubung ke beberapa tabel dimensi melalui relasi one-to-many. Skema ini mendukung analitik OLAP seperti:

- Drill-down
- Roll-up
- Slice and Dice

---

## 📁 Sumber Data

Dataset: **Tesla Vehicle Deliveries Dataset (2012–2024)**  
📎 [Link Drive](https://drive.google.com/file/d/1V_R6I0yWk8YIgb1EY-hFQNyfzIiycwKZ/view?usp=drive_link)

### 📌 Contoh Metadata Kolom:

| Nama Kolom             | Tipe Data | Deskripsi |
|------------------------|-----------|-----------|
| Year                   | Integer   | Tahun pengiriman |
| Quarter                | String    | Kuartal (Q1, Q2, Q3, Q4) |
| Region                 | String    | Wilayah geografis |
| Model                  | String    | Jenis kendaraan Tesla |
| Units Delivered        | Integer   | Jumlah kendaraan dikirim |
| Production Delay       | Integer   | Hari keterlambatan produksi |
| Average Price (USD)    | Float     | Harga rata-rata |
| Battery Type           | String    | Jenis baterai |
| Autopilot Enabled      | Boolean   | Status autopilot |
| Avg Customer Rating    | Float     | Rating pelanggan |

---

## ✅ Ringkasan

Dokumen ini menjelaskan fondasi dari sistem Data Warehouse untuk Tesla:
- Masalah bisnis dan solusinya melalui data
- Stakeholder dan kebutuhannya
- Struktur fakta dan dimensi
- Kesesuaian dengan dataset yang digunakan

# 📘 Misi 2 – Dokumentasi Desain Konseptual Data Warehouse Tesla

## 📌 Ringkasan Misi

Dokumen ini menjelaskan **perancangan konseptual** dari Data Warehouse Tesla, yang bertujuan mengintegrasikan data lintas fungsi bisnis seperti produksi, distribusi, layanan pelanggan, dan inovasi produk. Sistem ini disiapkan agar mampu menjawab pertanyaan analitik dari berbagai sudut pandang, seperti waktu, wilayah, model kendaraan, hingga segmentasi pelanggan.

---

## 🌟 Skema Konseptual: Star Schema

Kami menggunakan pendekatan **Star Schema** yang terdiri dari:
- 1 tabel fakta utama
- 5 tabel dimensi
- Hubungan one-to-many antar tabel

### 🔎 Alasan Pemilihan Star Schema:
- ✅ Sederhana & mudah dipahami
- ✅ Cocok untuk analisis OLAP (drill-down, slice, roll-up)
- ✅ Mendukung hierarki dalam dimensi
- ✅ Performa cepat untuk query agregat
- ✅ Fleksibel untuk ekspansi di masa depan

---

## 🧱 Tabel Fakta: `fakta_pengiriman_kendaraan`

Menyimpan data numerik hasil proses bisnis Tesla.

| Kolom                    | Fungsi dan Kegunaan |
|--------------------------|---------------------|
| `units_delivered`        | Metrik volume output distribusi kendaraan |
| `production_delay_days`  | Indikator efisiensi produksi |
| `average_price_usd`      | Strategi harga berdasarkan model/wilayah/waktu |
| `service_visits`         | Keandalan kendaraan |
| `battery_replacement_rate` | Kualitas dan daya tahan baterai |
| `total_miles_driven`     | Performa dan ketahanan kendaraan |
| `number_of_recalls`      | Cacat produksi dan keamanan |
| `co2_saved_tons`         | Dampak positif terhadap lingkungan |
| `resale_value_percent`   | Nilai jual kembali kendaraan |
| `avg_customer_rating`    | Tingkat kepuasan pelanggan |

---

## 🧾 Tabel Dimensi

### 1. `dim_waktu`

| Kolom     | Deskripsi |
|-----------|-----------|
| `date`    | Tanggal pengiriman |
| `month`   | Bulan |
| `quarter` | Kuartal |
| `year`    | Tahun |

**Hierarki**: `Date → Quarter → Year`

---

### 2. `dim_model`

| Kolom         | Deskripsi |
|---------------|-----------|
| `model`       | Jenis kendaraan Tesla |
| `battery_type`| Tipe baterai (Standard, Long Range, Performance) |
| `drive_type`  | Jenis penggerak (RWD, AWD) |
| `color`       | Warna kendaraan |

**Hierarki**: `Model → Battery Type → Drive Type → Color`

---

### 3. `dim_wilayah`

| Kolom    | Deskripsi |
|----------|-----------|
| `city`   | Kota pengiriman |
| `region` | Wilayah (misal: Asia, Eropa) |
| `country`| Negara pengiriman |

**Hierarki**: `City → Region → Country`

---

### 4. `dim_performa`

| Kolom              | Deskripsi |
|--------------------|-----------|
| `software_version` | Versi perangkat lunak |
| `efficiency`       | Efisiensi energi (kWh/100km) |
| `charging_time`    | Waktu pengisian daya (menit) |
| `autopilot_enabled`| Status autopilot (True/False) |

**Hierarki**: `Software Version → Efficiency → Autopilot Enabled`

---

### 5. `dim_pelanggan`

| Kolom             | Deskripsi |
|-------------------|-----------|
| `warranty_period` | Lama garansi (tahun) |
| `update_frequency`| Frekuensi pembaruan software |
| `customer_rating` | Rating pelanggan terhadap kendaraan |

**Hierarki**: `Warranty → Update Frequency → Customer Rating`

---

## ✅ Justifikasi Desain

Desain konseptual ini memenuhi kebutuhan Tesla karena:
- Menghubungkan metrik bisnis penting ke dimensi operasional
- Memungkinkan pelaporan kuartalan, wilayah, dan produk
- Memudahkan integrasi data dari berbagai divisi
- Mendukung sistem BI (Power BI, Tableau, dll)

---

## 🔗 Kesesuaian dengan Dataset

Dataset yang digunakan:  
**Tesla Vehicle Deliveries Dataset (2012–2024)** dari Kaggle

📌 Kesesuaian:
- Dataset memiliki semua atribut yang dibutuhkan untuk tabel fakta dan dimensi
- Struktur tabular sangat cocok untuk dimodelkan dalam star schema
- Data bersih dan terstruktur (kuartal, model, wilayah, rating, dan lainnya)

---

# 📘 Misi 3 – Desain Logikal, Fisikal, dan ETL Pipeline untuk Data Warehouse Tesla

## 🔧 Desain Logikal & Fisikal

Misi ini melanjutkan tahapan pembangunan data warehouse Tesla dengan fokus pada:

- Desain tabel logikal (SQL-ready)
- Optimisasi performa melalui indeks & partisi
- Strategi penyimpanan data (filegroup, kompresi)
- Implementasi ETL pipeline (Extract, Transform, Load)

---

## 🗃️ Struktur Tabel Logikal

Tabel dimensi dan fakta dirancang menggunakan SQL untuk mendukung integrasi data dan analisis multidimensi.

### 📦 Tabel Fakta: `Fakta_Pengiriman_Kendaraan`

```sql
CREATE TABLE Fakta_Pengiriman_Kendaraan (
    delivery_id SERIAL PRIMARY KEY,
    model_id INT REFERENCES Dim_Model(model_id),
    wilayah_id INT REFERENCES Dim_Wilayah(wilayah_id),
    waktu_id INT REFERENCES Dim_Waktu(waktu_id),
    performa_id INT REFERENCES Dim_Performa(performa_id),
    pelanggan_id INT REFERENCES Dim_Pelanggan(pelanggan_id),
    units_delivered INT,
    production_delay_days INT,
    average_price NUMERIC,
    service_visits INT,
    battery_replacement_rate FLOAT,
    total_miles_driven INT,
    number_of_recalls INT,
    CO2_saved FLOAT,
    resale_value FLOAT,
    avg_customer_rating FLOAT,
    delivery_date DATE
);
```

## ⚡ Optimisasi Performa: Indeks & Partisi

### ✅ Clustered Index

```sql
CREATE CLUSTERED INDEX idx_delivery_date
ON Fakta_Pengiriman_Kendaraan (delivery_date);
```
### ✅ Non-Clustered Index

```sql
CREATE INDEX idx_model_id ON Fakta_Pengiriman_Kendaraan (model_id);
CREATE INDEX idx_customer_id ON Fakta_Pengiriman_Kendaraan (pelanggan_id);
```
### ✅ Composite Index

```sql
CREATE INDEX idx_model_region 
ON Fakta_Pengiriman_Kendaraan (model_id, wilayah_id);
```

## 🗂️ Partisi Berdasarkan Tahun

### Fungsi & Skema Partisi

```sql
CREATE PARTITION FUNCTION pf_DeliveryYear (INT)
AS RANGE LEFT FOR VALUES (2018, 2020, 2022, 2024);

CREATE PARTITION SCHEME ps_DeliveryYear
AS PARTITION pf_DeliveryYear ALL TO ([DW_Fakta]);
```
### Penerapan Partisi pada Tabel Fakta

```sql
CREATE CLUSTERED INDEX idx_delivery_date
ON Fakta_Pengiriman_Kendaraan (delivery_date)
ON ps_DeliveryYear (delivery_year);
```
## 💾 Strategi Penyimpanan

### 📁 Filegroup & Kompresi

- Tabel fakta ditempatkan dalam filegroup khusus DW_Fakta
- Tabel dimensi berada di filegroup PRIMARY
- Tabel fakta dikompresi menggunakan PAGE compression

```sql
ALTER TABLE Fakta_Pengiriman_Kendaraan
REBUILD PARTITION = ALL
WITH (DATA_COMPRESSION = PAGE);
```

## 🔄 ETL Pipeline (Extract, Transform, Load)

### 📌 Arsitektur ETL
- Extract – Mengambil data dari file CSV eksternal ke staging
- Transform – Membersihkan dan memetakan data ke dimensi
- Load – Memasukkan data akhir ke tabel fakta

### 📥 Extract

```sql
COPY Staging_Tesla_Deliveries 
FROM '/data/tesla_vehicle_deliveries.csv' 
DELIMITER ',' CSV HEADER;
```

### 🧹 Transform (Contoh Dimensi Model)

```sql
INSERT INTO Dim_Model (model, battery_type, drive_type, color)
SELECT DISTINCT Model, "Battery Type", "Drive Type", Color
FROM Staging_Tesla_Deliveries
WHERE Model IS NOT NULL;
```

### 📤 Load ke Tabel Fakta

```sql
INSERT INTO Fakta_Pengiriman_Kendaraan (
    model_id, wilayah_id, waktu_id, performa_id, pelanggan_id,
    units_delivered, production_delay_days, average_price,
    service_visits, battery_replacement_rate, total_miles_driven,
    number_of_recalls, CO2_saved, resale_value, avg_customer_rating
)
SELECT 
    m.model_id, r.wilayah_id, w.waktu_id, p.performa_id, c.pelanggan_id,
    s."Units Delivered", s."Production Delay (Days)", s."Average Price (USD)",
    s."Service Visits (Per Year)", s."Battery Replacement Rate", s."Total Miles Driven",
    s."Number of Recalls", s."CO2 Saved (Tons)", s."Resale Value (%)", s."Avg Customer Rating"
FROM Staging_Tesla_Deliveries s
JOIN Dim_Model m ON s.Model = m.model
JOIN Dim_Wilayah r ON s.Region = r.region
JOIN Dim_Waktu w ON s.Year = w.year 
    AND CASE s.Quarter 
        WHEN 'Q1' THEN 1 
        WHEN 'Q2' THEN 2 
        WHEN 'Q3' THEN 3 
        WHEN 'Q4' THEN 4 
    END = w.quarter
JOIN Dim_Performa p ON s."Software Version" = p.software_version
JOIN Dim_Pelanggan c ON s."Avg Customer Rating" = c.customer_rating;
```

## 📊 View dan Data Mart

### 📈 Indexed View: Rata-Rata Rating per Model

```sql 
CREATE VIEW vw_AvgRatingPerModel
WITH SCHEMABINDING AS
SELECT 
    m.model,
    AVG(f.avg_customer_rating) AS avg_rating
FROM dbo.Fakta_Pengiriman_Kendaraan f
JOIN dbo.Dim_Model m ON f.model_id = m.model_id
GROUP BY m.model;

CREATE UNIQUE CLUSTERED INDEX idx_rating_model
ON vw_AvgRatingPerModel (model);
```

### 📊 Data Mart: Kepuasan Pelanggan

```sql
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

```

## ✅ Ringkasan Misi 3

- Telah dirancang dan diimplementasikan struktur tabel fakta dan dimensi
- Indeks, partisi, dan kompresi diterapkan untuk efisiensi kueri
- ETL pipeline siap digunakan untuk pemrosesan data besar
- Sistem mendukung analitik berbasis waktu, model, dan wilayah
- Dapat langsung diintegrasikan dengan tools BI seperti Power BI, Tableau, atau Metabase