{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(Airport_Code)), '')]) AS hub_airport_details_hashkey,

  Airport_Name,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'Airindia_airport_details') }}
