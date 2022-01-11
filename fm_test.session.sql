-- 
SELECT u."email",
  concat("firstName", ' ', "lastName") AS FIO
FROM "users" AS u
  JOIN "orders" AS o ON o."userId" = u."id"
  JOIN "phones_to_orders" AS pto ON pto."orderId" = o."id"
  JOIN "phones" AS p ON p."id" = pto."phoneId"
WHERE p."brand" ILIKE 'iphone'
GROUP BY u."email",
  u."firstName",
  u."lastName"
ORDER BY FIO; 

--
SELECT concat("firstName", ' ', "lastName") AS FIO,
  count(*) AS amount
FROM "users" AS u
  JOIN "orders" AS o ON o."userId" = u."id"
GROUP BY u."id"
HAVING count(*) > 3
ORDER BY amount; 

--
SELECT concat("firstName", ' ', "lastName") AS FIO,
  count(*) AS amount
FROM "users" AS u
  JOIN "orders" AS o ON o."userId" = u."id"
GROUP BY u."id"
HAVING count(*) < 3
ORDER BY amount;

--
SELECT o."id", u."email" 
FROM "users" AS u
  JOIN "orders" AS o ON o."userId" = u."id"
  JOIN "phones_to_orders" AS pto ON pto."orderId" = o."id"
  JOIN "phones" AS p ON p."id" = pto."phoneId"
WHERE p."id" = 33;

--
SELECT p."brand", p."model", sum(pto."quantity") as amount
FROM "phones" AS p
  JOIN "phones_to_orders" AS pto ON pto."phoneId" = p."id"
GROUP BY p."id"
ORDER BY amount
LIMIT 1;