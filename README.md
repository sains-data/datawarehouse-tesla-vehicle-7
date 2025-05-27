# 📦 Tesla Data Warehouse Project

Proyek ini merupakan implementasi sistem **Data Warehouse untuk industri manufaktur otomotif**, khususnya untuk **Tesla Inc.**, dengan tujuan menganalisis dan mengintegrasikan data terkait produksi, distribusi, performa teknis kendaraan, serta kepuasan pelanggan.

---

## 📌 Ringkasan Proyek

| Elemen              | Deskripsi Singkat |
|---------------------|------------------|
| 📊 Nama Proyek      | Data Warehouse Tesla - Pengiriman Kendaraan |
| 🏫 Institusi        | Institut Teknologi Sumatera - Prodi Sains Data |
| 👥 Tim               |
| Elia Meylani Simanjuntak 	(122450026) |
| Chalifia Wananda	 	(122450076) |
| Sahid Maulana 			(122450109) |
| Muhammad Rafif Vivaldi 	(122140026) |
| 📁 Dataset          | [Tesla Vehicle Deliveries Dataset (2012–2024)](https://www.kaggle.com/datasets/khushikyad001/tesla-vehicle-deliveries-dataset-20122024/data) |
| 📌 Tools            | PostgreSQL / MySQL, Python (pandas), Airflow (ETL) |

---

## 🔍 1. Latar Belakang

Tesla memiliki data kompleks dari berbagai lini produksi, software, layanan pelanggan, hingga pengiriman global. Maka dari itu, dibutuhkan sistem **Data Warehouse** untuk:
- Mengintegrasikan data lintas fungsi.
- Menganalisis produksi, distribusi, dan kepuasan pelanggan secara historis.
- Mendukung pengambilan keputusan strategis berbasis data.

---

## 🎯 2. Tujuan Sistem

- **Meningkatkan efisiensi produksi** dengan analisis *production delay*.
- **Mengoptimalkan distribusi kendaraan** berdasarkan wilayah dan permintaan.
- **Memprediksi kebutuhan servis** dan penggantian baterai.
- **Evaluasi performa produk dan software**.
- **Meningkatkan kepuasan pelanggan** dan nilai jual kembali kendaraan.

---

## 🛠 3. Tools & Teknologi

- **Python (pandas, psycopg2)** – Ekstraksi dan transformasi data.
- **PostgreSQL / SQL Server** – Penyimpanan Data Warehouse.
- **Airflow / Cronjob** – Otomasi workflow ETL.
- **Three-Tier Architecture** – Struktur sistem (Staging → Warehouse → Analysis).

---

## 🗂 4. Struktur Skema

### 🟦 Star Schema

- **Tabel Fakta**:
  - `Fakta_Pengiriman_Kendaraan` – menyimpan metrik seperti units delivered, production delay, harga rata-rata, dll.

- **Tabel Dimensi**:
  - `Dim_Waktu`: Tahun & kuartal.
  - `Dim_Model`: Jenis kendaraan, baterai, warna, drive type.
  - `Dim_Wilayah`: Wilayah pengiriman.
  - `Dim_Performa`: Software version, efisiensi, charging time.
  - `Dim_Pelanggan`: Garansi, update frequency, rating.

---

## ⚙️ 5. Implementasi ETL

### ✅ ETL Dimensi:
```sql
INSERT INTO Dim_Model (...) SELECT DISTINCT ... FROM Staging;
```

### ✅ ETL Fakta:
```sql
INSERT INTO Fakta_Pengiriman_Kendaraan (...)
SELECT ... FROM Staging
JOIN Dim_Model ... JOIN Dim_Waktu ...
```

### 💾 Staging Layer:
- Data mentah di-load ke `Staging_Pengiriman_Kendaraan`.
- Dilakukan transformasi & cleaning sebelum dimuat ke warehouse.

---

## 📈 6. Hasil Analitik

1. **Total Penjualan per Kuartal** – Q2 2022 jadi kuartal terbaik.
2. **Rata-Rata Transaksi per Pelanggan** – Pelanggan ID 4 memiliki nilai transaksi tertinggi.
3. **Produk Terlaris per Wilayah** – Model D laris di wilayah West.
4. **Pertumbuhan Penjualan Tahun ke Tahun** – Lonjakan pada 2021, penurunan di 2022.

---

## 🔍 7. Evaluasi Sistem

**Masalah Ditemukan:**
- Join lambat karena indeks belum optimal.
- Volume data besar → performa turun.
- Kurangnya teknologi big data (masih RDBMS biasa).

---

## 🔧 8. Rencana Pengembangan

- Optimisasi skema (star/snowflake).
- Implementasi **indexing & partitioning**.
- Tambahkan **materialized views** dan **OLAP cube**.
- Gunakan platform **big data** seperti Apache Spark bila skala bertambah.

---

## 👥 9. Tim Proyek

| Nama                     | Peran |
|--------------------------|-------|
| Muhammad Rafif Vivaldi   | Ketua Proyek |
| Elia Meylani Simanjuntak | Desain Konseptual |
| Sahid Maulana            | SQL & ETL |
| Chalifia Wananda         | Visualisasi & Dokumentasi |

---

## 📎 Referensi Dataset

- [Kaggle - Tesla Vehicle Deliveries Dataset](https://www.kaggle.com/datasets/khushikyad001/tesla-vehicle-deliveries-dataset-20122024)

> 🚀 *Dokumentasi ini ditujukan untuk memberikan gambaran lengkap mengenai proyek perancangan Data Warehouse pada sektor manufaktur otomotif modern berbasis data Tesla.*