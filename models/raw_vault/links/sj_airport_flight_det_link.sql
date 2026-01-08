{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(FlightID)), ''), COALESCE(TRIM(LOWER(OriginAirportCode)), ''), COALESCE(TRIM(LOWER(DestinationAirportCode)), '')]) AS link_airport_flight_det_hashkey,

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(FlightID)), '')]) AS hub_flightid_hashkey, dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(OriginAirportCode)), '')]) AS hub_originairportcode_hashkey, dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(DestinationAirportCode)), '')]) AS hub_destinationairportcode_hashkey,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'SpiceJet_Flight_Details') }}