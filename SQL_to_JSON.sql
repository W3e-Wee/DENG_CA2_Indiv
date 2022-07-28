-- use [BikeSalesTeam4]

-- Stocks collection

SELECT
	*
FROM
	production.stocks as S
FOR JSON PATH

-- ZeroStock Collection
/*
SELECT
	P.product_id,
	P.product_name, 
	B.brand_name,
	C.category_name,
	P.model_year,
	P.list_price
FROM
	production.stocks as S, production.products as P, production.brands as B, production.categories as C
WHERE
	S.quantity = 0 AND
	S.product_id = P.product_id AND	
	P.brand_id = B.brand_id AND
	P.category_id = C.category_id
FOR JSON PATH
*/


-- UnSold Collection (Products with No orders/Check for stock)
SELECT
	p.product_id,
	p.product_name,
	b.brand_name,
	c.category_name,
	p.model_year,
	p.list_price
FROM
	production.products as p,
	production.brands as b,
	production.categories as c,
	production.stocks as s
WHERE 
p.product_id NOT IN( 
	SELECT 
		OI.product_id 
	FROM
		sales.order_items AS OI
) AND
p.brand_id = b.brand_id AND
p.category_id = c.category_id AND
p.product_id = s.product_id
GROUP BY
	p.product_id,
	p.product_name,
	b.brand_name,
	c.category_name,
	p.model_year,
	p.list_price
FOR JSON PATH

select * from sales.order_items

select * from sales.orders

select * from production.stocks where product_id = 'RDB154'