-- ************************************************************
-- File where the hospital table is created
-- ************************************************************

DROP TABLE IF EXISTS hospitals_base;

CREATE TABLE hospitals_base
STORED AS PARQUET
AS

SELECT
	providerid as hospitalid,
	hospitalname as hospitalname,
	state as state
FROM
	hospitals;

