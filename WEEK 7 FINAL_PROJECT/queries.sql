-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find the names (first and last) and email of all female customers.


select first_name, last_name, email from customers
    where gender = "Female"
;


--Find the names and phone numbers of customers who have a membership.

select first_name, last_name, phone_number from customers
    where membership = "Yes"
;

--List all product names and their prices that cost more than 150.

select product_name, price from products
    where price > 150
;

--Find the names of employees who are in the "Manager" position.

select first_name, last_name, role from employees
    join roles on roles.id = employees.role_id
    where role like "%manager%"
;

--Show the full name (first and last) and status of all reservations that are currently pending.

select first_name, last_name, status from customers
    Join reservations on reservations.customer_id = customers.id
    where status = "Pending"
;

--List the full names of employees along with the name of the cafe they work at.

select first_name, last_name, cafe_locations.name as cafe_name from employees
    join cafe_locations on cafe_locations.id = employees.cafe_location_id
;

--Write a query to get the first name, last name, and the product names of all the customers who have placed orders.
--Include the cafe location name where the order was placed.

select first_name, last_name, product_name, cafe_locations.name as cafe_name from customers
    join orders on orders.customers_id = customers.id
    join cafe_locations on cafe_locations.id = orders.cafe_location_id
    join ordered_products on ordered_products.order_id = orders.id
    join products on products.id = ordered_products.product_id
;

-- List all employees along with their role names and current employment status.

select first_name, last_name, roles.role as role, employment_status.status as employment_status from employees
    join roles on roles.id = employees.role_id
    join employment_status on employment_status.employees_id = employees.id
;

--Write a query to get the customer's first name, last name, the review they gave, and the product name they reviewed.

select first_name, last_name, review, product_name from customers
    join feedback on feedback.customer_id = customers.id
    join products on products.id = feedback.product_id
;


--Write a query to display the names of all suppliers and the raw materials they provide.

select suppliers.supplier_name as suppliers, raw_materials.name as raw_materials from suppliers
    join raw_material_sourcing on raw_material_sourcing.supplier_id = suppliers.id
    join raw_materials on raw_materials.id = raw_material_sourcing.raw_material_id
;


