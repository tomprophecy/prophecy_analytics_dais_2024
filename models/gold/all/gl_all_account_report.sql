WITH sv_go_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_go_account_report')}}

),

account_report AS (

  SELECT 
    account_id,
    TOTAL_SPEND,
    TOTAL_CLICKS,
    TOTAL_IMPRESSIONS,
    currency_code,
    updated_at,
    source_relation,
    account_name,
    is_most_recent_record
  
  FROM sv_go_account_report

),

sv_li_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_li_account_report')}}

),

account_report_1 AS (

  SELECT 
    source_relation,
    account_id,
    account_name,
    currency,
    last_modified_time,
    clicks,
    impressions,
    cost,
    is_most_recent_record
  
  FROM sv_li_account_report

),

most_recent_records_1 AS (

  SELECT * 
  
  FROM account_report
  
  WHERE is_most_recent_record

),

account_summary AS (

  SELECT 
    account_id AS ACCOUNT_ID,
    account_name AS ACCOUNT_NAME,
    currency_code AS CURRENCY_CODE,
    TOTAL_SPEND AS SPEND,
    TOTAL_CLICKS AS CLICKS,
    TOTAL_IMPRESSIONS AS IMPRESSIONS,
    updated_at AS UPDATED_AT,
    source_relation AS SOURCE_RELATION,
    'GO' AS SOURCE
  
  FROM most_recent_records_1

),

most_recent_records AS (

  SELECT * 
  
  FROM account_report_1
  
  WHERE is_most_recent_record

),

filter_1_data AS (

  SELECT 
    account_id AS ACCOUNT_ID,
    account_name AS ACCOUNT_NAME,
    currency AS CURRENCY_CODE,
    cost AS SPEND,
    clicks AS CLICKS,
    impressions AS IMPRESSIONS,
    last_modified_time AS UPDATED_AT,
    source_relation AS SOURCE_RELATION,
    'LI' AS SOURCE
  
  FROM most_recent_records

),

reformatted_union AS (

  SELECT * 
  
  FROM account_summary
  
  UNION ALL
  
  SELECT * 
  
  FROM filter_1_data

)

SELECT *

FROM reformatted_union
