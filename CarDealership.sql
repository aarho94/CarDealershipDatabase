-- Drop the database if it already exists
DROP DATABASE IF EXISTS car_dealership;

-- Create the database
CREATE DATABASE car_dealership;

-- Use the database
USE car_dealership;

-- Create the dealerships table
CREATE TABLE dealerships (
  dealership_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  phone VARCHAR(12) NOT NULL
);

-- Insert initial data into dealerships table
INSERT INTO dealerships (name, address, phone)
VALUES
  ('ABC Motors', '123 Main St', '555-1234'),
  ('XYZ Auto', '456 Elm St', '555-5678'),
  ('CarMax', '789 Oak St', '555-9012');

-- Create the makes table
CREATE TABLE makes (
  make_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Insert initial data into makes table
INSERT INTO makes (name)
VALUES
  ('Toyota'),
  ('Ford'),
  ('Chevrolet'),
  ('Honda'),
  ('Nissan');

-- Create the models table
CREATE TABLE models (
  model_id INT AUTO_INCREMENT PRIMARY KEY,
  make_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  FOREIGN KEY (make_id) REFERENCES makes (make_id)
);

-- Insert initial data into models table
INSERT INTO models (make_id, name)
VALUES
  (1, 'Camry'),
  (1, 'Corolla'),
  (2, 'F-150'),
  (2, 'Mustang'),
  (3, 'Silverado'),
  (3, 'Cruze'),
  (4, 'Civic'),
  (4, 'Accord'),
  (5, 'Altima'),
  (5, 'Sentra');

-- Create the vehicles table
CREATE TABLE vehicles (
  VIN VARCHAR(17) PRIMARY KEY,
  make_id INT NOT NULL,
  model_id INT NOT NULL,
  year INT NOT NULL,
  mileage INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  SOLD BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (make_id) REFERENCES makes (make_id),
  FOREIGN KEY (model_id) REFERENCES models (model_id)
);

-- Insert initial data into vehicles table
INSERT INTO vehicles (VIN, make_id, model_id, year, mileage, price)
VALUES
  ('1HGCM82633A004321', 1, 1, 2020, 5000, 25000.00),
  ('1HGCM82643A004322', 1, 2, 2019, 10000, 20000.00),
  ('1FTFW1ET3DKF12345', 2, 3, 2018, 20000, 18000.00),
  ('1FTFW1ET2DKF12346', 2, 4, 2017, 30000, 15000.00),
  ('1GCGK23C13F123456', 3, 5, 2016, 40000, 12000.00),
  ('1GCGK23C13F123457', 3, 6, 2015, 50000, 10000.00),
  ('1HGCM82653A004323', 4, 7, 2014, 60000, 9000.00),
  ('1HGCM82663A004324', 4, 8, 2013, 70000, 8000.00),
  ('1N4AL2AP3DC123456', 5, 9, 2012, 80000, 7000.00),
  ('1N4AL2AP2DC123457', 5, 10, 2011, 90000, 6000.00);

-- Create the inventory table
CREATE TABLE inventory (
  dealership_id INT NOT NULL,
  VIN VARCHAR(17) NOT NULL,
  PRIMARY KEY (dealership_id, VIN),
  FOREIGN KEY (dealership_id) REFERENCES dealerships (dealership_id),
  FOREIGN KEY (VIN) REFERENCES vehicles (VIN)
);

-- Insert initial data into inventory table
INSERT INTO inventory (dealership_id, VIN)
VALUES
  (1, '1HGCM82633A004321'),
  (1, '1HGCM82643A004322'),
  (2, '1FTFW1ET3DKF12345'),
  (2, '1FTFW1ET2DKF12346'),
  (3, '1GCGK23C13F123456'),
  (3, '1GCGK23C13F123457');