WITH linkedin_ad_analytics_by_campaign_data_1 AS (

  SELECT * 
  
  FROM {{ source('dais_2024_analytics_data_raw.analytics_data', 'linkedin_ad_analytics_by_campaign_data') }}

),

cleanup AS (

  {#Reformats LinkedIn ad analytics data by campaign, including source relation, date, campaign ID, clicks, impressions, and cost.#}
  SELECT 
    'linkedin' AS source_relation,
    day AS date_day,
    campaign_id AS campaign_id,
    clicks AS clicks,
    CAST(impressions AS INT) AS impressions,
    CAST(cost_in_usd AS FLOAT) AS cost
  
  FROM linkedin_ad_analytics_by_campaign_data_1 AS dt_li_ad_analytics_by_campaign

)

SELECT *

FROM cleanup
