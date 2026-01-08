{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(BookingID)), ''), COALESCE(TRIM(LOWER(PaymentID)), '')]) AS link_bkg_payment_det_hashkey,

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(BookingID)), '')]) AS hub_bookingid_hashkey, dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(PaymentID)), '')]) AS hub_paymentid_hashkey,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'SpiceJet_booking_details') }}