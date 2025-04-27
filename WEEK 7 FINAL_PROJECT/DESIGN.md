# Design Document

By Harsh Kumar

Video overview: <https://youtu.be/rT44y30mVFI>

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?
The purpose of the WellSpring Café database is to efficiently manage and analyze operations of a multi‑city healthy café chain. It handles customer profiles, employee details, table reservations, menu item sales, supplier relationships, and financial performance — enabling streamlined operations, data‑driven decision‑making, and exceptional customer experiences.

* Which people, places, things, etc. are you including in the scope of your database?
This database includes:

cafe locations – Basic information about each café location, including branch name, city, address, contact details (phone, email), and the city it belongs to.
Employees Table: It should give basic information (name, gender, contact, DOB, address), role of the employee, salary details, date of hiring, the café location they are assigned to, and current employment status (active/resigned/on leave).
Cities – City names and their respective states, including city name and state name.
Roles – Job roles within the organization (e.g., Chef, Server, Manager, Supervisor).
Cafe_Financials – Monthly revenue and expenses for each café branch, including year-wise data.
Customers – Basic customer details, contact information, membership, and their associated city ID.
Reservation – Customer ID, reservation date & time, number of people, branch ID, special requests (if any).
Membership – Customer's membership details, start date, expiry date, status, membership fee, and renewal date
Employment Status – Tracks employee status (Active, On Leave, Resigned, Retired) with references to the employee ID.
Products – Contains product details including ID, name, price, and category.
Suppliers – Supplier details and their city
Raw Materials – Contains raw material details including ID and name.
Raw Material Sourcing – Supplier and ingredient relationship, tracking which supplier provides which raw material.
Orders – Records of each order placed, including café location ID, customer ID, amount, and date & time.
Ordered_Products – Details of products included in each order, including order ID, product ID, and quantity.
Feedback – Customer reviews linked to both specific orders and products for detailed feedback analysis


* Which people, places, things, etc. are *outside* the scope of your database?

No information about home deliveries — Only in-café orders, reservations, and direct takeaways are tracked. Home deliveries via third-party apps like Zomato, Swiggy, etc., are excluded.
No management of internal employee hierarchy — The system does not store relationships like supervisors and subordinates, or detailed management structures within the café teams.
No tracking of café branch infrastructure or physical assets — Data regarding kitchen equipment, interior design, maintenance, or other infrastructure is not included.
No predictive analysis for café expansion or location selection — Decisions related to new café locations or franchise expansion are handled outside the database, with no AI/analytics capabilities to forecast or recommend potential sites.
No ability for customers to update personal details online — Once registered, customers cannot modify their city, contact details, or other profile information independently. All updates must be manually processed by staff.
No recording of employee certifications or professional development — The system tracks only the job roles and employment status of employees, but does not store details like certifications, training history, or skill assessments.
No management of customer complaints or detailed feedback beyond product reviews — While the system includes feedback for specific orders and products, it does not track customer complaints, detailed service reviews, or broader customer sentiment analysis.
No loyalty program or advanced customer engagement features — The database only supports basic membership types and discounts, with no features for points-based systems, gamification, or behavioral tracking.
No nutritional information or recipe management — Recipes, ingredient breakdowns, nutritional information, or calorie counts for menu items are not stored within the system.



## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?
A user should be able to:

User Management: Users should be able to manage employee records (personal details, roles, salary, status), customer details (contact info, membership), and reservation data (date, time, and special requests).
Financial Management: Users should be able to record and track monthly revenues, expenses, and profits for each café location.
Order Management: Users should be able to manage customer orders (order ID, product, quantity, café location) and link them to specific products in the order.
Product Management: Users should be able to manage product details (ID, name, price, category) and link them to orders.
Inventory Management: Users should be able to track raw materials (ID, name) and link them to suppliers (supplier ID) and their sourcing relationships.
Feedback Management: Users should be able to collect and manage customer feedback (reviews) on products and orders, allowing improvements to be made.
Membership Management: Users should be able to manage customer memberships, including membership start and expiry dates, status, and renewal details.
Employment Status Management: Users should be able to manage employees' current employment status (active, resigned, on leave, retired).
Branch Management: Users should be able to manage café locations (branch name, city, address, contact details).
Reservation Management: Users should be able to handle customer reservations, including booking details (date, time, branch, special requests).


