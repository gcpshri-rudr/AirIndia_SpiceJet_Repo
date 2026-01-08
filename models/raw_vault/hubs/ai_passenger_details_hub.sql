{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(PassengerID)), '')]) AS hub_passenger_details_hashkey,

  PassengerID,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'AirIndia_Passenger_Details') }}