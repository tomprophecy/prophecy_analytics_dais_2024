WITH sv_am_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_am_account_report')}}

),

amazon_cleanup AS (

  SELECT 
    'amazon' AS source_relation,
    profile_id AS account_id,
    account_name,
    total_clicks AS clicks,
    total_impressions AS impressions,
    total_cost AS cost
  
  FROM sv_am_account_report

),

sv_li_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_li_account_report')}}

),

cleanup AS (

  SELECT 
    source_relation AS source_relation,
    account_id AS account_id,
    account_name,
    clicks AS clicks,
    impressions AS impressions,
    cost AS cost
  
  FROM sv_li_account_report

),

sv_go_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_go_account_report')}}

),

google_cleanup AS (

  SELECT 
    source_relation AS source_relation,
    account_id AS account_id,
    account_name,
    TOTAL_CLICKS AS clicks,
    TOTAL_IMPRESSIONS AS impressions,
    TOTAL_SPEND AS cost
  
  FROM sv_go_account_report

),

combined_reports AS (

  SELECT * 
  
  FROM cleanup
  
  UNION ALL
  
  SELECT * 
  
  FROM google_cleanup
  
  UNION ALL
  
  SELECT * 
  
  FROM amazon_cleanup

)

SELECT *

FROM combined_reports