* What's beyond the scope of what a user should be able to do with your database?
A user should not be able to:

User Management: Users cannot modify system settings or access personal admin data beyond their assigned roles.
Financial Management: Users cannot predict or forecast future revenues/expenses, nor can they make direct changes to historical financial records.
Order Management: Users cannot cancel or modify orders once they’ve been completed and processed; only new orders can be entered.
Product Management: Users cannot delete products permanently from the system; only inactive status can be applied.
Inventory Management: Users cannot track or manage raw material inventory levels directly; only basic sourcing data is available.
Feedback Management: Users cannot manipulate or delete feedback data once submitted, ensuring unbiased and transparent reviews.
Membership Management: Users cannot transfer memberships between customers, nor can they manually change the status or renewal dates outside of predefined conditions.
Employment Status Management: Users cannot modify past employment statuses or alter historical employment records.
Branch Management: Users cannot create or delete café locations; only modifications to existing branches are allowed.
Reservation Management: Users cannot change reservation details after confirmation unless approved by management, preventing unauthorized changes.

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?

cafe_locations Table: The café locations table includes:

id – Specifies the unique ID for each café location as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
name – Specifies the name of the café location as TEXT. This field will store the name of the café.
city_id – Specifies the city where the café is located. This column is a FOREIGN KEY referencing the id in the cities table, and it will be of type INTEGER.
address – Specifies the physical address of the café as TEXT. It will store the full address of the café.
phone_number – Specifies the phone number of the café as TEXT (since phone numbers may include special characters like dashes or parentheses).
email – Specifies the email address of the café as TEXT.
total_employees – Specifies the total number of employees at the café as INTEGER.
opening_date – Specifies the date the café was opened as TEXT, in the format YYYY-MM-DD.
opening_time – Specifies the time the café opens as TEXT, in the format HH:MM.
closing_time – Specifies the time the café closes as TEXT, in the format HH:MM.
All columns in the Café Locations table are required, hence the NOT NULL constraint is applied.


Suppliers Table: The suppliers table includes:

id – Specifies the unique ID for each supplier as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
supplier_name – Specifies the name of the supplier as TEXT. This field will store the name of the supplier.
address – Specifies the address of the supplier as TEXT. It will store the full address of the supplier.
city_id – Specifies the city where the supplier is located. This column is a FOREIGN KEY referencing the id in the cities table, and it will be of type INTEGER.
phone_number – Specifies the phone number of the supplier as TEXT (since phone numbers may include special characters like dashes or parentheses).
All columns in the Suppliers table are required, hence the NOT NULL constraint is applied.


Raw Materials Table: The raw materials table includes:

id – Specifies the unique ID for each raw material as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
name – Specifies the name of the raw material as TEXT. This field will store the name of the raw material.
Both columns in the Raw Materials table are required, hence the NOT NULL constraint is applied.

raw_material_sourcing Table Includes:

id – Specifies a unique identifier for each raw material sourcing record as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
supplier_id – Specifies the ID of the supplier that is sourcing the raw material. This column is a FOREIGN KEY referencing the id in the suppliers table, and it will be of type INTEGER.
raw_material_id – Specifies the ID of the raw material being sourced. This column is a FOREIGN KEY referencing the id in the raw_materials table, and it will be of type INTEGER.
All columns in the raw_material_sourcing table are required, hence the NOT NULL constraint is applied.


products Table Includes:

id – Specifies a unique identifier for each product as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
product_name – Specifies the name of the product as TEXT. It will store the name of the product.
price – Specifies the price of the product as NUMERIC. This field will store the price value, which can be a decimal number.
category – Specifies the category of the product as TEXT. It will store the category under which the product falls (e.g., smoothie, coffee, tea, baked goods, etc.).
All columns in the products table are required, hence the NOT NULL constraint is applied.

roles Table Includes:

id – Specifies a unique identifier for each role as INTEGER. This column has the PRIMARY KEY constraint applied. It will automatically increment with the AUTOINCREMENT keyword.
role – Specifies the name of the role as TEXT. It will store the name of the role within the organization (e.g., Manager, Barista, Chef, etc.).
All columns in the roles table are required, hence the NOT NULL constraint is applied.


employees Table Includes:

