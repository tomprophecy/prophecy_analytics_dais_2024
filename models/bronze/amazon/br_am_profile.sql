WITH profile AS (

  SELECT * 
  
  FROM {{ ref('dt_am_profile')}}

),

cleanup AS (

  {#Reformats data from the 'dt_am_profile' table, extracting relevant fields and assigning appropriate data types.#}
  SELECT 
    'amazon' AS source_relation,
    _fivetran_deleted AS _fivetran_deleted,
    id AS profile_id,
    CAST(account_id AS STRING) AS account_id,
    account_marketplace_string_id AS account_marketplace_string_id,
    account_name AS account_name,
    account_sub_type AS account_sub_type,
    account_type AS account_type,
    account_valid_payment_method AS account_valid_payment_method,
    country_code AS country_code,
    currency_code AS currency_code,
    daily_budget AS daily_budget,
    timezone AS timezone
  
  FROM profile AS in0

)

SELECT *

FROM cleanup
