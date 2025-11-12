-- create_tables.sql
-- Create database and tables for the Salon Appointment Scheduler project

-- Create the database
CREATE DATABASE salon;

-- Connect to salon
\c salon

-- Drop tables if they exist (safe to re-run)
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS services;

-- Services table
CREATE TABLE services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- Customers table
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(25) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL
);

-- Appointments table
CREATE TABLE appointments (
  appointment_id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(customer_id),
  service_id INT NOT NULL REFERENCES services(service_id),
  time VARCHAR(255) NOT NULL
);

-- Insert at least three services (first inserted will have service_id = 1)
INSERT INTO services(name) VALUES
  ('cut'),
  ('blow-dry'),
  ('color');
