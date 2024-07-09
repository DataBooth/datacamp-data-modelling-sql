CREATE TABLE raw_companies AS
SELECT *
FROM
    read_csv_auto(
        '../data/Sorenson_Workstation_FIVE_Data Folder/ascii/SorensonworkfirmFIVEdata.csv'
    )
