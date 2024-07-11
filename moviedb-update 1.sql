-- Data Manipulation Language - DML Allows you to interact with data inside your database
-- Adding data Insert

INSERT `movietitles` (movietitle, director, releaseyear, rating, synopsis, dateadded, moviestatus, deleted, addedby)
VALUES ('Oppenheimer','Christopher Nolan',2023,8.3,'The story behind the atomic bomb creator','2024-06-15','released',0,1);
VALUES ('The Darkest Minds','Jennifer Nelson',2018,5.7,'Teenagers wake up one day with superpowers','2024-06-15','released',0,1);
VALUES ('The You See Me','Louis Leterrier',2013,7.2,'4 street magicians attract the attention of the FBI','2024-06-15','released',0,1);

-- SELECT Statement used to query data from the database
SELECT * FROM movietitles
SELECT movieid, synopsis, movie title, releaseyear, rating
FROM movietitles

-- FILTER DATA using the WHERE CLAUSE

SELECT movieid, synopsis, movietitle, releaseyear, rating
FROM movietitles
WHERE releaseyear>2014 AND rating<8;
WHERE synopsis LIKE '&street&';

-- SORD DATA, ORDER BY clause

SELECT movieid, synopsis, movietitle, releaseyear, rating
FROM movietitles
ORDER BY releaseyear

-- FUNCTIONS Inbuilt Functions
-- Scalar Value Functions only work on specific data in a column

SELECT movieid,UPPER(synopsis) AS uppercasesyopsis, movietitle, releaseyear, rating,
CHAR_LENGTH(movietitle) charactersintitle, LEFT(movietitle,3) abbreviation
FROM movietitles

-- Aggreation


-- total sum

SELECT COUNT(movieid) moviestotals
FROM movietitles

-- average rating

SELECT AVG(rating)
FROM movietitles

-- Sum of rating

SELECT SUM(rating)
FROM movietitles

-- Latest release by year

SELECT MAX(releaseyear)
FROM movietitles

-- Oldest release by year

SELECT MIN(releaseyear)
FROM movietitles

-- GROUPING FUNCTIONS
-- USING THE  -GROUP BY- CLAUSE

SELECT releaseyear, COUNT(movieid) AS moviesreleased 
FROM movietitles
GROUP BY releaseyear
HAVING COUNT(movieid)<2

INSERT INTO users(`username`,`firstname`,`lastname`)
VALUES('contact','Mary','Jane')
VALUES('administrator','John','Doe')

-- ADDED BY WHO?
-- JOINS -- COMBINE TABLE INTO ONE SET OF RESULTS

-- INNER JOIN aka EQUI JOIN
SELECT movieid, synopsis, movietitle, releaseyear, rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m, users AS u
WHERE m.`addedby`=u.`userid`

--

SELECT movieid, synopsis, movietitle, releaseyear, rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m INNER JOIN users AS u
ON m.`addedby`=u.`userid`


-- OUTER JOIN

SELECT movieid, synopsis, movietitle, releaseyear, rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m LEFT OUTER JOIN users AS u
ON m.`addedby`=u.`userid`


SELECT movieid, synopsis, movietitle, releaseyear, rating, CONCAT(firstname,' ',lastname) addedbyname
FROM movietitles AS m, users AS u
WHERE m.`addedby`=u.`userid`