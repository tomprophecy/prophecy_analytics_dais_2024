WITH dt_go_ad_history AS (

  SELECT * 
  
  FROM {{ ref('dt_go_ad_history')}}

),

Reformat_1 AS (

  SELECT * 
  
  FROM dt_go_ad_history AS in0

)

SELECT *

FROM Reformat_1
