CREATE DATABASE chinook_Data;
USE chinook_Data;

#Creating Tables 
 CREATE TABLE IF NOT EXISTS `agents` (
  `AGENT_CODE` varchar(6) NOT NULL DEFAULT '',
  `AGENT_NAME` varchar(40) DEFAULT NULL,
  `WORKING_AREA` varchar(35) DEFAULT NULL,
  `COMMISSION` decimal(10,2) DEFAULT NULL,
  `PHONE_NO` varchar(15) DEFAULT NULL,
  `COUNTRY` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`AGENT_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `customer` (
  `CUST_CODE` varchar(6) NOT NULL,
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` varchar(35) DEFAULT NULL,
  `WORKING_AREA` varchar(35) NOT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` decimal(10,0) DEFAULT NULL,
  `OPENING_AMT` decimal(12,2) NOT NULL,
  `RECEIVE_AMT` decimal(12,2) NOT NULL,
  `PAYMENT_AMT` decimal(12,2) NOT NULL,
  `OUTSTANDING_AMT` decimal(12,2) NOT NULL,
  `PHONE_NO` varchar(17) NOT NULL,
  `AGENT_CODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY(`CUST_CODE`),
  KEY `CUSTCITY` (`CUST_CITY`),
  KEY `CUSTCITY_COUNTRY` (`CUST_CITY`,`CUST_COUNTRY`),
  FOREIGN KEY (`AGENT_CODE`) REFERENCES `agents`(`AGENT_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `orders` (
  `ORD_NUM` decimal(6,0) NOT NULL,
  `ORD_AMOUNT` decimal(12,2) NOT NULL,
  `ADVANCE_AMOUNT` decimal(12,2) NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `AGENT_CODE` varchar(6) NOT NULL,
  `ORD_DESCRIPTION` varchar(60) NOT NULL,
  PRIMARY KEY(`ORD_NUM`),
  FOREIGN KEY(`CUST_CODE`) REFERENCES `customer`(`CUST_CODE`),
  FOREIGN KEY(`AGENT_CODE`) REFERENCES `agents`(`AGENT_CODE`)
  
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

#INSERTING DATA INTO TABLES
INSERT INTO `agents` (`AGENT_CODE`, `AGENT_NAME`, `WORKING_AREA`, `COMMISSION`, `PHONE_NO`, `COUNTRY`) VALUES
('A007  ', 'Ramasundar                              ', 'Bangalore                          ', '0.15', '077-25814763   ', '\r'),
('A003  ', 'Alex                                    ', 'London                             ', '0.13', '075-12458969   ', '\r'),
('A008  ', 'Alford                                  ', 'New York                           ', '0.12', '044-25874365   ', '\r'),
('A011  ', 'Ravi Kumar                              ', 'Bangalore                          ', '0.15', '077-45625874   ', '\r'),
('A010  ', 'Santakumar                              ', 'Chennai                            ', '0.14', '007-22388644   ', '\r'),
('A012  ', 'Lucida                                  ', 'San Jose                           ', '0.12', '044-52981425   ', '\r'),
('A005  ', 'Anderson                                ', 'Brisban                            ', '0.13', '045-21447739   ', '\r'),
('A001  ', 'Subbarao                                ', 'Bangalore                          ', '0.14', '077-12346674   ', '\r'),
('A002  ', 'Mukesh                                  ', 'Mumbai                             ', '0.11', '029-12358964   ', '\r'),
('A006  ', 'McDen                                   ', 'London                             ', '0.15', '078-22255588   ', '\r'),
('A004  ', 'Ivan                                    ', 'Torento                            ', '0.15', '008-22544166   ', '\r'),
('A009  ', 'Benjamin                                ', 'Hampshair                          ', '0.11', '008-22536178   ', '\r');

INSERT INTO `customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`) VALUES
('C00013', 'Holmes', 'London                             ', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003  '),
('C00001', 'Micheal', 'New York                           ', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008  '),
('C00020', 'Albert', 'New York                           ', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008  '),
('C00025', 'Ravindran', 'Bangalore                          ', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011  '),
('C00024', 'Cook', 'London                             ', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006  '),
('C00015', 'Stuart', 'London                             ', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003  '),
('C00002', 'Bolt', 'New York                           ', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008  '),
('C00018', 'Fleming', 'Brisban                            ', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005  '),
('C00021', 'Jacks', 'Brisban                            ', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005  '),
('C00019', 'Yearannaidu', 'Chennai                            ', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010  '),
('C00005', 'Sasikant', 'Mumbai                             ', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002  '),
('C00007', 'Ramanathan', 'Chennai                            ', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010  '),
('C00022', 'Avinash', 'Mumbai                             ', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678', 'A002  '),
('C00004', 'Winston', 'Brisban                            ', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005  '),
('C00023', 'Karl', 'London                             ', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006  '),
('C00006', 'Shilton', 'Torento                            ', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004  '),
('C00010', 'Charles', 'Hampshair                          ', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009  '),
('C00017', 'Srinivas', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007  '),
('C00012', 'Steven', 'San Jose                           ', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012  '),
('C00008', 'Karolina', 'Torento                            ', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004  '),
('C00003', 'Martin', 'Torento                            ', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004  '),
('C00009', 'Ramesh', 'Mumbai                             ', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002  '),
('C00014', 'Rangarappa', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001  '),
('C00016', 'Venkatpati', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007  '),
('C00011', 'Sundariya', 'Chennai                            ', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010  ');

INSERT INTO `orders` (`ORD_NUM`, `ORD_AMOUNT`, `ADVANCE_AMOUNT`, `ORD_DATE`, `CUST_CODE`, `AGENT_CODE`, `ORD_DESCRIPTION`) VALUES
('200100', '1000.00', '600.00', '2008-01-08', 'C00015', 'A003  ', 'SOD\r'),
('200110', '3000.00', '500.00', '2008-04-15', 'C00019', 'A010  ', 'SOD\r'),
('200107', '4500.00', '900.00', '2008-08-30', 'C00007', 'A010  ', 'SOD\r'),
('200112', '2000.00', '400.00', '2008-05-30', 'C00016', 'A007  ', 'SOD\r'),
('200113', '4000.00', '600.00', '2008-06-10', 'C00022', 'A002  ', 'SOD\r'),
('200102', '2000.00', '300.00', '2008-05-25', 'C00012', 'A012  ', 'SOD\r'),
('200114', '3500.00', '2000.00', '2008-08-15', 'C00002', 'A008  ', 'SOD\r'),
('200122', '2500.00', '400.00', '2008-09-16', 'C00003', 'A004  ', 'SOD\r'),
('200118', '500.00', '100.00', '2008-07-20', 'C00023', 'A006  ', 'SOD\r'),
('200119', '4000.00', '700.00', '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
('200121', '1500.00', '600.00', '2008-09-23', 'C00008', 'A004  ', 'SOD\r'),
('200130', '2500.00', '400.00', '2008-07-30', 'C00025', 'A011  ', 'SOD\r'),
('200134', '4200.00', '1800.00', '2008-09-25', 'C00004', 'A005  ', 'SOD\r'),
('200115', '2000.00', '1200.00', '2008-02-08', 'C00013', 'A013  ', 'SOD\r'),
('200108', '4000.00', '600.00', '2008-02-15', 'C00008', 'A004  ', 'SOD\r'),
('200103', '1500.00', '700.00', '2008-05-15', 'C00021', 'A005  ', 'SOD\r'),
('200105', '2500.00', '500.00', '2008-07-18', 'C00025', 'A011  ', 'SOD\r'),
('200109', '3500.00', '800.00', '2008-07-30', 'C00011', 'A010  ', 'SOD\r'),
('200101', '3000.00', '1000.00', '2008-07-15', 'C00001', 'A008  ', 'SOD\r'),
('200111', '1000.00', '300.00', '2008-07-10', 'C00020', 'A008  ', 'SOD\r'),
('200104', '1500.00', '500.00', '2008-03-13', 'C00006', 'A004  ', 'SOD\r'),
('200106', '2500.00', '700.00', '2008-04-20', 'C00005', 'A002  ', 'SOD\r'),
('200125', '2000.00', '600.00', '2008-10-10', 'C00018', 'A005  ', 'SOD\r'),
('200117', '800.00', '200.00', '2008-10-20', 'C00014', 'A001  ', 'SOD\r'),
('200123', '500.00', '100.00', '2008-09-16', 'C00022', 'A002  ', 'SOD\r'),
('200120', '500.00', '100.00', '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
('200116', '500.00', '100.00', '2008-07-13', 'C00010', 'A009  ', 'SOD\r'),
('200124', '500.00', '100.00', '2008-06-20', 'C00017', 'A007  ', 'SOD\r'),
('200126', '500.00', '100.00', '2008-06-24', 'C00022', 'A002  ', 'SOD\r'),
('200129', '2500.00', '500.00', '2008-07-20', 'C00024', 'A006  ', 'SOD\r'),
('200127', '2500.00', '400.00', '2008-07-20', 'C00015', 'A003  ', 'SOD\r'),
('200128', '3500.00', '1500.00', '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
('200135', '2000.00', '800.00', '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
('200131', '900.00', '150.00', '2008-08-26', 'C00012', 'A012  ', 'SOD\r'),
('200133', '1200.00', '400.00', '2008-06-29', 'C00009', 'A002  ', 'SOD\r'),
('200132', '4000.00', '2000.00', '2008-08-15', 'C00013', 'A013  ', 'SOD\r');

#mysqldump -u root -p chinook_data > chinook_data_backup.sql;


# Queries to check number of entry/rows in table.
SELECT COUNT(`AGENT_CODE`) FROM `agents`;
SELECT COUNT(`CUST_CODE`) FROM `customer`;
SELECT COUNT(`ORD_NUM`) FROM `orders`;

#query to find if any value is null in given data 
SELECT *
FROM `agents`
WHERE `AGENT_NAME` IS NULL
   OR `WORKING_AREA` IS NULL
   OR `COMMISSION` IS NULL
   OR `PHONE_NO` IS NULL
   OR `COUNTRY` IS NULL;

SELECT *
FROM `customer`
WHERE `CUST_CODE` IS NULL
   OR `CUST_NAME` IS NULL
   OR `CUST_CITY` IS NULL
   OR `WORKING_AREA` IS NULL
   OR `CUST_COUNTRY` IS NULL
   OR `GRADE` IS NULL
   OR `OPENING_AMT` IS NULL
   OR `RECEIVE_AMT` IS NULL
   OR `PAYMENT_AMT` IS NULL
   OR `OUTSTANDING_AMT` IS NULL
   OR `PHONE_NO` IS NULL
   OR `AGENT_CODE` IS NULL;
   
   SELECT *
   FROM `orders`
   WHERE `ORD_NUM` IS NULL 
   OR `ORD_AMOUNT` IS NULL
   OR `ADVANCE_AMOUNT` IS NULL
   OR `ORD_DATE` IS NULL
   OR `CUST_CODE` IS NULL
   OR `AGENT_CODE` IS NULL
   OR `ORD_DESCRIPTION` IS NULL;
   
   #all vairables seems fine but since phone number is varchar it may contains some noise 
    #based on observation we can see the format in agent table for
   select * FROM `agents` LIMIT 3;
   select * FROM `customer` LIMIT 3;
   select `PHONE_NO` FROM `customer`;
   select * from `customer` where `PHONE_NO` LIKE '___-%';
   SELECT * FROM `orders` LIMIT 10;
   
 #INSERT INTO your_table (column1, column2, column3)
#VALUES (COALESCE(value1, default_value1), COALESCE(value2, default_value2), COALESCE(value3, default_value3));
#UPDATE your_table SET column1 = new_value1, column2 = new_value2 WHERE condition;

SELECT `PHONE_NO`,count(*) as count FROM `agents`
GROUP BY `PHONE_NO`
HAVING count(*) >1;

#	Write SQL queries to retrieve the total number of orders, total revenue, and average order value.
SELECT count(`ORD_NUM`) AS `TOTAL NUMBER OF ORDER`,
SUM(`ORD_AMOUNT`) AS `REVENUE`,
AVG(`ORD_AMOUNT`) AS `AVERAGE ORDER VALUE` from `orders`;

#updating country column of agent table and setting it to same as cutomer country 
UPDATE `agents`
JOIN `customer` ON `agents`.`AGENT_CODE` = `customer`.`AGENT_CODE`
SET `agents`.`COUNTRY` = `customer`.`CUST_COUNTRY`;

SELECT * from `agents`;
#-The operations team needs to track the agent who has handled the maximum number of high-grade customers. 
#Write a SQL query to find the agent_name who has the highest count of customers with a grade of 5. 
#Display the agent_name and the count of high-grade customers.

#finding the highest grade based on customer table and order table relation
SELECT MAX(T1.GRADE) FROM CUSTOMER AS T1 
JOIN ORDERS AS T2 ON T1.CUST_CODE = T2.CUST_CODE;

#Write a SQL query to find the agent_name who has the highest count of customers with a grade of 5-->3. 
SELECT `T2`.`AGENT_NAME`,`T2`.`AGENT_CODE`,`T3`.`CUST_NAME`,`T3`.`GRADE`
 FROM `orders` AS `T1`
 JOIN `agents` as `T2` ON `T1`.`AGENT_CODE` = `T2`.`AGENT_CODE`
 JOIN `CUSTOMER` AS `T3` ON `T1`.`CUST_CODE` = `T3`.`CUST_CODE`
 WHERE `T3`.`GRADE` IN (SELECT MAX(`GRADE`) FROM `CUSTOMER`)
 GROUP BY `T2`.`AGENT_CODE`,`T2`.`AGENT_NAME`,`T3`.`CUST_NAME`,`T3`.`GRADE`;

 #Display the agent_name and the count of high-grade customers.
 SELECT `T2`.`AGENT_NAME`, count(*) AS `HIGH_GRADE_CUST_COUNT`
 FROM `orders` AS `T1`
 JOIN `agents` AS `T2` ON `T1`.`AGENT_CODE` = `T2`.`AGENT_CODE`
 JOIN `customer` AS `T3` ON `T1`.`CUST_CODE` = `T3`.`CUST_CODE`
 WHERE `T3`.`GRADE` IN (SELECT MAX(`GRADE`) FROM `CUSTOMER`)
 GROUP BY `T2`.`AGENT_CODE`,`T2`.`AGENT_NAME`;
 
 #Write a SQL query to find the agent_name who has the highest count of customers with a grade of 5. 
 SELECT `T2`.`AGENT_NAME`,count(*) AS `HIGH_GRADE_CUST_COUNT`
 FROM `orders` AS `T1`
 JOIN `agents` AS `T2` ON `T1`.`AGENT_CODE` = `T2`.`AGENT_CODE`
 JOIN `customer` AS `T3` ON `T1`.`CUST_CODE` = `T3`.`CUST_CODE`
 WHERE `T3`.`GRADE` IN (SELECT MAX(`GRADE`) FROM `CUSTOMER`)
 GROUP BY `T2`.`AGENT_CODE`,`T2`.`AGENT_NAME`
 ORDER BY COUNT(*) DESC
 LIMIT 1;
 
 
 #-	The company wants to identify the most active customer cities in terms of the total order amount.
 # Write a SQL query to find the top 3 customer cities with the highest total order amount.
 # Include cust_city and total_order_amount in the output.
 SELECT SUM(`T1`.`ORD_AMOUNT`) AS `TOTAL_ORDER_AMOUNT`,`T2`.`CUST_CITY` 
 FROM `orders` AS `T1`
 JOIN `customer` as `T2` ON `T1`.`CUST_CODE` = `T2`.`CUST_CODE`
 GROUP BY `T2`.`CUST_CITY`
 ORDER BY SUM(`T1`.`ORD_AMOUNT`) DESC
 LIMIT 3;
 
 #Segment 3: Customer Analysis:
 #Calculate the total number of customers.
 SELECT COUNT(`CUST_CODE`) FROM `customer`;
 
#Identify the top-spending customers based on their total order value.
SELECT `T1`.`CUST_CODE`,`T1`.`CUST_NAME`,SUM(`T2`.`ORD_AMOUNT`) AS `TOTAL ORDER VALUE`
FROM `customer` AS `T1`
JOIN `orders` AS `T2` ON `T1`.`CUST_CODE` = `T2`.`CUST_CODE`
GROUP BY `T1`.`CUST_CODE`,`T1`.`CUST_NAME`
ORDER BY `TOTAL ORDER VALUE` DESC
LIMIT 10;

#-	Analyse customer retention by calculating the percentage of repeat customers.

#cutomers having orders more than once
SELECT COUNT(`ORD_NUM`) AS `COUNT OF ORDER`,`CUST_CODE` FROM
ORDERS
GROUP BY CUST_CODE
HAVING COUNT(ORD_NUM) >1;

SELECT (`repeat_customers` * 100.0) / `total_customers` AS `repeat_customer_percentage`
FROM (
    SELECT COUNT(DISTINCT `cust_code`) AS `repeat_customers`
    FROM `orders`
    WHERE `cust_code` IN (
        SELECT `cust_code`
        FROM `orders`
        GROUP BY `cust_code`
        HAVING COUNT(*) > 1
    )
) AS `REPEAT_CUSTOMER`,
(
    SELECT COUNT(DISTINCT `cust_code`) AS `total_customers`
    FROM `customer`
) AS `TOTAL_CUSTOMER`;

#-	Find the name of the customer who has the maximum outstanding amount from every country. 
SELECT `CUST_NAME`,`CUST_COUNTRY`,SUM(`OUTSTANDING_AMT`) AS `OUTSTANDING AMT`
FROM `customer`
group by `CUST_COUNTRY`,`CUST_CODE`
ORDER BY `OUTSTANDING AMT` DESC
LIMIT 1;

#-	Write a SQL query to calculate the percentage of customers in each grade category (1 to 5). 

select count(cust_code)*100/(select count(distinct cust_code) from customer),grade from customer
group by grade;

#Segment 4: Agent Performance Analysis
#-	Company wants to provide a performance bonus to their best agents based on the maximum order amount. 
#Find the top 5 agents eligible for it. 

select sum(t1.ord_amount),t1.agent_code,t2.agent_name from 
orders as t1
join agents as t2 on t1.agent_code = t2.agent_code
group by t1.agent_code
order by sum(t1.ord_amount) desc
limit 5;
#select agent_name from agents where agent_code='A010';

#-	The company wants to analyse the performance of agents based on the number of orders they have handled. 
#Write a SQL query to rank agents based on the total number of orders they have processed.
 #Display agent_name, total_orders, and their respective ranking.
select count(T1.ord_num) as `NUMBER OF ORDER`,
T1.agent_code,T2.agent_name,
row_number() over (order by COUNT(T1.ord_num) DESC) as `RANK` from 
orders as T1
LEFT JOIN agents as T2 on T1.agent_code = T2.agent_code 
group by agent_code
order by count(ord_num) desc;
select agent_code,agent_name 
from agents
order by agent_code desc ;

select agent_code from orders
order by agent_code desc;


#-	Company wants to change the commission for the agents, basis advance payment they collected. 
#Write a sql query which creates a new column updated_commision on the basis below rules.
#○	If the average advance amount collected is less than 750, there is no change in commission.
#○	If the average advance amount collected is between 750 and 1000 (inclusive), 
#the new commission will be 1.5 times the old commission.
#○	If the average advance amount collected is more than 1000, the new commission will be 2 times the old commission.


ALTER TABLE agents ADD updated_commission DECIMAL(10,2) DEFAULT 0;

UPDATE agents
INNER JOIN (
    SELECT agent_code, AVG(advance_amount) AS avg_advance_amount
    FROM orders
    GROUP BY agent_code
) AS Calculated_details
ON agents.agent_code = Calculated_details.agent_code
SET agents.updated_commission = CASE
    WHEN Calculated_details.avg_advance_amount < 750 THEN agents.commission
    WHEN Calculated_details.avg_advance_amount BETWEEN 750 AND 1000 THEN agents.commission * 1.5
    ELSE agents.commission * 2
    END;
   select * from agents;
ALTER TABLE agents
DROP COLUMN updated_commission;

#Segment 5: SQL Tasks
#-	Add a new column named avg_rcv_amt in the table customers which contains the average receive amount for every country.
# Display all columns from the customer table along with the avg_rcv_amt column in the last.

ALTER TABLE `customer` ADD `AVG_RCV_AMT` decimal(10,2) default 0; 
UPDATE `customer` 
INNER JOIN(
    SELECT CUST_COUNTRY, AVG(RECEIVE_AMT) AS avg_rcv_amt
    FROM customer
    GROUP BY CUST_COUNTRY
) a ON CUSTOMER.CUST_COUNTRY = a.CUST_COUNTRY
SET `customer`.`AVG_RCV_AMT` = `a`.`AVg_Rcv_AMT`;

SELECT * from `customer`;

SELECT AVG(RECEIVE_AMT) 
FROM CUSTOMER 
GROUP BY CUST_COUNTRY;

#-	Write a sql query to create and call a UDF named avg_amt to return the average outstanding amount
# of the customers which are managed by a given agent.
 #Also, call the UDF with the agent name ‘Mukesh’.
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION avg_amt(agent_name VARCHAR(255))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE agent_code varchar(6);
    DECLARE avg_outstanding DECIMAL(10,2);
    
    SELECT agents.agent_code INTO agent_code
    FROM agents
    WHERE agents.agent_name = agent_name;
    
    SELECT AVG(customer.outstanding_amt) INTO avg_outstanding
    FROM customer
    WHERE customer.agent_code = agent_code;
    
    RETURN avg_outstanding;
END$$
DELIMITER ;

SELECT avg_amt('Mukesh');

CREATE PROCEDURE cust_detail(IN grade INT)
BEGIN
    SELECT *
    FROM customer
    WHERE GRADE = grade
END;

DROP FUNCTION IF EXISTS avg_amt;
select * from agents
where agent_name = 'mukesh';
