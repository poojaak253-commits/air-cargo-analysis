# Air Cargo Analysis (SQL Project)

## Overview
This project analyzes airline passenger, ticket, and route data using SQL to improve customer experience and operational efficiency. It focuses on customer travel patterns, ticket sales, revenue analysis, and flight route optimization through relational database techniques.

---

## Problem Statement
Air Cargo aims to improve customer satisfaction and optimize airline operations by analyzing passenger travel records, ticket purchases, and flight routes. This project uses SQL to generate business insights that support customer management and operational decision-making.

---

## Objectives
- Analyze passenger travel records
- Identify regular customers
- Calculate ticket sales revenue
- Evaluate business class performance
- Analyze flight routes
- Improve query performance using indexing
- Implement views and stored procedures

---

## Database Structure

### customer
Contains customer information including customer ID, name, date of birth, and gender.

### passengers_on_flights
Contains passenger travel details including aircraft, routes, class, flight number, and travel date.

### ticket_details
Contains ticket purchase details including airline brand, ticket price, number of tickets, and aircraft.

### routes
Contains flight route information including origin, destination, aircraft, and travel distance.

---

## Key SQL Concepts Used
- Database and Table Creation
- Data Import (CSV)
- SELECT Queries
- JOINs
- Subqueries
- Aggregate Functions
- GROUP BY
- Window Functions
- Views
- Stored Procedures
- Indexing
- Execution Plan Analysis
- ROLLUP

---

## Key Tasks Performed
- Imported airline datasets into MySQL
- Designed an ER diagram
- Retrieved passenger travel information
- Calculated business class revenue
- Combined customer and ticket information
- Identified Economy Plus passengers
- Used window functions to determine maximum ticket prices
- Optimized queries using indexes
- Examined execution plans
- Calculated ticket revenue using ROLLUP
- Created business class views
- Developed stored procedures for route analysis
- Generated customer-wise ticket purchase summaries
- Calculated average passengers per flight route

---

## Key Insights
- Business class contributes significantly to airline revenue.
- Customer purchase patterns can support personalized offers.
- Indexing improves query performance for route-based searches.
- Flight route analysis helps optimize aircraft allocation.
- SQL analytical functions simplify airline operational reporting.

---

## Technologies Used
- MySQL
- SQL
- ER Diagram

---

## Author
Prepared as part of SQL learning and database analytics practice.

---

## Note
This project is based on an academic dataset provided for learning purposes and demonstrates practical SQL concepts used in airline data analysis.