id – Specifies a unique identifier for each employee as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to generate unique values automatically.
first_name – Specifies the employee's first name as TEXT. This is a required field.
last_name – Specifies the employee's last name as TEXT. This is also a required field.
dob – Specifies the date of birth of the employee as TEXT, stored in the format YYYY-MM-DD.
gender – Specifies the gender of the employee as TEXT. You may consider using a CHECK constraint to limit this to predefined values like 'Male', 'Female', 'Other'.
email – Specifies the email address of the employee as TEXT.
phone_number – Specifies the phone number of the employee as TEXT (stored as TEXT to support different formats).
address – Specifies the full address of the employee as TEXT.
salary – Specifies the employee's salary as NUMERIC.
cafe_location_id – Specifies the location (branch) the employee works at. This is a FOREIGN KEY referencing the id column in the cafe_locations table.
role_id – Specifies the role of the employee. This is a FOREIGN KEY referencing the id column in the roles table.
hired_date – Specifies the date the employee was hired as TEXT in YYYY-MM-DD format.
All columns are required, hence the NOT NULL constraint is applied where applicable.


cafe_financials Table Includes:

id – Specifies a unique identifier for each financial record as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to automatically generate values.
cafe_location_id – Specifies the location (branch) the financial data belongs to. This is a FOREIGN KEY referencing the id column in the cafe_locations table.
yearly_revenue – Specifies the total revenue generated by the branch in a year. This is stored as NUMERIC.
yearly_expenses – Specifies the total expenses incurred by the branch in a year. This is also stored as NUMERIC.
year – Specifies the year for which this financial data is recorded, stored as INTEGER (e.g., 2023, 2024).
All columns are required, hence the NOT NULL constraint is applied where applicable.


customers Table Includes:

id – Specifies the unique identifier for each customer as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to auto-increment values.
first_name – Stores the customer’s first name as TEXT.
last_name – Stores the customer’s last name as TEXT.
gender – Stores the gender of the customer as TEXT (e.g., 'Male', 'Female', 'Other').
address – Specifies the full address of the customer as TEXT.
email – Stores the email address of the customer as TEXT.
phone_number – Stores the phone number of the customer as TEXT to accommodate any formatting (e.g., dashes, spaces).
membership_id – Indicates whether the customer holds a membership or not. Stored as TEXT, and can be values like 'Yes' or 'No'.
All columns are required; hence the NOT NULL constraint is applied where applicable.


orders Table Includes:

id – Specifies the unique identifier for each order as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to auto-increment values.
cafe_location_id – Specifies the cafe where the order was placed. This is a FOREIGN KEY referencing the id in the cafe_locations table. Stored as INTEGER.
customers_id – Refers to the customer who placed the order. This is a FOREIGN KEY referencing the id in the customers table. Stored as INTEGER.
price – Indicates the total amount of the order. Stored as NUMERIC to support decimals.
datetime – Captures the exact date and time when the order was placed. Stored as TEXT in the format YYYY-MM-DD HH:MM:SS.
All columns are required; hence the NOT NULL constraint is applied where applicable.


ordered_products Table Includes:

id – Specifies the unique identifier for each record in the table as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to auto-increment values.
order_id – Specifies the ID of the order this product belongs to. This is a FOREIGN KEY referencing the id column in the orders table. Stored as INTEGER.
product_id – Specifies the ID of the product that was ordered. This is a FOREIGN KEY referencing the id column in the products table. Stored as INTEGER.
quantity – Specifies how many units of the product were ordered. Stored as INTEGER and required for accurate order tracking.
All columns are required; hence the NOT NULL constraint is applied where applicable.

feedback Table Includes:

id – Specifies the unique identifier for each feedback entry as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to auto-increment values.
customer_id – Specifies the ID of the customer providing the feedback. This is a FOREIGN KEY referencing the id column in the customers table. Stored as INTEGER.
order_id – Specifies the ID of the order related to the feedback. This is a FOREIGN KEY referencing the id column in the orders table. Stored as INTEGER.
product_id – Specifies the ID of the product the feedback is about. This is a FOREIGN KEY referencing the id column in the products table. Stored as INTEGER.
review – Specifies the customer’s review as TEXT. This field can store free-form feedback about the product or order experience.
All columns are required; hence the NOT NULL constraint is applied where applicable.

reservations Table Includes:

