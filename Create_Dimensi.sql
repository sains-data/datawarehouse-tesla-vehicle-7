CREATE TABLE Dim_Waktu (
    waktu_id INT AUTO_INCREMENT PRIMARY KEY,  -- Menambahkan AUTO_INCREMENT
    year INT,                     
    quarter TEXT
);

CREATE TABLE Dim_Model (
    model_id INT AUTO_INCREMENT PRIMARY KEY,  -- Menambahkan AUTO_INCREMENT pada model_id
    model TEXT,
    battery_type TEXT,
    drive_type TEXT,
    color TEXT
);


CREATE TABLE Dim_Wilayah (
    wilayah_id INT AUTO_INCREMENT PRIMARY KEY,  -- Menambahkan AUTO_INCREMENT pada wilayah_id
    region TEXT,
    country TEXT
);



CREATE TABLE Dim_Performa (
    performa_id INT AUTO_INCREMENT PRIMARY KEY,   -- Menambahkan AUTO_INCREMENT pada performa_id
    software_version TEXT,
    efficiency FLOAT,
    charging_time INT,
    autopilot_enabled BOOLEAN
);


CREATE TABLE Dim_Pelanggan (
    pelanggan_id INT AUTO_INCREMENT PRIMARY KEY,  -- Menambahkan AUTO_INCREMENT pada pelanggan_id
    warranty_period INT,
    update_frequency INT,
    customer_rating FLOAT
);

