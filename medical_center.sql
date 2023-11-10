DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    specialty VARCHAR(20) NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,
    birth_date DATE NOT NULL,
    insurance VARCHAR(20)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    doctor_id INTEGER REFERENCES doctors NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL

);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease_name TEXT UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits NOT NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL,
    notes TEXT 
);

INSERT INTO doctors (doctor_name, specialty)
VALUES
('Adam Smith', 'Neurology'),
('Jessica Ramirez', 'Internal Medicine'),
('Lily James', 'Cardiolody');

INSERT INTO patients (patient_name, birth_date, insurance)
VALUES
('Lizzy Mcguire', '1940-10-11', NULL),
('Elizabeth Jones', '1996-05-09', 'Anthem BlueCross'),
('Victoria Brown', '1986-04-09', 'Kaiser');

INSERT INTO visits (visit_date, doctor_id, patient_id)
VALUES 
('2023-10-20', 1, 1),
('2023-10-22', 3, 1),
('2023-10-25', 2, 2),
('2023-10-26', 1, 2),
('2023-10-26', 2, 3),
('2023-10-27', 3, 3);

INSERT INTO diseases (disease_name, description)
VALUES
('Alzeimer''s', NULL),
('Dementia', NULL),
('Mental Disorders', 'Schizophrenia'),
('Acute Bronchitis', NULL),
('Vertigo', NULL),
('arrythmia', NULL),
('Coronary Artery Disease', NULL);

INSERT INTO diagnoses (visit_id, disease_id, notes)
VALUES
(1,1, 'old age + family history'),
(2, NULL, 'no cardiac issues'),
(3, 5, 'due to migranes'),
(4, NULL,  'no neurological concerns'),
(5, NULL, NULL),
(6, 6, NULL);