id – Specifies the unique ID for each reservation as INTEGER. This column has the PRIMARY KEY constraint applied and uses the AUTOINCREMENT keyword to auto-increment values.
customer_id – Specifies the ID of the customer making the reservation. This is a FOREIGN KEY referencing the id column in the customers table. Stored as INTEGER.
datetime – Specifies the date and time of the reservation. Stored as TEXT in the format YYYY-MM-DD HH:MM.
cafe_location_id – Specifies the cafe location for the reservation. This is a FOREIGN KEY referencing the id column in the cafe_locations table. Stored as INTEGER.
status – Specifies the reservation status as TEXT. This can store values like 'Confirmed', 'Cancelled', or 'Completed'.
number_of_people – Specifies how many people the reservation is for. Stored as INTEGER.
special_request_if_any – Specifies any additional requests made by the customer. Stored as TEXT. This field can be left NULL if there are no special requests.
All mandatory fields will have the NOT NULL constraint applied except special_request_if_any, which is optional.

memberships Table Includes:

id – Specifies the unique ID for each membership record as INTEGER. This column is the PRIMARY KEY and uses AUTOINCREMENT to automatically generate sequential IDs.
customer_id – Specifies the ID of the customer who holds the membership. This is a FOREIGN KEY referencing the id column in the customers table. Stored as INTEGER.
start_date – Specifies the start date of the membership. Stored as TEXT in the format YYYY-MM-DD.
expiry_date – Specifies the expiry date of the membership. Stored as TEXT in the format YYYY-MM-DD.
status – Specifies the current status of the membership. Stored as TEXT. You can use values like 'Active', 'Expired', or 'Inactive'.
membership_fee – Specifies the fee paid for the membership. Stored as NUMERIC.
renewal_date – Specifies the date for membership renewal, if applicable. Stored as TEXT in the format YYYY-MM-DD.
All fields are required unless the nature of the data is optional (like renewal date).


employment_status Table Includes:

id – Specifies the unique ID for each employment status record as INTEGER. This column is the PRIMARY KEY and uses AUTOINCREMENT to automatically generate sequential IDs.
employees_id – Specifies the ID of the employee whose employment status is being recorded. This is a FOREIGN KEY referencing the id column in the employees table. Stored as INTEGER.
status – Specifies the current employment status of the employee. Stored as TEXT. You can use values like 'Active', 'On Leave', 'Terminated', etc.
All fields are required unless the nature of the data is optional.


cities Table Includes:

id – Specifies the unique ID for the city record as INTEGER. This column is the PRIMARY KEY and uses the AUTOINCREMENT keyword to automatically generate sequential IDs.
name – Specifies the name of the city as TEXT. It will store the city name.
state – Specifies the state where the city is located as TEXT. It will store the name of the state.
All fields are required unless stated otherwise.



* What attributes will those entities have?

✅ Cities: The cities table includes:

id – A unique identifier for each city. It’s of type INTEGER and is the PRIMARY KEY with AUTOINCREMENT.
name – The name of the city as TEXT.
state – The state to which the city belongs, stored as TEXT.

✅ Cafe_Locations: The cafe_locations table includes:

id – Unique ID for each café location. It’s an INTEGER PRIMARY KEY AUTOINCREMENT.
name – Name of the café branch as TEXT.
city_id – A foreign key of type INTEGER referencing cities(id) indicating the city of the café.
address – Full address of the café, stored as TEXT.
phone_number – Phone number of the café, stored as TEXT for format flexibility.
email – Contact email as TEXT.
total_employees – Number of employees at the café, stored as INTEGER.
opening_date – The date the café opened, stored as TEXT.
opening_time – Opening time of the café, stored as TEXT.
closing_time – Closing time of the café, stored as TEXT.

✅ Suppliers: The suppliers table includes:

id – Unique supplier ID (INTEGER, PRIMARY KEY, AUTOINCREMENT).
supplier_name – Name of the supplier (TEXT).
address – Supplier’s address (TEXT).
city_id – City of the supplier (INTEGER, foreign key referencing cities(id)).
phone_number – Contact number stored as TEXT.

✅ Raw_Materials: The raw_materials table includes:

id – Unique ID for the raw material (INTEGER PRIMARY KEY AUTOINCREMENT).
name – Name of the raw material (TEXT).

✅ Raw_Material_Sourcing: The raw_material_sourcing table includes:

