{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(FlightID)), '')]) AS hub_flight_details_hashkey,

  FlightNumber, ArrivalDateTime, ScheduledDepartureDateTime, ActualDepartureDateTime, OriginAirportCode, DestinationAirportCode, SeatCapacity, AvailableSeats,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'SpiceJet_Flight_Details ') }}