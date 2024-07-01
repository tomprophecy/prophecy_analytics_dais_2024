WITH linkedin_account_history_data_1 AS (

  SELECT * 
  
  FROM {{ source('dais_2024_analytics_data_raw.analytics_data', 'linkedin_account_history_data') }}

),

linkedin_account_data AS (

  {#Reformats account data from the 'linkedin' source relation for analysis. It includes account ID, name, currency, version tag, status, type, last modified time, and created time.#}
  SELECT 
    'linkedin' AS source_relation,
    id AS account_id,
    name AS account_name,
    currency AS currency,
    version_tag AS version_tag,
    CAST(NULL AS string) AS status,
    CAST(NULL AS string) AS type,
    last_modified_time AS last_modified_time,
    created_time AS created_time
  
  FROM linkedin_account_history_data_1 AS account_history_data

)

SELECT *

FROM linkedin_account_data