id – Unique ID for each sourcing record (INTEGER, PRIMARY KEY, AUTOINCREMENT).
supplier_id – Foreign key (INTEGER) referencing suppliers(id).
raw_material_id – Foreign key (INTEGER) referencing raw_materials(id).

✅ Products: The products table includes:

id – Unique product ID (INTEGER PRIMARY KEY AUTOINCREMENT).
product_name – Name of the product (TEXT).
price – Price of the product (NUMERIC).
category – Category the product belongs to (e.g., smoothie, salad), stored as TEXT.

✅ Roles: The roles table includes:

id – Unique ID for each role (INTEGER PRIMARY KEY AUTOINCREMENT).
role – Name of the role (e.g., chef, server), stored as TEXT.

✅ Employees: The employees table includes:

id – Unique employee ID (INTEGER PRIMARY KEY AUTOINCREMENT).
first_name – First name of the employee (TEXT).
last_name – Last name of the employee (TEXT).
dob – Date of birth in YYYY-MM-DD format (TEXT).
gender – Gender (TEXT) with constraint: only 'Male', 'Female', or 'Other'.
email – Email ID of the employee (TEXT).
phone_number – Contact number (TEXT).
address – Residential address (TEXT).
salary – Salary of the employee (NUMERIC).
cafe_location_id – Foreign key (INTEGER) referencing cafe_locations(id).
role_id – Foreign key (INTEGER) referencing roles(id).
hired_date – Hiring date (TEXT, format: YYYY-MM-DD).

✅ Employment_Status: The employment_status table includes:

id – Unique ID for each status record (INTEGER PRIMARY KEY AUTOINCREMENT).
employees_id – Foreign key referencing employees(id), stored as INTEGER.
status – Employment status (TEXT) – must be 'Active', 'On Leave', or 'Terminated'.

✅ Cafe_Financials: The cafe_financials table includes:

id – Unique financial record ID (INTEGER PRIMARY KEY AUTOINCREMENT).
cafe_location_id – Foreign key (INTEGER) referencing cafe_locations(id).
yearly_revenue – Annual revenue (NUMERIC).
yearly_expenses – Annual expenses (NUMERIC).
year – Year for the financial record (INTEGER).

✅ Customers: The customers table includes:

id – Unique ID for each customer (INTEGER PRIMARY KEY AUTOINCREMENT).
first_name – First name (TEXT).
last_name – Last name (TEXT).
gender – Gender of the customer (TEXT).
address – Address (TEXT).
email – Email address (TEXT).
phone_number – Contact number (TEXT).
membership – Whether customer has a membership – must be either 'Yes' or 'No'.

✅ Memberships: The memberships table includes:

id – Unique membership ID (INTEGER PRIMARY KEY AUTOINCREMENT).
customer_id – Foreign key to customers(id) (INTEGER).
start_date – Membership start date (TEXT).
expiry_date – Membership expiry date (TEXT).
status – Status (TEXT) – must be 'Active', 'Expired', or 'Inactive'.
membership_fee – Membership fee (NUMERIC).
renewal_date – Date of renewal (TEXT).

✅ Orders: The orders table includes:

id – Unique order ID (INTEGER PRIMARY KEY AUTOINCREMENT).
cafe_location_id – Foreign key (INTEGER) referencing cafe_locations(id).
customers_id – Foreign key (INTEGER) referencing customers(id).
price – Total amount of the order (NUMERIC).
datetime – Order timestamp (TEXT).

✅ Ordered_Products: The ordered_products table includes:

id – Unique ID (INTEGER PRIMARY KEY AUTOINCREMENT).
order_id – Foreign key (INTEGER) referencing orders(id).
product_id – Foreign key (INTEGER) referencing products(id).
quantity – Quantity of the product ordered (INTEGER).

✅ Feedback: The feedback table includes:

id – Unique feedback ID (INTEGER PRIMARY KEY AUTOINCREMENT).
customer_id – Foreign key referencing customers(id) (INTEGER).
order_id – Foreign key referencing orders(id) (INTEGER).
product_id – Foreign key referencing products(id) (INTEGER).
review – Review text (TEXT).

✅ Reservations: The reservations table includes:

id – Unique reservation ID (INTEGER PRIMARY KEY AUTOINCREMENT).
customer_id – Foreign key referencing customers(id) (INTEGER).
datetime – Date and time of the reservation (TEXT).
cafe_location_id – Foreign key referencing cafe_locations(id) (INTEGER).
status – Reservation status (TEXT).
number_of_people – Number of people included in the reservation (INTEGER).
special_request_if_any – Any special request made by the customer (TEXT).

