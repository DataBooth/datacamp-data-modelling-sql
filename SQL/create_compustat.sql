CREATE OR REPLACE TABLE snow.compustat (
    cusip_id VARCHAR,
    cusip_name VARCHAR,
    cusip_historical_id VARCHAR,
    cusip_historical_name VARCHAR,
    PRIMARY KEY (cusip_id)
);

INSERT INTO snow.compustat (
    cusip_id, cusip_name, cusip_historical_id, cusip_historical_name
) WITH cid AS (
    SELECT DISTINCT
        cusipheaderid AS cusip_id,
        cusipheadername AS cusip_name,
        cusiphistoryid AS cusip_historical_id,
        cusiphistoryname AS cusip_historical_name
    FROM raw_companies
)

SELECT
    MD5(
        COALESCE(
            cusip_id
            || cusip_name
            || cusip_historical_id
            || cusip_historical_name,
            '-1'
        )
    ) AS cusip_id,
    cusip_name,
    cusip_historical_id,
    cusip_historical_namefrom AS cid;
