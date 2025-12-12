-- -------------------------------------------------------------------------- --
--                                                                            --
--                        Database Systems -- SE 2222                         --
--                                                                            --
--                                Labwork - 1                                 --
--                                                                            --
--                                Section - 2                                 --
--                                                                            --
--                                 13.11.2020                                 --
--                                                                            --
-- -------------------------------------------------------------------------- --



-- -------------------------------------------------------------------------- --
--
--            I declare that I did not in any way give answers to anyone 
--            else, get answers from others, or act in any way unethical.
--
--            Name:  Nihan Dilara
--         Surname:  Yürüten
--  Student Number:  17070001020
--
-- -------------------------------------------------------------------------- --





-- ANSWER 1 ---------------------------------------------------  ( ?? / 10 )  --
select count(Continent) 
from countrydb.country
where Region = 'Southern Europe' and LifeExpectancy>=75;
-- -------------------------------------------------------------------------- --





-- ANSWER 2 ---------------------------------------------------  ( ?? / 10 )  --
select (sum(Population)/count(Population)) as 'average population'
from countrydb.country
where Region='Southeast Asia';
-- -------------------------------------------------------------------------- --





-- ANSWER 3 ---------------------------------------------------  ( ?? / 10 )  --
select max(Population) as 'max population'
from countrydb.country
where GovernmentForm='Constitutional Monarchy';
-- -------------------------------------------------------------------------- --





-- ANSWER 4 ---------------------------------------------------  ( ?? / 10 )  --
select stddev(LifeExpectancy) as 'standard deviation'
from countrydb.country
where Continent='Africa';
-- -------------------------------------------------------------------------- --





-- ANSWER 5 ---------------------------------------------------  ( ?? / 10 )  --
set @spa = (select count(*)
			from countrydb.country
            where Language='Spanish');
select @spa/count(*) as 'Spanish / English'
from countrydb.country
where Language='English';
-- -------------------------------------------------------------------------- --





-- ANSWER 6 ---------------------------------------------------  ( ?? / 10 )  --
set @ME = (select max(CapitalPopulation)
			from countrydb.country
            where Region='Middle East');
select @ME/max(CapitalPopulation) as 'Middle East / Africa'
from countrydb.country
where Continent='Africa';
-- -------------------------------------------------------------------------- --





-- ANSWER 7 ---------------------------------------------------  ( ?? / 10 )  --
set @SAM = (select distinct CapitalPopulation
			from countrydb.country
            where Region='South America' and SurfaceArea in (select max(SurfaceArea)
															 from countrydb.country
                                                             where Region='South America'));
select distinct @SAM/CapitalPopulation as 'South America/Southeast Asia'
from countrydb.country
where Region='Southeast Asia' and SurfaceArea in (select max(SurfaceArea)
												 from countrydb.country
												 where Region='Southeast Asia');
-- -------------------------------------------------------------------------- --





-- ANSWER 8 ---------------------------------------------------  ( ?? / 10 )  --
select count(*)
from countrydb.country
where LifeExpectancy>75 xor Population>=75000000;
-- -------------------------------------------------------------------------- --





-- ANSWER 9 ---------------------------------------------------  ( ?? / 10 )  --
select distinct Name,Continent,Region
from countrydb.country
where GovernmentForm='Republic' and LifeExpectancy<70 and CapitalPopulation>1000000;
-- -------------------------------------------------------------------------- --





-- ANSWER 10 --------------------------------------------------  ( ?? / 10 )  --
set @LE = (select max(LifeExpectancy)
			from countrydb.country);
select distinct Name
from countrydb.country
where LifeExpectancy = @LE;
-- -------------------------------------------------------------------------- --