* Why did you choose the types you did?

🔢 INTEGER: Used when we expect whole numbers or IDs.

For all id fields → Because IDs are best represented as integers and are often auto-incremented.
For things like:
city_id, supplier_id, cafe_location_id, role_id, product_id, etc. → These are foreign keys, and integers ensure faster joins and indexing.
quantity, total_employees, number_of_people, year → These are countable values (you can’t have 2.5 people 😅).

🔡 TEXT: Used for names, addresses, descriptions, and dates stored as strings.

For fields like name, address, email, phone_number, gender, review, role, status, category etc. → These are clearly string-based data.
Even datetime, dob, opening_time, etc., are stored as TEXT to keep flexibility across platforms (e.g., SQLite stores dates as text).
gender, membership, status fields are stored as TEXT so we can later apply CHECK constraints to allow only specific values like 'Male', 'Female', 'Other'.

✅ Why not DATE or TIME?: In SQLite (which many projects use initially), TEXT is a recommended format for dates/times unless we plan to do complex date arithmetic — and it keeps things simple.

💰 NUMERIC: Used for monetary values or decimal-based data.

For fields like salary, price, yearly_revenue, yearly_expenses, membership_fee → these can have decimals, and you want accurate precision.
NUMERIC allows decimal values and works well with arithmetic operations.

* Why did you choose the constraints you did?

I chose the constraints to ensure data integrity, consistency, and accuracy across the entire database. Each constraint serves a specific purpose to make the system more robust, maintainable, and reflective of real-world operations. Here's the reasoning behind each:

🔸 PRIMARY KEY
Uniquely identifies each record in a table (e.g., employee ID, product ID).

Prevents duplication and allows safe referencing across tables.

🔸 FOREIGN KEY
Maintains referential integrity between related tables.

Example: employee.cafe_location_id references cafe_locations(id) so every employee must be assigned to a valid cafe.

Added ON DELETE CASCADE / ON UPDATE CASCADE to ensure changes or deletions reflect correctly across linked tables.

🔸 NOT NULL
Ensures that critical fields are never left empty.

Example: Names, prices, and email addresses must always be filled, as they’re essential to operations.

🔸 UNIQUE
Prevents duplicate entries where values must be distinct.

Example: Email addresses in the employees and customers tables must be unique to avoid confusion.

🔸 CHECK
Enforces valid value ranges or formats.

Example:

gender should only be ‘Male’, ‘Female’, or ‘Other’.

quantity and price must be greater than 0.

Helps catch input errors before they corrupt data.

🔸 DEFAULT
Provides sensible default values where appropriate.

Example: status fields default to 'Active', ensuring records have meaningful initial values even if not explicitly set.


### Relationships

In this section you should include your entity relationship diagram and describe the relationships between the entities in your database.

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

1. Indexes
We strategically created indexes based on the most frequent operations such as WHERE, JOIN, GROUP BY, and ORDER BY clauses. These indexes were designed to improve data retrieval speed and minimize table scan time.

a) Indexes for WHERE Clauses
These were created on fields frequently filtered in SELECT queries:

customers(email)
customers(gender)
orders(price)
feedback(product_id)

b) Indexes for JOIN Operations
To speed up join queries between high-traffic tables:

orders(customers_id)
employment_status(employees_id)
memberships(customer_id)

c) Indexes for GROUP BY / ORDER BY
Optimized sorting and grouping operations:

orders(datetime)
reservations(number_of_people)
products(price)

d) Indexes for High Cardinality Columns
Indexed fields with unique or nearly unique values to enhance lookup speed:

customers(email)
customers(phone_number)
employees(first_name)

e) Indexes for Frequently Searched Fields
Created for columns frequently used in search or filter queries:

feedback(review)
memberships(status)
reservations(status)

These indexes collectively reduced query time, improved join performance, and enabled smoother analytical operations.

2. Views
To enhance data reusability, abstraction, and reduce query repetition, we created multiple views for pre-aggregated and pre-joined datasets:

