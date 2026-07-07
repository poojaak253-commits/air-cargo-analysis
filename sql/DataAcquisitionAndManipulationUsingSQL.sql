CREATE DATABASE  AirCargo1;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,	
first_name VARCHAR(50),	
last_name VARCHAR(50),	
date_of_birth DATE,	
gender CHAR(1)) ;

CREATE TABLE routes(
route_id INT PRIMARY KEY,	
flight_num INT,	
origin_airport VARCHAR(50),	
destination_airport	VARCHAR(50),
aircraft_id VARCHAR(50),	
distance_miles INT); 

CREATE TABLE passengers_on_flights(
passengers_flights_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
aircraft_id	VARCHAR(50),
route_id INT,	
depart VARCHAR(50),
arrival VARCHAR(50),	
seat_num VARCHAR(50),	
class_id VARCHAR(50),	
travel_date DATE,	
flight_num INT,
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id),

FOREIGN KEY (route_id)
REFERENCES routes(route_id));



CREATE TABLE ticket_details(
ticket_details_id INT AUTO_INCREMENT PRIMARY KEY,
p_date DATE,	
customer_id	INT,
aircraft_id	VARCHAR(50),
class_id VARCHAR(50),	
no_of_tickets INT,	
a_code VARCHAR(50),	
Price_per_ticket INT,	
brand VARCHAR(50),
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id));


SELECT * FROM passengers_on_flights;
SELECT * FROM routes;
SELECT * FROM customer;
SELECT * FROM ticket_details;

/* Write a query to display all the passengers who have traveled on routes 01 to 25 from the passengers_on_flights table. */
SELECT * FROM passengers_on_flights
WHERE route_id BETWEEN 1 AND 25;

/* Write a query to identify the number of passengers and total revenue in business class from the ticket_details table. */
SELECT class_id, 
	   COUNT(customer_id) AS num_of_passangers, 
	   SUM(Price_per_ticket * no_of_tickets) AS Total_revenue
FROM ticket_details
WHERE class_id = 'Business'
GROUP BY class_id; 

/* Write a query to display the full name of the customer by extracting the first name and last name from the customer table. */
SELECT CONCAT(first_name, ' ', last_name) AS NAME
FROM customer;

/* Write a query to extract the customers who have registered and booked a ticket from the customer and ticket_details tables. */
SELECT t.customer_id,c.first_name, c.last_name, t.aircraft_id
FROM customer c
JOIN ticket_details t
ON c.customer_id = t.customer_id;

/* Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table.*/
SELECT c.customer_id, c.first_name, c.last_name, t.brand
FROM customer c
JOIN ticket_details t
ON c.customer_id = t.customer_id
WHERE t.brand = 'Emirates';

/* Write a query to identify the customers who have traveled by Economy Plus class using the sub-query on the passengers_on_flights table. */
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
                     FROM passengers_on_flights
                     WHERE class_id = 'Economy Plus');

/* Write a query to determine whether the revenue has crossed 10000 using the IF clause on the ticket_details table.*/
SELECT IF(
		  SUM(Price_per_ticket),
		  'Revenue has crossed 10000', 
          'Revenue has not crossed 10000'
          ) AS Revenue_status
FROM ticket_details;

/* Write a query to find the maximum ticket price for each class using window functions on the ticket_details table. */
SELECT DISTINCT class_id, 
MAX(Price_per_ticket) OVER(PARTITION BY class_id) Max_price
FROM ticket_details;

/* Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table using the 
index.*/
CREATE INDEX rount_index
ON passengers_on_flights(route_id);

SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

/* For route ID 4, write a query to view the execution plan of the passengers_on_flights table. */
EXPLAIN
SELECT *
FROM passengers_on_flights
WHERE route_id = 4;

/* Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using the rollup function.*/ 
SELECT aircraft_id, SUM(Price_per_ticket) AS Total_price
FROM ticket_details
GROUP BY aircraft_id WITH ROLLUP;

/* Write a query to create a view with only business class customers and the airline brand. */
CREATE VIEW businessclass_view AS
SELECT c.customer_id, c.first_name, c.last_name, t.brand
FROM customer c
JOIN ticket_details t
ON c.customer_id = t.customer_id
WHERE t.class_id = 'Business';

SELECT * FROM businessclass_view;

/* Write a query to create a stored procedure that extracts all the details from the routes table where the traveled distance is more than 2000 
miles. */
DELIMITER //
CREATE PROCEDURE route_distance()
BEGIN
SELECT * FROM routes
WHERE distance_miles > 2000;
END //
DELIMITER ;
CALL route_distance;
 
/* Using GROUP BY, determine the total number of tickets purchased by each customer and the total price paid. */
SELECT customer_id, SUM(Price_per_ticket) as Total_price
FROM ticket_details
GROUP BY customer_id;

/* Calculate the average number of passengers per flight route.*/ 
WITH avg_no_customers AS(
SELECT route_id, count(customer_id) as count_customers
FROM passengers_on_flights
GROUP BY route_id)
SELECT AVG(count_customers) as average_number_of_passengers
FROM avg_no_customers;









































































































































































