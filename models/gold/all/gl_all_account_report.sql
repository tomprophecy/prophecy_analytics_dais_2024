WITH sv_li_account_report AS (

  SELECT * 
  
  FROM {{ ref('sv_li_account_report')}}

),

cleanup_li AS (

  {#Cleans up and organizes data from the sv_li_account_report table, including source relation, account ID, clicks, impressions, and cost.#}
  SELECT 
    source_relation,
    account_id,
    clicks,
    impressions,
    cost
  
  FROM sv_li_account_report

)

SELECT *

FROM cleanup_li
