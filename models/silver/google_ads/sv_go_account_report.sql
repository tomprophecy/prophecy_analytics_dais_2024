WITH br_go_account_stats_1 AS (

  SELECT * 
  
  FROM {{ ref('br_go_account_stats')}}

),

br_go_account_history_1 AS (

  SELECT * 
  
  FROM {{ ref('br_go_account_history')}}

),

by_source_relation_account_id AS (

  SELECT 
    br_go_account_stats_1.date_day AS date_day,
    br_go_account_stats_1.ad_network_type AS ad_network_type,
    br_go_account_stats_1.device AS device,
    br_go_account_stats_1.clicks AS clicks,
    br_go_account_stats_1.spend AS spend,
    br_go_account_stats_1.impressions AS impressions,
    br_go_account_history_1.currency_code AS currency_code,
    br_go_account_history_1.account_name AS account_name,
    br_go_account_history_1.time_zone AS time_zone,
    br_go_account_history_1.source_relation AS source_relation,
    br_go_account_history_1.is_most_recent_record AS is_most_recent_record,
    br_go_account_history_1.account_id AS account_id,
    br_go_account_history_1.updated_at AS updated_at,
    br_go_account_history_1.auto_tagging_enabled AS auto_tagging_enabled
  
  FROM br_go_account_history_1
  INNER JOIN br_go_account_stats_1
     ON br_go_account_history_1.account_id = br_go_account_stats_1.account_id
    AND br_go_account_history_1.source_relation = br_go_account_stats_1.source_relation

),

total_spend_clicks_impressions AS (

  SELECT 
    account_id,
    SUM(spend) AS TOTAL_SPEND,
    SUM(clicks) AS TOTAL_CLICKS,
    SUM(impressions) AS TOTAL_IMPRESSIONS,
    MAX(currency_code) AS currency_code,
    MAX(updated_at) AS updated_at,
    MAX(source_relation) AS source_relation,
    MAX(account_name) AS account_name,
    MAX(auto_tagging_enabled) AS auto_tagging_enabled,
    MAX(time_zone) AS time_zone,
    MAX(is_most_recent_record) AS is_most_recent_record
  
  FROM by_source_relation_account_id AS by_source_relation_account_name
  
  GROUP BY account_id

)

SELECT *

FROM total_spend_clicks_impressions
