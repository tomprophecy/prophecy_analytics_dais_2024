WITH dt_li_account_history AS (

  SELECT * 
  
  FROM {{ ref('dt_li_account_history')}}

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
  
  FROM dt_li_account_history AS account_history_data

)

SELECT *

FROM linkedin_account_data
