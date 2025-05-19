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
📎 [Link Kaggle](https://www.kaggle.com/datasets/khushikyad001/tesla-vehicle-deliveries-dataset-20122024/data)

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

> Misi 2 akan membahas desain konseptual dan star schema lebih detail.

---

