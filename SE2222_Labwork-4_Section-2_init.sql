
-- Note: This database is for SE 2222, labwork 4, section 2. (04.01.2021) --

DROP DATABASE IF EXISTS se2222labwork4section2;
CREATE DATABASE se2222labwork4section2;
USE se2222labwork4section2;

CREATE TABLE customer (
	customerid INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	customername TEXT NOT NULL
);

CREATE TABLE staff (
	staffid INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	staffname TEXT NOT NULL
);

CREATE TABLE message (
	messageid INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	fromcustomer INT UNSIGNED,
	tostaff INT UNSIGNED,
	content TEXT,
	FOREIGN KEY (fromcustomer) REFERENCES customer(customerid),
	FOREIGN KEY (tostaff) REFERENCES staff(staffid)
);

LOCK TABLES customer WRITE;
INSERT INTO customer (customername) VALUES ('Kade Olson'), ('Rebekah Melton'), ('Bobby Irwin'), ('Juan Zamora'), ('Jabari Hood'), ('Lincoln Gardner'), ('Ruben Lam'), ('Brayan Shelton'), ('Broderick Shea'), ('Maribel Gates'), ('Cara Nash'), ('Talan Hays'), ('Aldo Hendricks'), ('Paityn Aguirre'), ('Kaylen Oneal'), ('Drew Black'), ('Gabrielle Santana'), ('Nola Harrington'), ('Lyric Hughes'), ('Luka Campbell'), ('Carina Hull'), ('Hassan Hoffman'), ('Myles Winters'), ('Kadence Simon'), ('Salvatore Mendez'), ('Shane Dixon'), ('Arielle Leon'), ('Keenan Orr'), ('Erika Camacho'), ('Kara Trevino'), ('Grant Benton'), ('Monserrat Ayala'), ('Zackary Castaneda'), ('Jameson Brewer'), ('Giancarlo Jarvis'), ('Eli Conrad'), ('Briana Walters'), ('Taliyah Molina'), ('Jocelynn Chavez'), ('Stanley Wells'), ('Cael Waters'), ('Marcus Sullivan'), ('Troy Gonzales'), ('Kierra Vincent'), ('Kiley Reilly'), ('Jameson Pollard'), ('Shyann Mcdonald'), ('Avery Roy'), ('Milo Khan'), ('Dania Patton'), ('Dillon Blair'), ('Jackson Jones'), ('Emilie Le'), ('Itzel Brock'), ('Desiree Copeland'), ('Melany Morrison'), ('Dereon Stewart'), ('Mauricio Leach'), ('Ezekiel Dixon'), ('Ibrahim Esparza'), ('Scott Berg'), ('Tommy Gilmore'), ('London Jordan'), ('Izabelle Ellison'), ('Maleah Coleman'), ('Areli Shea'), ('Abagail Malone'), ('Leonidas Goodwin'), ('Javon Cochran'), ('Nicolas Pratt'), ('Bennett Gardner'), ('Amani Doyle'), ('Thaddeus Randall'), ('Jace Mendez'), ('Kamryn Owens'), ('Michelle Forbes'), ('Nadia Weiss'), ('Casey Dalton'), ('Jordan Brandt'), ('Santos French'), ('Taliyah Barrera'), ('Celia Welch'), ('Ashtyn Caldwell'), ('Zoey Camacho'), ('Dante Wang'), ('Leonidas Erickson'), ('Angelo Parsons'), ('Vance Hayes'), ('Damon Macdonald'), ('Hugh Logan'), ('Gilberto Moody'), ('Brianna Harper'), ('Alberto Barron'), ('Melody Padilla'), ('Kelsey Lyons'), ('Anaya Sandoval'), ('Elisabeth Sosa'), ('Darnell Zuniga'), ('Lucy Hamilton'), ('Jewel Griffith');
UNLOCK TABLES;

LOCK TABLES staff WRITE;
INSERT INTO staff (staffname) VALUES ('Kaylah Krause'), ('Ada Elliott'), ('Heaven Hinton'), ('Kennedy Huynh'), ('Sarahi Powell'), ('Marley Barrera'), ('Alisson Moses'), ('Elaina Miller'), ('Jacqueline Olson'), ('Ellis George');
UNLOCK TABLES;

LOCK TABLES message WRITE;
INSERT INTO message (fromcustomer, tostaff, content) VALUES (43, 6, 'Lightning never strikes twice in the same place.'), (15, 8, 'Oh my God!'), (31, 9, 'Every man has his price.'), (33, 1, 'I\'m going the whole nine yards.'), (37, 2, 'Like two peas in a pod.'), (45, 9, 'I woke up on the wrong side of the bed.'), (34, 8, 'You are not the father.'), (40, 2, 'A man’s got to do what a man’s got to do.'), (47, 5, 'You can\'t teach an old dog new tricks.'), (16, 2, 'When the cat\'s away, the mice play.'), (46, 10, 'The apple doesn\'t fall far from the tree.'), (14, 7, 'What goes up must come down.'), (50, 4, 'Let\'s agree to disagree.'), (32, 4, 'A balanced diet is a cookie in each hand.'), (17, 8, 'The sky\'s the limit'), (18, 2, 'Misery loves company.'), (20, 3, 'Curiosity killed the cat.'), (9, 6, 'Is that your final answer?'), (46, 1, 'Don\'t shoot the messenger.'), (39, 7, 'Practice makes perfect.'), (37, 4, 'Too many cooks spoil the broth.'), (22, 5, 'I\'ll be back.'), (19, 1, 'No pain, no gain.'), (44, 8, 'If I\'ve told you once, I\'ve told you a thousand times!'), (1, 7, 'The squeaking wheel gets the oil.'), (49, 8, 'Keep your shirt on.'), (32, 5, 'Beauty is in the eyes of the beholder.'), (7, 8, 'The needs of the many outweigh the needs of the few.'), (28, 1, 'A man is known by the company he keeps.'), (33, 8, 'Whammy.'), (35, 4, 'Here\'s looking at you, kid.'), (30, 3, 'Cat Got Your Tongue?'), (18, 4, 'Put up your dukes.'), (46, 6, 'Don\'t cry over spilled milk.'), (11, 1, 'She\'s drop dead gorgeous.'), (21, 9, 'Do as I say, not as I do.'), (48, 4, 'Time\'s a-wastin.'), (7, 2, 'Big Brother is watching...'), (12, 8, 'Does my butt look big in this?'), (15, 10, 'The early bird catches the worm.'), (30, 8, 'Birds of a feather flock together.'), (13, 7, 'Your whole life is a joke.'), (26, 4, 'Saved by the bell.'), (9, 9, 'Look before you leap.'), (6, 4, 'If you can\'t beat them, join them.'), (5, 10, 'Would you jump off a bridge if all your friends were doing it?'), (31, 6, 'Variety is the spice of life.'), (49, 4, 'Get off your high horse.'), (25, 8, 'Did I do that?'), (11, 5, 'Yeah... that\'s the ticket!');
UNLOCK TABLES;

SELECT * FROM customer INNER JOIN message on customer.customerid = message.fromcustomer;

SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer;

SELECT * FROM message RIGHT JOIN staff on message.tostaff = staff.staffid;

SELECT * FROM customer FULL JOIN message on customer.customerid = message.fromcustomer;

SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer 
UNION
SELECT * FROM customer RIGHT JOIN message on customer.customerid = message.fromcustomer;

SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer
LEFT JOIN staff on message.tostaff = staff.staffid;



