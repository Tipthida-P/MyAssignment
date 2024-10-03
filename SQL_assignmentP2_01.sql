
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ASSIGNMENT01" ("MEMBER_ID", "PRODUCT_ID", "PRODUCT_TITLE", "SALE_PRICE", "TOTAL_SALE_QTY", "TOTAL_SALE_AMOUNT") AS 
  select 
    O.member_id,
    P.product_id,
    P.product_title,
    P.sale_net as "SALE_PRICE",
    SUM(D.sale_quatity) as "TOTAL_SALE_QTY",
    SUM(P.sale_net*D.sale_quatity) as "TOTAL_SALE_AMOUNT"
from orders O
join orderdetails D 
	on O.sale_id = D.sale_id  
join products P
	on D.product_id = P.product_id
group by O.member_id, P.product_id, P.product_title, P.sale_net
order by O.member_id;