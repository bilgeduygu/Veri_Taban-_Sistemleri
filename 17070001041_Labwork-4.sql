-- -------------------------------------------------------------------------- --
--                                                                            --
--                        Database Systems -- SE 2222                         --
--                                                                            --
--                                Labwork - 4                                 --
--                                                                            --
--                                Section - 2                                 --
--                                                                            --
--                                 08.01.2021                                 --
--                                                                            --
-- -------------------------------------------------------------------------- --



-- -------------------------------------------------------------------------- --
--
--            I declare that I did not in any way give answers to anyone 
--            else, get answers from others, or act in any way unethical.
--
--            Name:  Bilge
--         Surname:  Duygu
--  Student Number:  17070001041
--
-- -------------------------------------------------------------------------- --



-- ANSWER 1 ---------------------------------------------------  ( ?? / 30 )  --


SELECT * FROM customer INNER JOIN message on customer.customerid = message.fromcustomer;
-- we can not do the natural join because names are not equal (customerid and fromcustomer)
-- -------------------------------------------------------------------------- --



-- ANSWER 2 ---------------------------------------------------  ( ?? / 10 )  --


SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer;
-- -------------------------------------------------------------------------- --



-- ANSWER 3 ---------------------------------------------------  ( ?? / 10 )  --


SELECT * FROM message RIGHT JOIN staff on message.tostaff = staff.staffid;
-- -------------------------------------------------------------------------- --



-- ANSWER 4 ---------------------------------------------------  ( ?? / 30 )  --


SELECT * FROM customer FULL JOIN message on customer.customerid = message.fromcustomer;


SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer 
UNION
SELECT * FROM customer RIGHT JOIN message on customer.customerid = message.fromcustomer;
-- -------------------------------------------------------------------------- --



-- ANSWER 5 ---------------------------------------------------  ( ?? / 20 )  --


SELECT * FROM customer LEFT JOIN message on customer.customerid = message.fromcustomer
LEFT JOIN staff on message.tostaff = staff.staffid;
-- -------------------------------------------------------------------------- --