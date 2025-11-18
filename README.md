# 📦 Order Management Data Warehouse Project

Project ini merupakan implementasi end-to-end Data Warehouse untuk sistem Order Management, mulai dari proses pembuatan data, ETL, pembuatan dimensional model, analisis clustering & forecasting, hingga pembuatan dashboard menggunakan Power BI.

Proyek ini menunjukkan alur lengkap bagaimana data mentah diproses menjadi insight bisnis yang siap digunakan.

---

## 🚀 Project Overview

Proyek ini menunjukkan seluruh alur kerja data:

1. **Data Generation**
    * Python (Jupyter Notebook) menghasilkan dataset barang, customer, faktur, faktur_detail, dan pengiriman.
2. **Data Warehouse Setup**
    * Pembuatan database dan tabel di PostgreSQL menggunakan file SQL.
3. **ETL Process**
    * Pembersihan, transformasi, dan pembuatan dimensional tables (dim customer, dim product, dim shipping, dim date) dan fact table (fact_sales).
    * Menggunakan file .ktr.
4. **Analytical Processing**
    * Pembuatan dua view:
        * tampilan_kinerja_penjualan_produk
        * tampilan_penjualan_harian
    * Dilanjutkan dengan klastering dan forecasting pada data hasil view.
5. **Business Intelligence Dashboard**
    * Power BI digunakan untuk menampilkan performa penjualan, segmentasi pelanggan, serta proyeksi penjualan ke depan.

## 🗂️ Folder Structure

```bash
order-management/
│
├── dashboard/
│   └── order_management.pbix
│
├── erd/
│   ├── etl_order.jpg
│   └── raaw_order.jpg
│
├── etl/
│   ├── dim_table.ktr
│   └── fact_table.ktr
│
├── notebooks/
│   ├── create.ipynb
│   ├── om_cluster.ipynb
│   └── om_forecast.ipynb
│
├── data/
│   ├── barang.csv
│   ├── customer.csv
│   ├── dim_customer.csv
│   ├── dim_date.csv
│   ├── dim_product.csv
│   ├── dim_shipping.csv
│   ├── fact_sales.csv
│   ├── faktur.csv
│   ├── faktur_detail.csv
│   └── pengiriman.csv
│
└── sql/
    └── create_sql.sql
```
## 🛠️ Technologies Used

**Data Engineering**
* Python (Pandas, Numpy)
* Pentaho Data Integration (Kettle)
* PostgreSQL

**Data Science**
* Scikit-Learn
* Prophet
* Jupyter Notebook

**Business Intelligence**
* Power BI