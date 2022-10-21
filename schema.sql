/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals ( id INTEGER PRIMARY KEY, name VARCHAR(60), date_of_birth DATE, escape_attempts INT,neutered BOOLEAN, weight_kg FLOAT(2));