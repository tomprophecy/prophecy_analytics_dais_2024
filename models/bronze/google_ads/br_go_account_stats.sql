WITH google_account_stats_data AS (

  SELECT * 
  
  FROM {{ source('dais_2024_analytics_data_raw.analytics_data', 'google_account_stats_data') }}

),

cleanup AS (

  {#Cleans up and organizes account statistics data from the 'google_ads' source, including information on customer ID, date, ad network type, device, clicks, spend, and impressions.#}
  SELECT 
    'google_ads' AS source_relation,
    customer_id AS account_id,
    DATE AS date_day,
    ad_network_type AS ad_network_type,
    device AS device,
    clicks AS clicks,
    CAST(cost_micros AS FLOAT) / 1000000 AS spend,
    impressions AS impressions
  
  FROM google_account_stats_data AS dt_go_account_stats

)

SELECT *

FROM cleanup