a) Customer-Centric Views
customer_order_summary: Total orders and amount spent by each customer.
customers_total_orders_with_total_spendings: Aggregates total orders and overall spend.
customers_total_units_purchased: Total quantity of products purchased per customer.
total_units_bought_by_customers: Focused view filtering high-purchase customers.

b) Membership & Feedback Views
customers_active_memberships: Shows customers with active memberships and their validity.
total_customers_feedback: Counts feedbacks per customer.
top_3_customers: Identifies the highest spenders.

c) Engagement Analytics View
customers_who_placed_order: Identifies customers who placed at least one order.
These views helped modularize business logic, ease reporting, and improve maintainability, all while ensuring data consistency across modules.

Overall Benefit Together, these optimizations significantly:

Reduced data retrieval time.
Improved report generation speed.
Enabled faster analytics and insights.
Streamlined complex joins and aggregations.


## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?

⚠️ Limitations
While the current database design effectively supports core functionalities and allows for efficient querying through the use of views and indexes, it does have some limitations that could impact scalability, flexibility, or data integrity in more advanced use cases.

❌ 1. Lack of Historical Tracking (No Audit Trail)
Our design currently doesn't support tracking historical changes to data, such as updates to customer details, order modifications, or membership status changes.

Limitation: This restricts our ability to perform time-based audits or analyze trends over time.

❌ 2. Absence of Referential Integrity Enforcement in Triggers
Although we’ve implemented basic triggers (e.g., for employment status validation), the system lacks more complex logic to enforce referential integrity in all edge cases.

Limitation: Data inconsistencies could occur if related records are deleted or updated without proper cascading mechanisms.

❌ 3. No Handling of Soft Deletes
There is no mechanism for soft deletes (i.e., marking records as inactive instead of deleting them).

Limitation: Permanent deletions could result in loss of valuable historical data and make recovery difficult.

❌ 4. Static Views – Lack of Parameterized Views or Materialization
Views in the current setup are static and not parameterized. Also, materialized views are not implemented.

Limitation: For large datasets, these views may perform slower over time due to lack of caching or parameter filtering.

❌ 5. Normalization Trade-offs
While normalization reduces redundancy, some tables (like ordered_products or employment_status) involve multiple joins to get a complete picture.

Limitation: This could lead to slightly reduced query performance or complexity in data fetching for reporting tools.

❌ 6. No User Roles or Access Control Mechanism
There is no role-based access system implemented to differentiate between admin, staff, and customer access.

Limitation: In real-world applications, lack of access control can pose serious security and privacy concerns.

❌ 7. Trigger Validation Constraints Can Be Rigid
Some business rules enforced through triggers (e.g., valid employment status) may limit flexibility during bulk operations or testing.

Limitation: This may require temporary deactivation or workarounds, which can compromise system reliability.


* What might your database not be able to represent very well?

❓ What Might the Database Not Represent Very Well?
Despite being functionally strong for current operations, our database design has certain representational limitations that may affect its flexibility or accuracy in more complex real-world scenarios:

❌ 1. Dynamic Business Logic or Changing Rules
Business rules like membership expiry logic, order cancellation policies, or discount strategies are not abstracted or dynamically configurable.

Example: If the membership validity policy changes from 12 months to 6 months, we would need to update hardcoded logic or recalculate expiry dates manually.

❌ 2. Employee Hierarchy and Roles
The current schema does not support multi-level employee roles, designations, or reporting structures (e.g., manager-subordinate relationships).

Limitation: We can’t represent organizational hierarchy or task delegation effectively.

❌ 3. Product Variants and Inventory Tracking
The database does not account for product variants (like size, color) or real-time inventory management.

Limitation: It limits the use of the database in industries like retail or e-commerce where such details are crucial.

❌ 4. Temporal Data Analysis
There's no dedicated design for handling time-series data such as:

Tracking price changes over time

Logging reservation modifications

Monitoring login or activity history

Limitation: This restricts trend analysis or rollback features.

❌ 5. Feedback Sentiment or Ratings Breakdown
The feedback system only stores free-text reviews without structured sentiment data or star ratings.

Limitation: Makes it harder to quantify customer satisfaction or perform NLP-based analysis.

❌ 6. Complex Many-to-Many Relationships
Currently, some potential many-to-many relationships are either simplified or not represented. For example:

A customer attending multiple reservations with guests

Employees handling multiple departments

Limitation: This simplifies reality and can limit advanced querying or accurate reporting.
