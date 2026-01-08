{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(PassengerID)), '')]) AS hub_passenger_details_hashkey,

  FirstName, LastName, DOB, Email, CreatedDateTime, LastupdateDateTime,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'SpiceJet_passenger_detail') }}