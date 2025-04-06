INSERT INTO Cars (VIN, Manufacturer, Model, Year, Color) VALUES
('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
-- ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

-- There is a duplicate VIN in seed data, I will remove. 

INSERT INTO Customers (CustomerID, Name, PhoneNumber, Email, Address, City, StateProvince, Country, ZipPostalCode) VALUES
-- (10001, 'Pablo Picasso', '+34 636 17 63 82', NULL, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
-- (20001, 'Abraham Lincoln', '+1 305 907 7086', NULL, '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
-- (30001, 'Napoléon Bonaparte', '+33 1 79 75 40 00', NULL, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');
(10001, 'Pablo Picasso', '1-787-425-5309', NULL, 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
(20001, 'Abraham Lincoln', '1-787-852-5309', NULL, '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
(30001, 'Napoléon Bonaparte', '1-787-867-5309', NULL, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

SELECT * FROM Customers WHERE CustomerID = 30001;

UPDATE Customers
SET PhoneNumber = '1-787-867-5309'
WHERE CustomerID = 30001;

-- put NULL for Email where the value is missing. I changed the phne numbers bc it was giving error.

SELECT * FROM Customers;
SHOW VARIABLES LIKE 'sql_mode';



INSERT INTO Salespersons (StaffID, Name, Store) VALUES
('00001', 'Petey Cruiser', 'Madrid'),
('00002', 'Anna Sthesia', 'Barcelona'),
('00003', 'Paul Molive', 'Berlin'),
('00004', 'Gail Forcewind', 'Paris'),
('00005', 'Paige Turner', 'Mimia'),
('00006', 'Bob Frapples', 'Mexico City'),
('00007', 'Walter Melon', 'Amsterdam'),
('00008', 'Shonda Leer', 'São Paulo');

INSERT INTO Invoices (InvoiceNumber, Date, CarVIN, CustomerID, StaffID) VALUES
(852399038, '2018-08-22', '3K096I98581DHSNUP', 20001, '00004'),
(731166526, '2018-12-31', 'HKNDGS7CU31E9Z7JW', 10001, '00006'),
(271135104, '2019-01-22', 'RKXVNNIHLVVZOUB4M', 30001, '00008');

-- Invoices table, the CarVIN, CustomerID, and StaffID must match the corresponding foreign keys in Cars, Customers, and Salespersons
