/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE round(weight_kg::numeric, 2) >= 10.23 AND round(weight_kg::numeric, 2) <= 17.3;

BEGIN;
update animals set species = 'unspecified';
SELECT * from animals;
rollback;
SELECT * from animals;
-- 
BEGIN;
update animals set species = 'digmon' where name like '%mon';
update animals set species = 'pokemon' where species is NULL;
commit;
SELECT * from animals;
-- 
BEGIN;
delete from animals;
SELECT * from animals;
rollback;
SELECT * from animals;

BEGIN;
delete from animals where date_of_birth > 'JAN 01, 2022';
SAVEPOINT s1;
update animals set weight_kg = -1 * weight_kg;
rollback to s1;
update animals set weight_kg = -1 * weight_kg where weight_kg < 0;
commit;
SELECT * from animals;

-- spicies questions 
select COUNT(*) from animals;
select COUNT(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, count(*) from animals group by neutered;
select min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between 'JAN 01, 1990' and 'DEC 31, 2000' group by species;