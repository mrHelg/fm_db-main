SELECT sum("quantity")
FROM phones_to_orders;

SELECT sum("quantity")
FROM phones;


SELECT avg("price")
FROM phones;

SELECT "brand", avg("price")
FROM phones
GROUP BY "brand";


SELECT "brand", count(*)
FROM phones
GROUP BY "brand"
ORDER BY "brand";


