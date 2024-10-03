
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ASSIGNMENT03" ("SALE_ID", "MEMBER_ID", "SALE_DATE", "PRODUCT_ID", "PRODUCT_TITLE", "SALE_PRICE", "SALE_QTY", "SALE_AMOUNT", "GENDER") AS 
  select
    D.sale_id,
    O.member_id,
    O.sale_date,
    D.product_id,
    P.product_title,
    P.sale_net as "SALE_PRICE",
    D.sale_quatity as "SALE_QTY",
    P.sale_net*D.sale_quatity as "SALE_AMOUNT",
    C.gender
from orderdetails D 
join orders O
	on D.sale_id = O.sale_id
join products P
	on D.product_id = P.product_id
join customers C
	on O.member_id = C.member_id
order by D.sale_id;