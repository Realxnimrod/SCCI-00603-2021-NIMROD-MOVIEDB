-- Data Manipulation Language - DML Allows you to interact with data inside your database
-- Adding data Insert

INSERT `movietitles` (movietitle, director, releaseyear, rating, synopsis, dateadded, moviestatus, deleted, addedby)
       ('Oppenheimer','Christopher Nolan',2023,8.3,'The story behind the atomic bomb creator','2024-06-15','released',0,1);
       ('The Darkest Minds','Jennifer Nelson',2018,5.7,'Teenagers wake up one day with superpowers','2024-06-15','released',0,1);
       ('The You See Me','Louis Leterrier',2013,7.2,'4 street magicians attract the attention of the FBI','2024-06-15','released',0,1);
       ('Inception', 'Christopher Nolan', 2010, 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2024-06-16', 'released', 0, 1),
       ('The Shawshank Redemption', 'Frank Darabont', 1994, 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '2024-06-17', 'released', 0, 1),
       ('Interstellar', 'Christopher Nolan', 2014, 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.', '2024-06-18', 'released', 0, 1),
       ('The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 8.7, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '2024-06-20', 'released', 0, 1),
       ('Joker', 'Todd Phillips', 2019, 8.4, 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime.', '2024-06-21', 'released', 0, 1),
       ('Her', 'Spike Jonze', 2013, 8.0, 'In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.', '2024-06-22', 'released', 0, 1),
       ('The Grand Budapest Hotel', 'Wes Anderson', 2014, 8.1, 'A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel\'s glorious years under an exceptional concierge.', '2024-06-23', 'released', 0, 1),
       ('Mad Max: Fury Road', 'George Miller', 2015, 8.1, 'In a post-apocalyptic wasteland, Max teams up with a mysterious woman to escape a ruthless warlord and his army in an armored tanker truck.', '2024-06-24', 'released', 0, 1),
       ('A Quiet Place', 'John Krasinski', 2018, 7.5, 'In a post-apocalyptic world, a family is forced to live in silence while hiding from monsters with ultra-sensitive hearing.', '2024-06-25', 'released', 0, 1),
       ('Moonlight', 'Barry Jenkins', 2016, 7.4, 'A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.', '2024-06-26', 'released', 0, 1),
       ('Get Out', 'Jordan Peele', 2017, 7.7, 'A young African-American man visits his Caucasian girlfriend\'s mysterious family estate.', '2024-06-27', 'released', 0, 1),
       ('Parasite', 'Bong Joon Ho', 2019, 8.6, 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', '2024-06-28', 'released', 0, 1),
       ('La La Land', 'Damien Chazelle', 2016, 8.0, 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', '2024-06-29', 'released', 0, 1),
       ('Whiplash', 'Damien Chazelle', 2014, 8.5, 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.', '2024-06-30', 'released', 0, 1);
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
