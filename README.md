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


