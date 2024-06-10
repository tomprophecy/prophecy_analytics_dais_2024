WITH account_stats_data AS (

  SELECT * 
  
  FROM {{ source('google', 'google_account_stats_data') }}

),

cleanup AS (

  {#Cleans up and transforms Google Ads account statistics data for analysis.#}
  SELECT 
    'google_ads' AS source_relation,
    customer_id AS account_id,
    DAY(DATE) AS date_day,
    ad_network_type AS ad_network_type,
    device AS device,
    clicks AS clicks,
    CAST(cost_micros AS FLOAT) / 1000000 AS spend,
    impressions AS impressions
  
  FROM account_stats_data AS dt_go_account_stats

)

SELECT *

FROM cleanup
