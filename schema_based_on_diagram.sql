/* Database schema to keep the structure of entire database. */


CREATE TABLE patients (
    id                  INT GENERATED ALWAYS IDENTITY,
    name                varchar(100),
    date_of_birth       DATE
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id                  INT GENERATED ALWAYS IDENTITY,
    admitted_at         timestamp,
    patient_id          INT,
    status              varchar
    PRIMARY KEY (id),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Create an intermediate table for medical_histores and treatments called diagnosis

CREATE TABLE diagnosis (
    id                  INT,    
    medical_history_id  INT,
    treatment_id        INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histores(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

CREATE TABLE treatments (
    id                  INT GENERATED ALWAYS IDENTITY,
    type                timestamp,
    name                varchar,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id                  INT GENERATED ALWAYS IDENTITY,
    total_amount        DECIMAL,
    generated_at        timestamp,
    payed_at            timestamp,
    medical_history_id  INT
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id                  INT GENERATED ALWAYS IDENTITY,
    unit_price          DECIMAL,
    quantity            INT,
    total_price         DECIMAL,
    invoice_id          INT,
    treatment_id        INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);
