WITH dt_li_ad_analytics_by_campaign AS (

  SELECT * 
  
  FROM {{ ref('dt_li_ad_analytics_by_campaign')}}

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
  
  FROM dt_li_ad_analytics_by_campaign

)

SELECT *

FROM cleanup
