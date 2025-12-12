
-- Note: This database is for SE 2222 week 11. (17.12.2020) --

DROP DATABASE IF EXISTS se2222week11;
CREATE DATABASE se2222week11;
USE se2222week11;

CREATE TABLE Country (
	Country_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Country_Name TEXT NOT NULL,
	Region TEXT NOT NULL
);

CREATE TABLE Capital (
	Capital_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	Capital_Name TEXT NOT NULL,
	Country_ID INT UNSIGNED,
    FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID)
);

LOCK TABLES Country WRITE;
INSERT INTO Country (Country_Name, Region) VALUES ('Andorra', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Albania', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Netherlands', 'Western Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Slovenia', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Ukraine', 'Eastern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Greece', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Latvia', 'Northern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Luxembourg', 'Western Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Guernsey', 'Northern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Gibraltar', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Liechtenstein', 'Western Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Åland Islands', 'Northern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('France', 'Western Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Malta', 'Southern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Jersey', 'Northern Europe');
INSERT INTO Country (Country_Name, Region) VALUES ('Portugal', 'Southern Europe');
UNLOCK TABLES;

LOCK TABLES Capital WRITE;
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Andorra La Vella', 1);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Tirana', 2);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Amsterdam', 3);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Ljubljana', 4);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Kyiv', 5);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Athens', 6);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Riga', 7);
INSERT INTO Capital (Capital_Name, Country_ID) VALUES ('Luxembourg City', 8);
INSERT INTO Capital (Capital_Name) VALUES ('Ankara');
INSERT INTO Capital (Capital_Name) VALUES ('Rome');
INSERT INTO Capital (Capital_Name) VALUES ('London');
INSERT INTO Capital (Capital_Name) VALUES ('Berlin');
INSERT INTO Capital (Capital_Name) VALUES ('Oslo');
INSERT INTO Capital (Capital_Name) VALUES ('Madrid');
INSERT INTO Capital (Capital_Name) VALUES ('Prague');
INSERT INTO Capital (Capital_Name) VALUES ('Warsaw');
UNLOCK TABLES;