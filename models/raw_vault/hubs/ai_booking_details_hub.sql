{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(BookingID)), '')]) AS hub_booking_details_hashkey,

  BookingID,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'AirIndia_Booking_Details') }}