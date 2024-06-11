WITH campaign_level_report AS (

  SELECT * 
  
  FROM {{ ref('dt_am_campaign_level_report')}}

),

cleanup AS (

  {#Restructures campaign level report data from the 'amazon' source, including various metrics such as clicks, impressions, cost, and campaign budget.#}
  SELECT 
    'amazon' AS source_relation,
    DAY(DATE) AS date_day,
    CAST(campaign_id AS STRING) AS campaign_id,
    clicks AS clicks,
    impressions AS impressions,
    cost AS cost,
    campaign_applicable_budget_rule_id AS campaign_applicable_budget_rule_id,
    campaign_applicable_budget_rule_name AS campaign_applicable_budget_rule_name,
    campaign_bidding_strategy AS campaign_bidding_strategy,
    campaign_budget_amount AS campaign_budget_amount,
    campaign_budget_currency_code AS campaign_budget_currency_code,
    campaign_budget_type AS campaign_budget_type,
    campaign_rule_based_budget_amount AS campaign_rule_based_budget_amount
  
  FROM campaign_level_report

)

SELECT *

FROM cleanup
