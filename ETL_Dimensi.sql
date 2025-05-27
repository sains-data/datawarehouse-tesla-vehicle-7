INSERT INTO Dim_Waktu (year, quarter)
SELECT DISTINCT year, quarter
FROM Staging;

INSERT INTO Dim_Model (model, battery_type, drive_type, color)
SELECT DISTINCT model, `Battery Type`, `Drive Type`, color
FROM Staging;

INSERT INTO Dim_Wilayah (region)
SELECT DISTINCT region
FROM Staging;

INSERT INTO Dim_Performa (software_version, efficiency, charging_time, autopilot_enabled)
SELECT DISTINCT `software version`, `Efficiency (kWh/100km)`, `Charging Time (Min)`, `Autopilot Enabled`
FROM Staging;

INSERT INTO Dim_Pelanggan (warranty_period, update_frequency, customer_rating)
SELECT DISTINCT `Warranty (Years)`, `Update Frequency (Per Year)`, `Customer Rating`
FROM Staging;
