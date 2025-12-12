-- Task 1: Run "init.sql".
USE se2222week11;

-- Task 2: Implement an inner join between "Country" and "Capital".
SELECT *
FROM Country
INNER JOIN Capital
ON Country.Country_ID = Capital.Country_ID;

-- or
SELECT *
FROM Country
NATURAL JOIN Capital;

-- Task 3: Implement a left join between "Country" and "Capital".
SELECT *
FROM Country
LEFT JOIN Capital
ON Country.Country_ID = Capital.Country_ID;

-- or
SELECT *
FROM Country
NATURAL LEFT JOIN Capital;

-- Task 4: Implement a right join between "Country" and "Capital".
SELECT *
FROM Country
RIGHT JOIN Capital
ON Country.Country_ID = Capital.Country_ID;

-- or
SELECT *
FROM Country
NATURAL RIGHT JOIN Capital;

-- Task 5: Implement a full join between "Country" and "Capital".
SELECT * FROM Country
LEFT JOIN Capital
ON Country.Country_ID = Capital.Country_ID
UNION
SELECT * FROM Country
RIGHT JOIN Capital
ON Country.Country_ID = Capital.Country_ID;

-- Task 2: Implement an inner join between "Country" and "Capital".
-- Show only the countries which are from "Western Europe".
SELECT *
FROM Country
INNER JOIN Capital
ON Country.Country_ID = Capital.Country_ID
WHERE Country.Region = "Western Europe";

-- or
SELECT *
FROM Country
NATURAL JOIN Capital
WHERE Country.Region = "Western Europe";