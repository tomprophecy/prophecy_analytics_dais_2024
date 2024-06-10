WITH account_history AS (

  SELECT * 
  
  FROM {{ source('google', 'google_account_history_data') }}

),

cleanup AS (

  {#Cleans up and organizes Google Ads account history data, selecting the most recent record for each account.#}
  SELECT 
    'google_ads' AS source_relation,
    id AS account_id,
    updated_at AS updated_at,
    currency_code AS currency_code,
    auto_tagging_enabled AS auto_tagging_enabled,
    time_zone AS time_zone,
    descriptive_name AS account_name,
    row_number() OVER (PARTITION BY id ORDER BY updated_at DESC) = 1 AS is_most_recent_record
  
  FROM account_history AS dt_go_account_history

)

SELECT *

FROM cleanup
