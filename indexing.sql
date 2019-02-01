-- SETUP
CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars
  WITH OWNER = indexed_cars_user;
\c indexed_cars;
\i 'scripts/car_models.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';
\i 'scripts/car_model_data.sql';

\timing
-- WITHOUT INDEX
SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM';

SELECT DISTINCT model_title
FROM car_models 
WHERE make_code = 'NISSAN'
  AND model_code = 'GT-R';

SELECT
make_code,
model_code,
model_title,
year
FROM car_models
WHERE make_code = 'LAM';

SELECT
*
FROM car_models
WHERE year >= 2010
  AND year < 2016;

SELECT
*
FROM car_models
WHERE year = 2010;

-- CREATE INDEX
CREATE INDEX car_make 
  ON car_models (make_code);

CREATE INDEX car_model
  ON car_models (model_code);

CREATE INDEX car_year
  ON car_models (year);


-- WITH INDEX
SELECT DISTINCT make_title
FROM car_models
WHERE make_code = 'LAM';

SELECT DISTINCT model_title
FROM car_models 
WHERE make_code = 'NISSAN'
  AND model_code = 'GT-R';

SELECT
make_code,
model_code,
model_title,
year
FROM car_models
WHERE make_code = 'LAM';

SELECT
*
FROM car_models
WHERE year >= 2010
  AND year < 2016;

SELECT
*
FROM car_models
WHERE year = 2010;

\timing
\c badmckinney;
DROP DATABASE indexed_cars;
DROP USER indexed_cars_user;
