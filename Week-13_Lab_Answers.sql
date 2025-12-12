-- QUESTION 1: Run "init.sql" of this week.
USE se2222week13;

-- QUESTION 2: Create a procedure that lists all passengers alphabetically.
DELIMITER //
CREATE PROCEDURE procedure1()
BEGIN
	SELECT * FROM passenger ORDER BY name, surname;
END//
DELIMITER ;

-- QUESTION 3: Call the procedure created in the previous question.
CALL procedure1();

-- QUESTION 4: Create a procedure that inserts a new row with given parameters.
DELIMITER //
CREATE PROCEDURE procedure2(IN nname TEXT, IN nsurname TEXT, 
IN nage INT UNSIGNED, IN ngender TEXT, IN nphonenumber TEXT, 
IN nstartcity TEXT, IN ndestinationcity TEXT)
BEGIN
	INSERT INTO passenger(name, surname, age, gender, phonenumber, startcity, 
	                                                            destinationcity)
    VALUES(nname, nsurname, nage, ngender, nphonenumber, nstartcity, 
	                                                          ndestinationcity);
END//
DELIMITER ;

-- QUESTION 5: Add a new passenger using the previous created procedure.
CALL procedure2('Eric', 'Clapton', 75, 'Male', '(259) 737-4334', 'Edinburgh', 
                                                                      'London');

-- QUESTION 6: Create a trigger such that when a new row is added to the 
--     passenger table, the same row is added into the "passenger_backup" table.
DELIMITER //
CREATE TRIGGER trigger1 BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
	INSERT INTO passenger_backup(name, surname, age, gender, phonenumber, 
	                                                 startcity, destinationcity)
    VALUES(NEW.name, NEW.surname, NEW.age, NEW.gender, NEW.phonenumber, 
	                                        NEW.startcity, NEW.destinationcity);
END//
DELIMITER ;

-- QUESTION 7: Try the previous trigger and observe the change.
SELECT COUNT(*) FROM passenger;
CALL procedure2('John', 'Lennon', 40, 'Male', '(258) 747-4644', 'Liverpool', 
                                                                       'Paris');
SELECT COUNT(*) FROM passenger;
SELECT * FROM passenger_backup;

-- QUESTION 8: Create a trigger such that when a new row which is kid, is added 
--    to the passenger table, the same row is added into the "passenger_backup" 
--    table twice.
DELIMITER //
CREATE TRIGGER trigger2 BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
	IF NEW.age < 18 THEN
		INSERT INTO passenger_backup(name, surname, age, gender, phonenumber, 
		                                             startcity, destinationcity)
		VALUES(NEW.name, NEW.surname, NEW.age, NEW.gender, NEW.phonenumber, 
		                                    NEW.startcity, NEW.destinationcity);
		INSERT INTO passenger_backup(name, surname, age, gender, phonenumber, 
		                                             startcity, destinationcity)
		VALUES(NEW.name, NEW.surname, NEW.age, NEW.gender, NEW.phonenumber, 
		                                    NEW.startcity, NEW.destinationcity);
    END IF;
END//
DELIMITER ;

-- QUESTION 9: Try the previous trigger and observe the change.
SELECT * FROM passenger_backup;
CALL procedure2('Sarah', 'Gates', 17, 'Female', '(253) 737-9842', 'Rome', 
                                                                       'Oslo');
CALL procedure2('Layla', 'Gates', 21, 'Female', '(252) 734-8541', 'Rome', 
                                                                        'Oslo');
SELECT * FROM passenger_backup;

-- QUESTION 10: Create a trigger such that when a row is deleted from the 
--    passenger table, the same row is deleted from the "passenger_backup" 
--    table. Assume everyone's first and last name is unique.
DELIMITER //
CREATE TRIGGER trigger3 AFTER DELETE ON passenger
FOR EACH ROW
BEGIN
	DELETE FROM passenger_backup
	WHERE name = OLD.name AND surname = OLD.surname;
END//
DELIMITER ;

-- QUESTION 11: Try the previous trigger and observe the change.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM passenger WHERE name = 'Layla' AND surname = 'Gates';
SELECT * FROM passenger_backup;