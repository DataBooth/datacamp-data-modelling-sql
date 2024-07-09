-- change column zip to type varchar
-- ensure leading 0's present in zip
-- convert lat/long variables to degrees from radians

ALTER TABLE raw_companies ALTER COLUMN zip SET DATA TYPE VARCHAR;
UPDATE raw_companies SET zip = RIGHT('000' || zip, 5);
UPDATE raw_companies SET lat = DEGREES(lat), lon = DEGREES(lon);
