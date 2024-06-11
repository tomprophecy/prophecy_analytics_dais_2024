WITH campaign_history AS (

  SELECT * 
  
  FROM {{ ref('br_am_campaign_history')}}

),

profile AS (

  SELECT * 
  
  FROM {{ ref('br_am_profile')}}

),

report AS (

  SELECT * 
  
  FROM {{ ref('br_am_campaign_level_report')}}

),

campaign_data AS (

  SELECT 
    campaign_history.campaign_id,
    campaign_history.campaign_name,
    campaign_history.creation_date,
    campaign_history.last_updated_date,
    report.clicks,
    report.impressions,
    report.cost,
    profile.account_name,
    profile.country_code,
    profile.profile_id
  
  FROM campaign_history
  LEFT JOIN report
     ON campaign_history.campaign_id = report.campaign_id
  LEFT JOIN profile
     ON campaign_history.profile_id = profile.profile_id

),

sum_clicks_impressions_cost AS (

  SELECT 
    profile_id,
    any_value(campaign_id) AS campaign_id,
    any_value(campaign_name) AS campaign_name,
    any_value(account_name) AS account_name,
    any_value(country_code) AS country_code,
    any_value(creation_date) AS creation_date,
    any_value(last_updated_date) AS last_updated_date,
    SUM(clicks) AS total_clicks,
    SUM(impressions) AS total_impressions,
    SUM(cost) AS total_cost
  
  FROM campaign_data
  
  GROUP BY profile_id

)

SELECT *

FROM sum_clicks_impressions_cost
