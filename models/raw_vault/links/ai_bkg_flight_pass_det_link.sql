{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(BookingID)), ''), COALESCE(TRIM(LOWER(FlightID)), ''), COALESCE(TRIM(LOWER(PassengerID)), '')]) AS link_bkg_flight_pass_det_hashkey,

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(BookingID)), '')]) AS hub_bookingid_hashkey, dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(FlightID)), '')]) AS hub_flightid_hashkey, dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(PassengerID)), '')]) AS hub_passengerid_hashkey,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'AirIndia_Booking_Details') }}