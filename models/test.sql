WITH br_li_campaign_history AS (

  SELECT * 
  
  FROM {{ ref('br_li_campaign_history')}}

),

br_li_account_history AS (

  SELECT * 
  
  FROM {{ ref('br_li_account_history')}}

),

by_created_time_last_modified_time AS (

  {#Combines campaign and account history data based on their account ID.#}
  SELECT 
    br_li_campaign_history.campaign_id AS campaign_id,
    br_li_campaign_history.campaign_name AS campaign_name,
    br_li_campaign_history.campaign_group_id AS campaign_group_id,
    br_li_campaign_history.cost_type AS cost_type,
    br_li_campaign_history.creative_selection AS creative_selection,
    br_li_campaign_history.daily_budget_amount AS daily_budget_amount,
    br_li_campaign_history.daily_budget_currency_code AS daily_budget_currency_code,
    br_li_campaign_history.unit_cost_amount AS unit_cost_amount,
    br_li_campaign_history.unit_cost_currency_code AS unit_cost_currency_code,
    br_li_campaign_history.FORMAT AS format,
    br_li_campaign_history.locale_country AS locale_country,
    br_li_campaign_history.locale_language AS locale_language,
    br_li_campaign_history.objective_type AS objective_type,
    br_li_campaign_history.optimization_target_type AS optimization_target_type,
    br_li_campaign_history.is_audience_expansion_enabled AS is_audience_expansion_enabled,
    br_li_campaign_history.is_offsite_delivery_enabled AS is_offsite_delivery_enabled,
    br_li_campaign_history.run_schedule_start_at AS run_schedule_start_at,
    br_li_campaign_history.run_schedule_end_at AS run_schedule_end_at,
    br_li_campaign_history.is_latest_version AS is_latest_version,
    br_li_account_history.account_id AS account_id,
    br_li_account_history.account_name AS account_name,
    br_li_account_history.type AS type,
    br_li_account_history.last_modified_time AS last_modified_time,
    br_li_account_history.created_time AS created_time,
    br_li_account_history.source_relation AS source_relation,
    br_li_account_history.status AS status,
    br_li_account_history.currency AS currency,
    br_li_account_history.version_tag AS version_tag
  
  FROM br_li_account_history
  INNER JOIN br_li_campaign_history
     ON br_li_account_history.account_id = br_li_campaign_history.account_id

)

SELECT *

FROM in0
