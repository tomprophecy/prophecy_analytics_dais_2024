WITH linkedin_campaign_history_data_1 AS (

  SELECT * 
  
  FROM {{ source('dais_2024_analytics_data_raw.analytics_data', 'linkedin_campaign_history_data') }}

),

linkedin_campaign_history AS (

  {#Formats LinkedIn campaign history data for analysis, including campaign details, budget information, and timestamps. Retrieves the latest version of each campaign.#}
  SELECT 
    'linkedin' AS source_relation,
    id AS campaign_id,
    name AS campaign_name,
    version_tag AS version_tag,
    campaign_group_id AS campaign_group_id,
    account_id AS account_id,
    CAST(NULL AS string) AS status,
    CAST(NULL AS string) AS type,
    CAST(NULL AS string) AS cost_type,
    CAST(NULL AS string) AS creative_selection,
    CAST(NULL AS float) AS daily_budget_amount,
    CAST(NULL AS string) AS daily_budget_currency_code,
    CAST(NULL AS float) AS unit_cost_amount,
    CAST(NULL AS STRING) AS unit_cost_currency_code,
    CAST(NULL AS string) AS format,
    CAST(NULL AS STRING) AS locale_country,
    CAST(NULL AS STRING) AS locale_language,
    CAST(NULL AS STRING) AS objective_type,
    CAST(NULL AS STRING) AS optimization_target_type,
    CAST(NULL AS BOOLEAN) AS is_audience_expansion_enabled,
    CAST(NULL AS BOOLEAN) AS is_offsite_delivery_enabled,
    CAST(NULL AS TIMESTAMP) AS run_schedule_start_at,
    CAST(NULL AS TIMESTAMP) AS run_schedule_end_at,
    last_modified_time AS last_modified_at,
    created_time AS created_at,
    row_number() OVER (PARTITION BY id ORDER BY last_modified_time DESC) = 1 AS is_latest_version
  
  FROM linkedin_campaign_history_data_1 AS dt_li_campaign_history

)

SELECT *

FROM linkedin_campaign_history
