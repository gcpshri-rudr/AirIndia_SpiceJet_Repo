{{ config(materialized='table') }}
 
SELECT

  dbt_utils.generate_surrogate_key([COALESCE(TRIM(LOWER(PaymentID)), '')]) AS hub_payment_hashkey,

  PaymentMethod, Amount, TransactionDate, Status,

  CURRENT_TIMESTAMP() AS load_datetime

FROM {{ source('staging', 'SpiceJet_payment_details') }}