WITH dt_am_campaign_history AS (

  SELECT * 
  
  FROM {{ ref('dt_am_campaign_history')}}

),

cleanup AS (

  {#Formats campaign history data from the 'amazon' source, including campaign details, budget, and serving status. The query selects the most recent record for each campaign based on the last updated date.#}
  SELECT 
    'amazon' AS source_relation,
    CAST(id AS STRING) AS campaign_id,
    name AS campaign_name,
    creation_date AS creation_date,
    last_updated_date AS last_updated_date,
    portfolio_id AS portfolio_id,
    bidding_strategy AS bidding_strategy,
    budget AS budget,
    budget_type AS budget_type,
    effective_budget AS effective_budget,
    end_date AS end_date,
    profile_id AS profile_id,
    serving_status AS serving_status,
    start_date AS start_date,
    state AS state,
    targeting_type AS targeting_type,
    row_number() OVER (PARTITION BY id ORDER BY last_updated_date DESC) = 1 AS is_most_recent_record
  
  FROM dt_am_campaign_history AS in0

)

SELECT *

FROM cleanup
