-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Represents the cafe_locations table

CREATE TABLE cafe_locations (
    id INTEGER,
    name TEXT NOT NULL,
    city_id INTEGER NOT NULL,
    address TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email TEXT NOT NULL,
    total_employees INTEGER NOT NULL,
    opening_date TEXT NOT NULL,
    opening_time TEXT NOT NULL,
    closing_time TEXT NOT NULL,
    primary key ("id"),
    FOREIGN KEY("city_id") REFERENCES cities("id")
);

-- Represents the suppliers table

CREATE TABLE suppliers (
    id INTEGER,
    supplier_name TEXT NOT NULL,
    address TEXT NOT NULL,
    city_id INTEGER NOT NULL,
    phone_number TEXT NOT NULL,
    primary key ("id"),
    FOREIGN KEY("city_id") REFERENCES cities("id")
);

-- Represents the raw_materials table

CREATE TABLE raw_materials (
    id INTEGER ,
    name TEXT NOT NULL,
    primary key ("id")
);

-- Represents the raw_material_sourcing table


CREATE TABLE raw_material_sourcing (
    id INTEGER,
    supplier_id INTEGER NOT NULL,
    raw_material_id INTEGER NOT NULL,
    primary key("id"),
    FOREIGN KEY ("supplier_id") REFERENCES suppliers("id"),
    FOREIGN KEY (raw_material_id) REFERENCES raw_materials("id")
);

-- Represents the products table

CREATE TABLE products (
    id INTEGER,
    product_name TEXT NOT NULL,
    price NUMERIC NOT NULL,
    category TEXT NOT NULL,
    primary key("id")
);


-- Represents the roles table

CREATE TABLE roles (
    id INTEGER,
    role TEXT NOT NULL,
    primary key("id")
);

-- Represents the employees table

CREATE TABLE employees (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob TEXT NOT NULL,
    gender TEXT NOT NULL CHECK(gender IN ('Male', 'Female', 'Other')),
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    address TEXT NOT NULL,
    salary NUMERIC NOT NULL,
    cafe_location_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    hired_date TEXT NOT NULL,
    primary key("id"),
    FOREIGN KEY ("cafe_location_id") REFERENCES cafe_locations("id"),
    FOREIGN KEY ("role_id") REFERENCES roles("id")
);


-- Represents the cafe_financials table

CREATE TABLE cafe_financials (
    id INTEGER,
    cafe_location_id INTEGER NOT NULL,
    yearly_revenue NUMERIC NOT NULL,
    yearly_expenses NUMERIC NOT NULL,
    year INTEGER NOT NULL,
    primary key("id"),
    FOREIGN KEY ("cafe_location_id") REFERENCES cafe_locations("id")
);

-- Represents the memberships table

CREATE TABLE memberships (
    id INTEGER,
    customer_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    expiry_date TEXT NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('Active', 'Expired', 'Inactive')),
    membership_fee NUMERIC NOT NULL,
    renewal_date TEXT,
    primary key("id"),
    FOREIGN KEY ("customer_id") REFERENCES customers("id")
);


-- Represents the customers table


CREATE TABLE customers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    address TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    membership_id TEXT CHECK(membership_id IN ('Yes', 'No')) NOT NULL,
    primary key("id")
);


-- Represents the orders table

CREATE TABLE orders (
    id INTEGER,
    cafe_location_id INTEGER NOT NULL,
    customers_id INTEGER NOT NULL,
    price NUMERIC NOT NULL,
    datetime datetime NOT NULL,
    primary key("id"),
    FOREIGN KEY (cafe_location_id) REFERENCES cafe_locations(id),
    FOREIGN KEY (customers_id) REFERENCES customers(id)
);


-- Represents the ordered_products table

CREATE TABLE ordered_products (
    id INTEGER,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    primary key("id"),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- Represents the feedback table

CREATE TABLE feedback (
    id INTEGER,
    customer_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    review TEXT NOT NULL,
    primary key ("id"),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- Represents the reservations table

CREATE TABLE reservations (
    id INTEGER,
    customer_id INTEGER NOT NULL,
    datetime DATETIME NOT NULL,
    cafe_location_id INTEGER NOT NULL,
    status TEXT NOT NULL,
    number_of_people INTEGER NOT NULL,
    special_request_if_any TEXT,
    primary key ("id"),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (cafe_location_id) REFERENCES cafe_locations(id)
);


-- Represents the employment_status table


CREATE TABLE employment_status (
    id INTEGER,
    employees_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('Active', 'On Leave', 'Terminated')),
    primary key ("id"),
    FOREIGN KEY (employees_id) REFERENCES employees(id)
);


-- Represents the cities table

CREATE TABLE cities (
    id INTEGER,
    name TEXT NOT NULL,
    state TEXT NOT NULL,
    primary key ("id")
);

-- Represents the raw_materials table

CREATE TABLE raw_materials (
    id INTEGER,
    name TEXT NOT NULL,
    primary key ("id")
);


--------------------------------------------

-- Data Insertion for cities

INSERT INTO cities (name, state)
VALUES
    ('Delhi', 'Delhi'),
    ('Mumbai', 'Maharashtra'),
    ('Bengaluru', 'Karnataka'),
    ('Chennai', 'Tamil Nadu'),
    ('Kolkata', 'West Bengal'),
    ('Hyderabad', 'Telangana'),
    ('Ahmedabad', 'Gujarat'),
    ('Pune', 'Maharashtra'),
    ('Jaipur', 'Rajasthan'),
    ('Lucknow', 'Uttar Pradesh'),
    ('Kanpur', 'Uttar Pradesh'),
    ('Nagpur', 'Maharashtra'),
    ('Indore', 'Madhya Pradesh'),
    ('Bhopal', 'Madhya Pradesh'),
    ('Patna', 'Bihar'),
    ('Ludhiana', 'Punjab'),
    ('Agra', 'Uttar Pradesh'),
    ('Nashik', 'Maharashtra'),
    ('Vadodara', 'Gujarat'),
    ('Surat', 'Gujarat'),
    ('Amritsar', 'Punjab'),
    ('Ranchi', 'Jharkhand'),
    ('Varanasi', 'Uttar Pradesh'),
    ('Meerut', 'Uttar Pradesh'),
    ('Thane', 'Maharashtra'),
    ('Rajkot', 'Gujarat'),
    ('Jodhpur', 'Rajasthan'),
    ('Noida', 'Uttar Pradesh'),
    ('Gurgaon', 'Haryana'),
    ('Faridabad', 'Haryana'),
    ('Chandigarh', 'Chandigarh'),
    ('Shimla', 'Himachal Pradesh'),
    ('Dehradun', 'Uttarakhand'),
    ('Guwahati', 'Assam'),
    ('Raipur', 'Chhattisgarh'),
    ('Jamshedpur', 'Jharkhand'),
    ('Gwalior', 'Madhya Pradesh'),
    ('Coimbatore', 'Tamil Nadu'),
    ('Kochi', 'Kerala'),
    ('Mysuru', 'Karnataka')
;

-- Data Insertion for cafe_locations

INSERT INTO cafe_locations (name, city_id, address, phone_number, email, total_employees, opening_date, opening_time, closing_time)
VALUES
    ('Brew Bliss', 1, 'Connaught Place, Delhi', '9876543210', 'brewbliss.delhi@gmail.com', 15, '2021-05-10', '08:00', '22:00'),
    ('Mocha Magic', 2, 'Bandra West, Mumbai', '9123456780', 'mochamagic.mumbai@gmail.com', 12, '2020-03-15', '09:00', '23:00'),
    ('Caffeine Corner', 3, 'Indiranagar, Bengaluru', '9988776655', 'caffeine.blr@gmail.com', 18, '2022-01-20', '07:30', '22:30'),
    ('The Daily Grind', 4, 'T Nagar, Chennai', '9112233445', 'grind.chennai@gmail.com', 14, '2019-10-12', '08:00', '21:00'),
    ('Cafe Culture', 5, 'Salt Lake, Kolkata', '9090909090', 'culture.kolkata@gmail.com', 10, '2021-11-05', '09:00', '22:00'),
    ('Bean Street', 6, 'Banjara Hills, Hyderabad', '9887766554', 'beanstreet.hyd@gmail.com', 20, '2022-04-08', '08:30', '22:30'),
    ('Espresso Express', 7, 'Navrangpura, Ahmedabad', '9876501234', 'espresso.ahm@gmail.com', 13, '2020-06-18', '09:00', '21:30'),
    ('Cuppa City', 8, 'Koregaon Park, Pune', '9012345678', 'cuppacity.pune@gmail.com', 17, '2022-09-10', '07:00', '23:00'),
    ('Lazy Latte', 9, 'MI Road, Jaipur', '9091989898', 'lazylatte.jaipur@gmail.com', 11, '2021-12-01', '08:00', '22:00'),
    ('Steamy Beans', 10, 'Hazratganj, Lucknow', '9988776651', 'steamy.lucknow@gmail.com', 16, '2022-03-25', '08:30', '22:00'),
    ('Urban Brew', 11, 'Mall Road, Kanpur', '9123456722', 'urbanbrew.kanpur@gmail.com', 15, '2021-07-07', '09:00', '21:30'),
    ('Café Cosy', 12, 'Sadar, Nagpur', '8877665544', 'cosy.nagpur@gmail.com', 10, '2019-12-12', '08:00', '20:00'),
    ('Grounded', 13, 'MG Road, Indore', '9345612789', 'grounded.indore@gmail.com', 18, '2020-08-08', '07:30', '22:30'),
    ('Cafe Canvas', 14, 'New Market, Bhopal', '9786452310', 'canvas.bhopal@gmail.com', 14, '2022-06-15', '08:30', '22:00'),
    ('The Mug Affair', 15, 'Fraser Road, Patna', '9812376450', 'mugaffair.patna@gmail.com', 13, '2023-01-01', '09:00', '21:00'),
    ('Roast Republic', 16, 'Ferozepur Road, Ludhiana', '9678234512', 'roast.ludhiana@gmail.com', 11, '2022-11-20', '08:00', '22:00'),
    ('Java Joint', 17, 'Tajganj, Agra', '9345612121', 'java.agra@gmail.com', 16, '2020-04-04', '08:00', '23:00'),
    ('Cafe Nirvana', 18, 'College Road, Nashik', '9834561247', 'nirvana.nashik@gmail.com', 12, '2021-02-14', '07:00', '21:00'),
    ('Buzz Brew', 19, 'Alkapuri, Vadodara', '9212345566', 'buzz.vadodara@gmail.com', 15, '2020-09-09', '09:00', '22:30'),
    ('Brew Bros', 20, 'Citylight, Surat', '9345678290', 'bros.surat@gmail.com', 17, '2021-10-25', '08:30', '22:00'),
    ('The Coffee Lab', 21, 'Ranjit Avenue, Amritsar', '9781234567', 'lab.amritsar@gmail.com', 12, '2019-11-11', '09:00', '21:00'),
    ('Café Nirvana', 22, 'Main Road, Ranchi', '9873214560', 'nirvana.ranchi@gmail.com', 14, '2022-08-18', '08:00', '22:00'),
    ('Blend & Brew', 23, 'Godowlia, Varanasi', '9567891234', 'blend.varanasi@gmail.com', 13, '2023-02-01', '07:30', '22:00'),
    ('Perk Up', 24, 'Civil Lines, Meerut', '9098765432', 'perk.meerut@gmail.com', 10, '2020-05-05', '09:00', '21:00'),
    ('Café Cloud', 25, 'Ghodbunder Rd, Thane', '9123451234', 'cloud.thane@gmail.com', 18, '2021-04-14', '08:30', '22:30'),
    ('Filter Fresh', 26, 'Kalawad Rd, Rajkot', '9234567812', 'filter.rajkot@gmail.com', 11, '2021-07-22', '09:00', '20:00'),
    ('Steam Cafe', 27, 'Shastri Circle, Jodhpur', '9345678123', 'steam.jodhpur@gmail.com', 14, '2020-11-30', '08:00', '21:30'),
    ('Bean Machine', 28, 'Sector 18, Noida', '9012345000', 'machine.noida@gmail.com', 19, '2023-01-10', '07:30', '23:00'),
    ('Café Daydreams', 29, 'Cyber Hub, Gurgaon', '9876543211', 'daydreams.ggn@gmail.com', 15, '2022-10-10', '08:00', '22:00'),
    ('The Brew Spot', 30, 'NIT, Faridabad', '9765432101', 'brewspot.faridabad@gmail.com', 12, '2021-08-08', '09:00', '21:00'),
    ('Choco Brew', 31, 'Sector 17, Chandigarh', '9456123478', 'choco.chd@gmail.com', 10, '2020-02-29', '08:00', '20:00'),
    ('High Grounds', 32, 'Mall Rd, Shimla', '9345612980', 'grounds.shimla@gmail.com', 9, '2021-05-21', '09:00', '19:30'),
    ('The Coffee Yard', 33, 'Rajpur Rd, Dehradun', '9786543210', 'yard.dehradun@gmail.com', 14, '2022-12-01', '08:30', '21:30'),
    ('Kettle & Mug', 34, 'Zoo Rd, Guwahati', '9654321987', 'kettle.guwahati@gmail.com', 13, '2020-06-06', '09:00', '20:30'),
    ('Brew & Beyond', 35, 'GE Rd, Raipur', '9876123450', 'beyond.raipur@gmail.com', 12, '2022-09-09', '08:00', '21:00'),
    ('Cafe Origin', 36, 'Bistupur, Jamshedpur', '9234512890', 'origin.jamshedpur@gmail.com', 15, '2021-06-06', '08:00', '22:00'),
    ('Roast & Relax', 37, 'Thatipur, Gwalior', '9678123456', 'roast.gwalior@gmail.com', 10, '2021-01-20', '08:30', '21:00'),
    ('Cafe Bloom', 38, 'Race Course, Coimbatore', '9512346789', 'bloom.coimbatore@gmail.com', 17, '2020-07-07', '09:00', '22:00'),
    ('South Perk', 39, 'MG Road, Kochi', '9012456789', 'perk.kochi@gmail.com', 11, '2021-09-18', '08:00', '21:00'),
    ('Brew Tales', 40, 'Sayyaji Rao Rd, Mysuru', '9345609876', 'tales.mysuru@gmail.com', 13, '2022-03-03', '09:00', '22:00')
;


-- Data Insertion for suppliers

INSERT INTO suppliers (supplier_name, address, city_id, phone_number)
VALUES
    ('Fresh Beans Co.', 'Sector 21, Delhi', 1, '9876500001'),
    ('Mocha Supplies', 'Worli, Mumbai', 2, '9876500002'),
    ('Karnataka Coffee Ltd.', 'Indiranagar, Bengaluru', 3, '9876500003'),
    ('Southern Roasters', 'Nungambakkam, Chennai', 4, '9876500004'),
    ('Eastern Aroma Pvt. Ltd.', 'Ballygunge, Kolkata', 5, '9876500005'),
    ('Deccan Café Supply', 'Gachibowli, Hyderabad', 6, '9876500006'),
    ('Western Bean Distributors', 'Ellis Bridge, Ahmedabad', 7, '9876500007'),
    ('Pune Perks', 'Kothrud, Pune', 8, '9876500008'),
    ('Desert Beans', 'C Scheme, Jaipur', 9, '9876500009'),
    ('Lucknow Beans & Co.', 'Aminabad, Lucknow', 10, '9876500010'),
    ('Central India Roasters', 'Arya Nagar, Kanpur', 11, '9876500011'),
    ('Vidarbha Supplies', 'Civil Lines, Nagpur', 12, '9876500012'),
    ('Madhya Beans', 'Vijay Nagar, Indore', 13, '9876500013'),
    ('Bhopal Brews Ltd.', 'Arera Colony, Bhopal', 14, '9876500014'),
    ('Patna Premium Beans', 'Kankarbagh, Patna', 15, '9876500015'),
    ('Ludhiana Latte Links', 'Model Town, Ludhiana', 16, '9876500016'),
    ('Agra Arabica Traders', 'Dayal Bagh, Agra', 17, '9876500017'),
    ('Nashik Bean Traders', 'Panchavati, Nashik', 18, '9876500018'),
    ('Vadodara Vibes', 'Akota, Vadodara', 19, '9876500019'),
    ('Surat Supplies & Co.', 'Adajan, Surat', 20, '9876500020'),
    ('Amritsar Aroma Pvt. Ltd.', 'Majitha Road, Amritsar', 21, '9876500021'),
    ('Ranchi Roasters', 'Lalpur, Ranchi', 22, '9876500022'),
    ('Varanasi Ventures', 'Sigra, Varanasi', 23, '9876500023'),
    ('Meerut Mocha Ltd.', 'Shastri Nagar, Meerut', 24, '9876500024'),
    ('Thane Coffee Co.', 'Majiwada, Thane', 25, '9876500025'),
    ('Rajkot Roast Depot', 'University Road, Rajkot', 26, '9876500026'),
    ('Jodhpur Java Co.', 'Paota, Jodhpur', 27, '9876500027'),
    ('Noida Beans & Supply', 'Sector 62, Noida', 28, '9876500028'),
    ('Gurgaon Grind Traders', 'Sohna Road, Gurgaon', 29, '9876500029'),
    ('Faridabad Flavors', 'Old Faridabad, Faridabad', 30, '9876500030'),
    ('Chandigarh Roast Mart', 'Manimajra, Chandigarh', 31, '9876500031'),
    ('Raipur Rich Beans', 'Shankar Nagar, Raipur', 32, '9876500032'),
    ('Kozhikode Coffee Ltd.', 'Beach Road, Kozhikode', 33, '9876500033'),
    ('Srinagar Suppliers', 'Lal Chowk, Srinagar', 34, '9876500034'),
    ('Dehradun Beans Pvt. Ltd.', 'Rajpur Road, Dehradun', 35, '9876500035'),
    ('Imphal Arabica Depot', 'Thangmeiband, Imphal', 36, '9876500036'),
    ('Shillong Aroma Co.', 'Police Bazar, Shillong', 37, '9876500037'),
    ('Panaji Perk Supplies', 'Altinho, Panaji', 38, '9876500038'),
    ('Aizawl Bean Traders', 'Zarkawt, Aizawl', 39, '9876500039'),
    ('Itanagar Coffee Hub', 'Ganga Market, Itanagar', 40, '9876500040')
;

-- Data Insertion for raw_materials

INSERT INTO raw_materials (name)
VALUES
    ('Arabica Coffee Beans'),
    ('Robusta Coffee Beans'),
    ('Green Tea Leaves'),
    ('Black Tea Leaves'),
    ('Milk'),
    ('Skimmed Milk'),
    ('Soy Milk'),
    ('Almond Milk'),
    ('Oat Milk'),
    ('Whipping Cream'),
    ('Fresh Cream'),
    ('Condensed Milk'),
    ('Sugar'),
    ('Brown Sugar'),
    ('Stevia'),
    ('Honey'),
    ('Cocoa Powder'),
    ('Chocolate Syrup'),
    ('Caramel Syrup'),
    ('Vanilla Syrup'),
    ('Hazelnut Syrup'),
    ('Strawberry Syrup'),
    ('Matcha Powder'),
    ('Ice Cubes'),
    ('Crushed Ice'),
    ('Espresso Pods'),
    ('Tea Bags'),
    ('Cinnamon Powder'),
    ('Cardamom'),
    ('Cloves'),
    ('Ginger Extract'),
    ('Lemon Juice'),
    ('Orange Peel'),
    ('Mint Leaves'),
    ('Paper Cups'),
    ('Plastic Lids'),
    ('Stirrers'),
    ('Napkins'),
    ('Coffee Filters'),
    ('Cleaning Solution')
;

-- Data Insertion for raw_material_sourcing

INSERT INTO raw_material_sourcing (supplier_id, raw_material_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20),
    (21, 21),
    (22, 22),
    (23, 23),
    (24, 24),
    (25, 25),
    (26, 26),
    (27, 27),
    (28, 28),
    (29, 29),
    (30, 30),
    (31, 31),
    (32, 32),
    (33, 33),
    (34, 34),
    (35, 35),
    (36, 36),
    (37, 37),
    (38, 38),
    (39, 39),
    (40, 40)
;

-- Data Insertion for products

INSERT INTO products (product_name, price, category)
VALUES
    ('Espresso', 120.00, 'Beverage'),
    ('Cappuccino', 150.00, 'Beverage'),
    ('Latte', 160.00, 'Beverage'),
    ('Americano', 130.00, 'Beverage'),
    ('Mocha', 170.00, 'Beverage'),
    ('Flat White', 140.00, 'Beverage'),
    ('Macchiato', 145.00, 'Beverage'),
    ('Hot Chocolate', 180.00, 'Beverage'),
    ('Green Tea', 100.00, 'Beverage'),
    ('Black Tea', 90.00, 'Beverage'),
    ('Cold Coffee', 160.00, 'Beverage'),
    ('Iced Latte', 170.00, 'Beverage'),
    ('Frappuccino', 200.00, 'Beverage'),
    ('Choco Frappe', 190.00, 'Beverage'),
    ('Hazelnut Coffee', 180.00, 'Beverage'),
    ('Vanilla Cold Brew', 175.00, 'Beverage'),
    ('Croissant', 90.00, 'Bakery'),
    ('Chocolate Muffin', 110.00, 'Bakery'),
    ('Blueberry Muffin', 120.00, 'Bakery'),
    ('Banana Bread', 100.00, 'Bakery'),
    ('Cheesecake Slice', 150.00, 'Dessert'),
    ('Tiramisu', 160.00, 'Dessert'),
    ('Brownie', 120.00, 'Dessert'),
    ('Chocolate Truffle', 130.00, 'Dessert'),
    ('Ice Cream Sundae', 150.00, 'Dessert'),
    ('Club Sandwich', 180.00, 'Snack'),
    ('Grilled Cheese Sandwich', 150.00, 'Snack'),
    ('Veg Wrap', 140.00, 'Snack'),
    ('Chicken Roll', 170.00, 'Snack'),
    ('Paneer Tikka Sandwich', 160.00, 'Snack'),
    ('Caesar Salad', 150.00, 'Healthy'),
    ('Greek Salad', 160.00, 'Healthy'),
    ('Smoothie Bowl', 180.00, 'Healthy'),
    ('Protein Shake', 200.00, 'Healthy'),
    ('Peach Iced Tea', 130.00, 'Beverage'),
    ('Lemonade', 110.00, 'Beverage'),
    ('Mango Smoothie', 160.00, 'Beverage'),
    ('Strawberry Shake', 170.00, 'Beverage'),
    ('Orange Juice', 120.00, 'Beverage'),
    ('Mint Mojito', 140.00, 'Beverage')
;

-- Data Insertion for roles

INSERT INTO roles (role)
VALUES
    ('Barista'),
    ('Head Barista'),
    ('Cafe Manager'),
    ('Assistant Manager'),
    ('Cashier'),
    ('Chef'),
    ('Sous Chef'),
    ('Pastry Chef'),
    ('Line Cook'),
    ('Kitchen Assistant'),
    ('Dishwasher'),
    ('Server'),
    ('Waiter'),
    ('Waitress'),
    ('Busser'),
    ('Host'),
    ('Maintenance Staff'),
    ('Security Guard'),
    ('Inventory Manager'),
    ('Cleaner'),
    ('Delivery Staff'),
    ('Receptionist'),
    ('Procurement Officer'),
    ('Marketing Executive'),
    ('Trainee')
;


-- Inserting more roles to make total 40

INSERT INTO roles (role)
VALUES
    ('Senior Barista'),
    ('Junior Chef'),
    ('Head Cashier'),
    ('Delivery Coordinator'),
    ('Cleaning Staff'),
    ('Maintenance Head'),
    ('IT Support'),
    ('Security Staff'),
    ('Marketing Executive'),
    ('Inventory Controller'),
    ('Shift Lead'),
    ('Trainee'),
    ('Operations Analyst'),
    ('Procurement Officer'),
    ('Franchise Manager')
;

-- Data Insertion for employees

INSERT INTO employees (first_name, last_name, dob, gender, email, phone_number, address, salary, cafe_location_id, role_id, hired_date)
VALUES
    ('John', 'Doe', '1990-05-10', 'Male', 'john.doe@example.com', '9876543210', '123 Main St, New York', 35000, 1, 1, '2023-01-01'),
    ('Alice', 'Smith', '1992-03-15', 'Female', 'alice.smith@example.com', '9876543211', '456 Park Ave, New York', 38000, 2, 2, '2023-02-12'),
    ('Bob', 'Brown', '1988-11-20', 'Male', 'bob.brown@example.com', '9876543212', '789 Broadway, New York', 50000, 3, 3, '2023-03-05'),
    ('Eva', 'Taylor', '1995-07-18', 'Female', 'eva.taylor@example.com', '9876543213', '101 5th Ave, Los Angeles', 45000, 4, 4, '2023-04-10'),
    ('Mike', 'Johnson', '1991-01-25', 'Male', 'mike.johnson@example.com', '9876543214', '202 Sunset Blvd, Los Angeles', 30000, 5, 5, '2023-05-20'),
    ('Lily', 'Williams', '1993-09-09', 'Female', 'lily.williams@example.com', '9876543215', '303 Hollywood Rd, Chicago', 32000, 6, 6, '2023-06-15'),
    ('David', 'Lee', '1989-12-12', 'Male', 'david.lee@example.com', '9876543216', '404 Lincoln Park, Chicago', 40000, 7, 7, '2023-07-18'),
    ('Sophia', 'Brown', '1996-08-05', 'Female', 'sophia.brown@example.com', '9876543217', '505 Wacker Dr, Houston', 28000, 8, 8, '2023-08-22'),
    ('Ethan', 'Clark', '1994-04-04', 'Male', 'ethan.clark@example.com', '9876543218', '606 Main St, Houston', 30000, 9, 9, '2023-09-01'),
    ('Chloe', 'Martin', '1997-02-19', 'Female', 'chloe.martin@example.com', '9876543219', '707 Downtown, Phoenix', 33000, 10, 10, '2023-10-12'),
    ('Noah', 'Davis', '1992-11-01', 'Male', 'noah.davis@example.com', '9876543220', '808 Desert St, Philadelphia', 31000, 11, 11, '2023-11-30'),
    ('Grace', 'Lopez', '1990-06-15', 'Female', 'grace.lopez@example.com', '9876543221', '909 Liberty Ave, Philadelphia', 27000, 12, 12, '2023-12-05'),
    ('Daniel', 'Garcia', '1987-10-25', 'Male', 'daniel.garcia@example.com', '9876543222', '1010 Walnut St, San Antonio', 46000, 13, 13, '2023-12-20'),
    ('Ella', 'Martinez', '1995-12-02', 'Female', 'ella.martinez@example.com', '9876543223', '1111 Alamo St, San Antonio', 28000, 14, 14, '2024-01-10'),
    ('James', 'Hernandez', '1991-04-30', 'Male', 'james.hernandez@example.com', '9876543224', '1212 Riverwalk, Dallas', 37000, 15, 15, '2024-01-25'),
    ('Mia', 'Robinson', '1996-07-07', 'Female', 'mia.robinson@example.com', '9876543225', '1313 Cedar Hill, Dallas', 29000, 16, 16, '2024-02-18'),
    ('Benjamin', 'Scott', '1993-05-12', 'Male', 'benjamin.scott@example.com', '9876543226', '1414 White Rock, San Jose', 31000, 17, 17, '2024-02-28'),
    ('Ava', 'Green', '1998-01-11', 'Female', 'ava.green@example.com', '9876543227', '1515 Market St, Austin', 27000, 18, 18, '2024-03-12'),
    ('Logan', 'Young', '1990-03-08', 'Male', 'logan.young@example.com', '9876543228', '1616 Barton Springs, Austin', 34000, 19, 19, '2024-03-27'),
    ('Harper', 'Allen', '1992-10-16', 'Female', 'harper.allen@example.com', '9876543229', '1717 Downtown, Jacksonville', 28000, 20, 20, '2024-04-09'),
    ('Mason', 'King', '1994-09-20', 'Male', 'mason.king@example.com', '9876543230', '1818 River Rd, Fort Worth', 30000, 1, 21, '2024-04-20'),
    ('Luna', 'Wright', '1996-06-22', 'Female', 'luna.wright@example.com', '9876543231', '1919 Elm St, Columbus', 29000, 2, 22, '2024-05-01'),
    ('Henry', 'Hill', '1989-08-10', 'Male', 'henry.hill@example.com', '9876543232', '2020 Short North, San Francisco', 36000, 3, 23, '2024-05-12'),
    ('Aria', 'Scott', '1997-04-05', 'Female', 'aria.scott@example.com', '9876543233', '2121 Castro, San Francisco', 27000, 4, 24, '2024-05-24'),
    ('Jackson', 'Adams', '1993-07-19', 'Male', 'jackson.adams@example.com', '9876543234', '2222 Mission St, Charlotte', 38000, 5, 25, '2024-06-01'),
    ('Layla', 'Nelson', '1998-02-17', 'Female', 'layla.nelson@example.com', '9876543235', '2323 Uptown, Charlotte', 31000, 6, 1, '2024-06-10'),
    ('Sebastian', 'Baker', '1992-05-29', 'Male', 'sebastian.baker@example.com', '9876543236', '2424 Plaza Midwood, Seattle', 35000, 7, 2, '2024-06-22'),
    ('Zoe', 'Gonzalez', '1994-03-21', 'Female', 'zoe.gonzalez@example.com', '9876543237', '2525 Rainier Ave, Seattle', 28000, 8, 3, '2024-07-05'),
    ('Elijah', 'Perez', '1991-12-08', 'Male', 'elijah.perez@example.com', '9876543238', '2626 Capitol Hill, Denver', 33000, 9, 4, '2024-07-15'),
    ('Nora', 'Campbell', '1995-11-03', 'Female', 'nora.campbell@example.com', '9876543239', '2727 Cherry Creek, Denver', 30000, 10, 5, '2024-07-28'),
    ('Luke', 'Stewart', '1990-06-14', 'Male', 'luke.stewart@example.com', '9876543240', '2828 Aurora, Washington', 37000, 11, 6, '2024-08-08'),
    ('Scarlett', 'Flores', '1993-01-30', 'Female', 'scarlett.flores@example.com', '9876543241', '2929 Navy Yard, Washington', 32000, 12, 7, '2024-08-19'),
    ('Aiden', 'Rivera', '1996-09-25', 'Male', 'aiden.rivera@example.com', '9876543242', '3030 Georgetown, Boston', 34000, 13, 8, '2024-08-30'),
    ('Camila', 'Reed', '1997-11-14', 'Female', 'camila.reed@example.com', '9876543243', '3131 Beacon Hill, Boston', 28000, 14, 9, '2024-09-10')
;

-- Inserting employees 35 to 40 in employees table

INSERT INTO employees (first_name, last_name, dob, gender, email, phone_number, address, salary, cafe_location_id, role_id, hired_date)
VALUES
    ('Ritika', 'Yadav', '1995-08-15', 'Female', 'ritika.yadav@example.com', '9876543235', 'Lucknow, UP', 41000, 2, 4, '2023-03-10'),
    ('Sourav', 'Mishra', '1990-12-05', 'Male', 'sourav.mishra@example.com', '9876543236', 'Bhopal, MP', 44000, 3, 2, '2023-01-20'),
    ('Ananya', 'Verma', '1996-04-18', 'Female', 'ananya.verma@example.com', '9876543237', 'Chandigarh', 39500, 1, 3, '2022-12-01'),
    ('Deepak', 'Rana', '1988-09-22', 'Male', 'deepak.rana@example.com', '9876543238', 'Ranchi, Jharkhand', 46000, 5, 1, '2023-06-05'),
    ('Priya', 'Kapoor', '1993-11-30', 'Female', 'priya.kapoor@example.com', '9876543239', 'Jaipur, Rajasthan', 43000, 4, 5, '2023-02-15'),
    ('Tarun', 'Joshi', '1991-01-25', 'Male', 'tarun.joshi@example.com', '9876543240', 'Guwahati, Assam', 47000, 2, 6, '2023-04-22')
;

-- Data Insertion for cafe_financials


INSERT INTO cafe_financials (cafe_location_id, yearly_revenue, yearly_expenses, year)
VALUES
    (1, 1200000, 900000, 2021),
    (1, 1350000, 950000, 2022),
    (1, 1500000, 980000, 2023),

    (2, 1100000, 850000, 2021),
    (2, 1250000, 880000, 2022),
    (2, 1380000, 920000, 2023),

    (3, 1000000, 770000, 2021),
    (3, 1120000, 820000, 2022),
    (3, 1300000, 890000, 2023),

    (4, 950000, 700000, 2021),
    (4, 1080000, 760000, 2022),
    (4, 1200000, 800000, 2023),

    (5, 890000, 680000, 2021),
    (5, 970000, 720000, 2022),
    (5, 1050000, 750000, 2023),

    (6, 930000, 700000, 2021),
    (6, 1020000, 740000, 2022),
    (6, 1150000, 790000, 2023),

    (7, 870000, 660000, 2021),
    (7, 940000, 700000, 2022),
    (7, 1020000, 730000, 2023),

    (8, 920000, 690000, 2021),
    (8, 990000, 720000, 2022),
    (8, 1080000, 760000, 2023),

    (9, 1010000, 780000, 2021),
    (9, 1130000, 820000, 2022),
    (9, 1250000, 860000, 2023),

    (10, 870000, 650000, 2021),
    (10, 930000, 690000, 2022),
    (10, 1010000, 720000, 2023),

    (11, 950000, 720000, 2022),
    (11, 1070000, 760000, 2023),

    (12, 890000, 700000, 2022),
    (12, 990000, 740000, 2023),

    (13, 930000, 710000, 2022),
    (13, 1050000, 760000, 2023),

    (14, 970000, 730000, 2022),
    (14, 1100000, 780000, 2023),

    (15, 980000, 750000, 2022),
    (15, 1150000, 800000, 2023),

    (16, 1020000, 780000, 2022),
    (16, 1180000, 820000, 2023),

    (17, 930000, 710000, 2022),
    (17, 1070000, 750000, 2023),

    (18, 880000, 670000, 2022),
    (18, 980000, 720000, 2023),

    (19, 970000, 740000, 2022),
    (19, 1090000, 780000, 2023),

    (20, 1010000, 790000, 2022),
    (20, 1150000, 830000, 2023)
;


-- Data Insertion for customers

INSERT INTO customers (first_name, last_name, gender, address, email, phone_number, membership)
VALUES
    ('Aarav', 'Sharma', 'Male', '123 MG Road, Delhi', 'aarav.sharma@example.com', '9876543210', 'Yes'),
    ('Ishita', 'Verma', 'Female', '45 Park Street, Kolkata', 'ishita.verma@example.com', '9876543211', 'No'),
    ('Rohan', 'Mehta', 'Male', '88 Marine Drive, Mumbai', 'rohan.mehta@example.com', '9876543212', 'Yes'),
    ('Neha', 'Singh', 'Female', '22 Anna Nagar, Chennai', 'neha.singh@example.com', '9876543213', 'No'),
    ('Dev', 'Patel', 'Male', '77 Satellite Rd, Ahmedabad', 'dev.patel@example.com', '9876543214', 'Yes'),
    ('Simran', 'Kaur', 'Female', '10 Sector 17, Chandigarh', 'simran.kaur@example.com', '9876543215', 'Yes'),
    ('Kabir', 'Jain', 'Male', '60 Residency Rd, Bengaluru', 'kabir.jain@example.com', '9876543216', 'No'),
    ('Riya', 'Rastogi', 'Female', '55 MG Marg, Lucknow', 'riya.rastogi@example.com', '9876543217', 'Yes'),
    ('Yash', 'Reddy', 'Male', '90 Banjara Hills, Hyderabad', 'yash.reddy@example.com', '9876543218', 'No'),
    ('Ananya', 'Deshmukh', 'Female', '33 FC Road, Pune', 'ananya.deshmukh@example.com', '9876543219', 'Yes'),
    ('Amit', 'Kapoor', 'Male', '50 Connaught Place, Delhi', 'amit.kapoor@example.com', '9876543220', 'Yes'),
    ('Tanya', 'Joshi', 'Female', '75 Lake Town, Kolkata', 'tanya.joshi@example.com', '9876543221', 'No'),
    ('Nikhil', 'Saxena', 'Male', '12 Bandra West, Mumbai', 'nikhil.saxena@example.com', '9876543222', 'Yes'),
    ('Priya', 'Menon', 'Female', '30 Besant Nagar, Chennai', 'priya.menon@example.com', '9876543223', 'Yes'),
    ('Raj', 'Thakur', 'Male', '19 CG Road, Ahmedabad', 'raj.thakur@example.com', '9876543224', 'No'),
    ('Meera', 'Gill', 'Female', '5 Phase 1, Mohali', 'meera.gill@example.com', '9876543225', 'Yes'),
    ('Rajat', 'Bajaj', 'Male', '66 Indiranagar, Bengaluru', 'rajat.bajaj@example.com', '9876543226', 'No'),
    ('Sneha', 'Sinha', 'Female', '21 Hazratganj, Lucknow', 'sneha.sinha@example.com', '9876543227', 'Yes'),
    ('Siddharth', 'Nair', 'Male', '18 Jubilee Hills, Hyderabad', 'siddharth.nair@example.com', '9876543228', 'Yes'),
    ('Kritika', 'Chavan', 'Female', '73 JM Road, Pune', 'kritika.chavan@example.com', '9876543229', 'No'),
    ('Ravina', 'Rao', 'Female', '8 Sector 18, Noida', 'ravina.rao@example.com', '9876543230', 'Yes'),
    ('Karan', 'Garg', 'Male', '61 Hitech City, Hyderabad', 'karan.garg@example.com', '9876543231', 'Yes'),
    ('Manish', 'Gupta', 'Male', '14 Camp, Pune', 'manish.gupta@example.com', '9876543232', 'No'),
    ('Sara', 'Bansal', 'Female', '76 Saket, Delhi', 'sara.bansal@example.com', '9876543233', 'Yes'),
    ('Vikram', 'Chowdhury', 'Male', '37 Esplanade, Kolkata', 'vikram.chowdhury@example.com', '9876543234', 'Yes'),
    ('Ayesha', 'Rizvi', 'Female', '59 Andheri East, Mumbai', 'ayesha.rizvi@example.com', '9876543235', 'No'),
    ('Puneet', 'Mathur', 'Male', '11 T Nagar, Chennai', 'puneet.mathur@example.com', '9876543236', 'Yes'),
    ('Tanvi', 'Modi', 'Female', '79 Maninagar, Ahmedabad', 'tanvi.modi@example.com', '9876543237', 'No'),
    ('Dhruv', 'Malhotra', 'Male', '40 Sector 22, Chandigarh', 'dhruv.malhotra@example.com', '9876543238', 'Yes'),
    ('Reema', 'Dixit', 'Female', '43 Jayanagar, Bengaluru', 'reema.dixit@example.com', '9876543239', 'Yes'),
    ('Saurabh', 'Khanna', 'Male', '34 Aliganj, Lucknow', 'saurabh.khanna@example.com', '9876543240', 'No'),
    ('Divya', 'Naik', 'Female', '27 Begumpet, Hyderabad', 'divya.naik@example.com', '9876543241', 'Yes'),
    ('Arjun', 'Rana', 'Male', '89 FC Road, Pune', 'arjun.rana@example.com', '9876543242', 'Yes'),
    ('Naina', 'Kapadia', 'Female', '13 Hauz Khas, Delhi', 'naina.kapadia@example.com', '9876543243', 'No'),
    ('Harsh', 'Kumar', 'Male', '23 Civil Lines, Allahabad', 'harsh.kumar@example.com', '9876543244', 'Yes'),
    ('Ira', 'Sen', 'Female', '71 Salt Lake, Kolkata', 'ira.sen@example.com', '9876543245', 'Yes'),
    ('Yuvraj', 'Bose', 'Male', '9 Malabar Hill, Mumbai', 'yuvraj.bose@example.com', '9876543246', 'No'),
    ('Lavanya', 'Pillai', 'Female', '19 Adyar, Chennai', 'lavanya.pillai@example.com', '9876543247', 'Yes'),
    ('Naman', 'Joshi', 'Male', '6 Navrangpura, Ahmedabad', 'naman.joshi@example.com', '9876543248', 'Yes'),
    ('Aditi', 'Oberoi', 'Female', '29 Sector 35, Chandigarh', 'aditi.oberoi@example.com', '9876543249', 'No')
;

-- Data Insertion for orders


INSERT INTO orders (cafe_location_id, customers_id, price, datetime)
VALUES
    (1, 5, 450.00, '2024-03-01 09:15:00'),
    (2, 3, 620.00, '2024-03-01 10:45:00'),
    (3, 8, 320.00, '2024-03-01 12:30:00'),
    (4, 2, 510.00, '2024-03-01 14:10:00'),
    (5, 6, 780.00, '2024-03-02 09:00:00'),
    (6, 7, 290.00, '2024-03-02 11:50:00'),
    (7, 10, 910.00, '2024-03-02 15:20:00'),
    (8, 12, 475.00, '2024-03-02 17:35:00'),
    (9, 15, 380.00, '2024-03-03 08:45:00'),
    (10, 18, 699.00, '2024-03-03 13:10:00'),
    (1, 20, 850.00, '2024-03-04 10:25:00'),
    (2, 22, 260.00, '2024-03-04 11:30:00'),
    (3, 25, 540.00, '2024-03-04 14:00:00'),
    (4, 27, 475.00, '2024-03-05 09:45:00'),
    (5, 30, 390.00, '2024-03-05 13:15:00'),
    (6, 32, 670.00, '2024-03-05 16:25:00'),
    (7, 35, 720.00, '2024-03-06 08:50:00'),
    (8, 36, 555.00, '2024-03-06 12:40:00'),
    (9, 38, 890.00, '2024-03-06 14:55:00'),
    (10, 40, 615.00, '2024-03-06 17:05:00'),
    (1, 1, 405.00, '2024-03-07 09:30:00'),
    (2, 4, 785.00, '2024-03-07 11:00:00'),
    (3, 9, 295.00, '2024-03-07 12:45:00'),
    (4, 11, 510.00, '2024-03-07 14:20:00'),
    (5, 13, 475.00, '2024-03-08 09:10:00'),
    (6, 14, 660.00, '2024-03-08 11:35:00'),
    (7, 16, 390.00, '2024-03-08 13:50:00'),
    (8, 17, 850.00, '2024-03-08 15:00:00'),
    (9, 19, 320.00, '2024-03-08 17:20:00'),
    (10, 21, 720.00, '2024-03-09 10:15:00'),
    (1, 23, 645.00, '2024-03-09 11:45:00'),
    (2, 24, 510.00, '2024-03-09 13:25:00'),
    (3, 26, 475.00, '2024-03-09 15:10:00'),
    (4, 28, 330.00, '2024-03-10 09:05:00'),
    (5, 29, 770.00, '2024-03-10 10:50:00'),
    (6, 31, 850.00, '2024-03-10 12:15:00'),
    (7, 33, 615.00, '2024-03-10 14:30:00'),
    (8, 34, 490.00, '2024-03-10 16:00:00'),
    (9, 37, 360.00, '2024-03-10 17:10:00'),
    (10, 39, 525.00, '2024-03-11 09:25:00')
;


-- Data Insertion for ordered_products


INSERT INTO ordered_products (order_id, product_id, quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 2),
    (2, 4, 1),
    (3, 5, 3),
    (3, 6, 1),
    (4, 7, 2),
    (5, 8, 1),
    (6, 9, 3),
    (7, 10, 2),
    (8, 11, 1),
    (9, 12, 2),
    (10, 13, 1),
    (11, 14, 1),
    (12, 15, 2),
    (13, 16, 3),
    (14, 17, 1),
    (15, 18, 2),
    (16, 19, 1),
    (17, 20, 1),
    (18, 21, 3),
    (19, 22, 1),
    (20, 23, 2),
    (21, 24, 1),
    (22, 25, 3),
    (23, 26, 2),
    (24, 27, 1),
    (25, 28, 1),
    (26, 29, 2),
    (27, 30, 3),
    (28, 31, 1),
    (29, 32, 2),
    (30, 33, 1),
    (31, 34, 2),
    (32, 35, 1),
    (33, 36, 1),
    (34, 37, 2),
    (35, 38, 1),
    (36, 39, 3),
    (37, 40, 1),
    (38, 1, 2),
    (39, 2, 1),
    (40, 3, 2)
;


-- Data Insertion for feedback

INSERT INTO feedback (customer_id, order_id, product_id, review)
VALUES
    (1, 1, 1, 'Excellent product, really loved it!'),
    (2, 2, 2, 'Nice quality, would recommend to others.'),
    (3, 3, 3, 'The taste was great, but the packaging could be better.'),
    (4, 4, 4, 'Very good, will order again soon.'),
    (5, 5, 5, 'Product didn’t meet expectations, too sweet.'),
    (6, 6, 6, 'Amazing! Perfect for my needs.'),
    (7, 7, 7, 'Quite good, could use a little more variety in flavors.'),
    (8, 8, 8, 'Satisfying, but a bit overpriced.'),
    (9, 9, 9, 'The quality was excellent, loved the freshness.'),
    (10, 10, 10, 'It was just okay, not the best.'),
    (11, 11, 11, 'I loved the packaging, but the taste wasn’t great.'),
    (12, 12, 12, 'Great taste, could be better on price.'),
    (13, 13, 13, 'Would recommend, very delicious!'),
    (14, 14, 14, 'Nice product, but delivery was delayed.'),
    (15, 15, 15, 'Very happy with the quality, will buy again.'),
    (16, 16, 16, 'Tasted great, but didn’t like the texture.'),
    (17, 17, 17, 'Amazing flavor, exactly what I wanted!'),
    (18, 18, 18, 'Not as good as expected, will try a different product.'),
    (19, 19, 19, 'Quite good, would order again if the price drops.'),
    (20, 20, 20, 'Very good product, value for money.'),
    (21, 21, 21, 'Too salty for my taste, not great.'),
    (22, 22, 22, 'Excellent, 5 stars all the way!'),
    (23, 23, 23, 'The product was fine, but took too long to arrive.'),
    (24, 24, 24, 'Loved it! Definitely a repeat purchase for me.'),
    (25, 25, 25, 'Not worth the price, was expecting more.'),
    (26, 26, 26, 'Good product, will try other variants too.'),
    (27, 27, 27, 'The taste was a bit off, but acceptable.'),
    (28, 28, 28, 'Superb, will keep coming back for more!'),
    (29, 29, 29, 'Liked it, but I think it could be improved in quality.'),
    (30, 30, 30, 'Really great product, I loved the flavor!'),
    (31, 31, 31, 'Decent, but a little bland for my taste.'),
    (32, 32, 32, 'I loved it, very unique product.'),
    (33, 33, 33, 'Good quality, will definitely buy again.'),
    (34, 34, 34, 'Not my favorite, I won’t be buying again.'),
    (35, 35, 35, 'Best I have had in a long time, great!'),
    (36, 36, 36, 'Could be better, a bit too sweet.'),
    (37, 37, 37, 'Not bad, but didn’t live up to expectations.'),
    (38, 38, 38, 'Loved the freshness, would order again.'),
    (39, 39, 39, 'It was okay, just not what I was hoping for.'),
    (40, 40, 40, 'Fantastic, really impressed with the taste!')
;

-- Data Insertion for reservations

INSERT INTO reservations (customer_id, datetime, cafe_location_id, status, number_of_people, special_request_if_any)
VALUES
    (1, '2025-04-10 19:00:00', 1, 'Confirmed', 2, 'Window seat'),
    (2, '2025-04-11 12:30:00', 2, 'Pending', 4, 'Outdoor seating'),
    (3, '2025-04-12 18:45:00', 3, 'Cancelled', 2, 'Birthday celebration'),
    (4, '2025-04-13 15:00:00', 4, 'Confirmed', 3, 'Vegetarian options'),
    (5, '2025-04-14 13:30:00', 5, 'Confirmed', 5, 'Table near the entrance'),
    (6, '2025-04-15 20:00:00', 6, 'Confirmed', 2, 'Anniversary dinner'),
    (7, '2025-04-16 11:00:00', 7, 'Pending', 6, 'High chairs for kids'),
    (8, '2025-04-17 14:15:00', 8, 'Confirmed', 3, 'No special requests'),
    (9, '2025-04-18 19:30:00', 9, 'Cancelled', 4, 'Window seat, special celebration'),
    (10, '2025-04-19 17:00:00', 10, 'Confirmed', 2, 'Private corner for meeting'),
    (11, '2025-04-20 20:30:00', 11, 'Confirmed', 1, 'No special requests'),
    (12, '2025-04-21 12:00:00', 12, 'Pending', 2, 'Quiet seating area'),
    (13, '2025-04-22 19:00:00', 13, 'Confirmed', 4, 'Table near bar'),
    (14, '2025-04-23 17:30:00', 14, 'Cancelled', 5, 'Special diet requirement'),
    (15, '2025-04-24 13:15:00', 15, 'Confirmed', 3, 'Access for wheelchair'),
    (16, '2025-04-25 18:00:00', 16, 'Confirmed', 4, 'Romantic setup'),
    (17, '2025-04-26 14:30:00', 17, 'Pending', 2, 'Allergy free meal'),
    (18, '2025-04-27 16:45:00', 18, 'Confirmed', 6, 'Near air conditioning'),
    (19, '2025-04-28 12:00:00', 19, 'Confirmed', 3, 'No special requests'),
    (20, '2025-04-29 13:30:00', 20, 'Cancelled', 2, 'Table by the poolside'),
    (21, '2025-05-01 20:00:00', 21, 'Confirmed', 3, 'Vegetarian options'),
    (22, '2025-05-02 18:00:00', 22, 'Pending', 4, 'Special celebration setup'),
    (23, '2025-05-03 15:30:00', 23, 'Confirmed', 5, 'Accessible seating'),
    (24, '2025-05-04 11:45:00', 24, 'Confirmed', 2, 'Table near window'),
    (25, '2025-05-05 19:00:00', 25, 'Cancelled', 3, 'Birthday party'),
    (26, '2025-05-06 14:15:00', 26, 'Confirmed', 2, 'Near outdoor patio'),
    (27, '2025-05-07 16:30:00', 27, 'Pending', 6, 'No special requests'),
    (28, '2025-05-08 13:45:00', 28, 'Confirmed', 3, 'Extra chairs requested'),
    (29, '2025-05-09 20:00:00', 29, 'Confirmed', 2, 'Anniversary dinner'),
    (30, '2025-05-10 12:30:00', 30, 'Cancelled', 4, 'Table near garden'),
    (31, '2025-05-11 17:00:00', 31, 'Confirmed', 5, 'Special diet requirement'),
    (32, '2025-05-12 19:00:00', 32, 'Pending', 2, 'Quiet seating for meeting'),
    (33, '2025-05-13 14:30:00', 33, 'Confirmed', 4, 'Wheelchair accessible'),
    (34, '2025-05-14 20:15:00', 34, 'Confirmed', 3, 'Near the fireplace'),
    (35, '2025-05-15 13:00:00', 35, 'Cancelled', 2, 'Outdoor seating requested'),
    (36, '2025-05-16 17:30:00', 36, 'Confirmed', 5, 'Near the entrance'),
    (37, '2025-05-17 11:30:00', 37, 'Pending', 4, 'Vegetarian meal options'),
    (38, '2025-05-18 20:00:00', 38, 'Confirmed', 6, 'Special celebration request'),
    (39, '2025-05-19 14:30:00', 39, 'Confirmed', 3, 'No special requests'),
    (40, '2025-05-20 13:00:00', 40, 'Cancelled', 2, 'Birthday setup')
;

-- Data Insertion for memberships

INSERT INTO memberships (customer_id, start_date, expiry_date, status, membership_fee, renewal_date)
VALUES
    (1, '2024-01-01', '2025-01-01', 'Active', 1000, '2025-01-01'),
    (2, '2024-02-01', '2025-02-01', 'Expired', 1200, '2025-02-01'),
    (3, '2024-03-01', '2025-03-01', 'Inactive', 1500, '2025-03-01'),
    (4, '2024-04-01', '2025-04-01', 'Active', 900, '2025-04-01'),
    (5, '2024-05-01', '2025-05-01', 'Active', 1100, '2025-05-01'),
    (6, '2024-06-01', '2025-06-01', 'Expired', 950, '2025-06-01'),
    (7, '2024-07-01', '2025-07-01', 'Active', 1150, '2025-07-01'),
    (8, '2024-08-01', '2025-08-01', 'Inactive', 1250, '2025-08-01'),
    (9, '2024-09-01', '2025-09-01', 'Expired', 1050, '2025-09-01'),
    (10, '2024-10-01', '2025-10-01', 'Active', 1300, '2025-10-01'),
    (11, '2024-11-01', '2025-11-01', 'Inactive', 1400, '2025-11-01'),
    (12, '2024-12-01', '2025-12-01', 'Active', 950, '2025-12-01'),
    (13, '2025-01-01', '2026-01-01', 'Expired', 1200, '2026-01-01'),
    (14, '2025-02-01', '2026-02-01', 'Active', 1100, '2026-02-01'),
    (15, '2025-03-01', '2026-03-01', 'Inactive', 1050, '2026-03-01'),
    (16, '2025-04-01', '2026-04-01', 'Active', 1200, '2026-04-01'),
    (17, '2025-05-01', '2026-05-01', 'Expired', 950, '2026-05-01'),
    (18, '2025-06-01', '2026-06-01', 'Active', 1000, '2026-06-01'),
    (19, '2025-07-01', '2026-07-01', 'Inactive', 1150, '2026-07-01'),
    (20, '2025-08-01', '2026-08-01', 'Expired', 1300, '2026-08-01'),
    (21, '2025-09-01', '2026-09-01', 'Active', 900, '2026-09-01'),
    (22, '2025-10-01', '2026-10-01', 'Expired', 1400, '2026-10-01'),
    (23, '2025-11-01', '2026-11-01', 'Active', 1100, '2026-11-01'),
    (24, '2025-12-01', '2026-12-01', 'Inactive', 950, '2026-12-01'),
    (25, '2026-01-01', '2027-01-01', 'Expired', 1050, '2027-01-01'),
    (26, '2026-02-01', '2027-02-01', 'Active', 1200, '2027-02-01'),
    (27, '2026-03-01', '2027-03-01', 'Inactive', 1300, '2027-03-01'),
    (28, '2026-04-01', '2027-04-01', 'Active', 950, '2027-04-01'),
    (29, '2026-05-01', '2027-05-01', 'Expired', 1150, '2027-05-01'),
    (30, '2026-06-01', '2027-06-01', 'Active', 1100, '2027-06-01'),
    (31, '2026-07-01', '2027-07-01', 'Inactive', 1200, '2027-07-01'),
    (32, '2026-08-01', '2027-08-01', 'Expired', 1000, '2027-08-01'),
    (33, '2026-09-01', '2027-09-01', 'Active', 950, '2027-09-01'),
    (34, '2026-10-01', '2027-10-01', 'Inactive', 1400, '2027-10-01'),
    (35, '2026-11-01', '2027-11-01', 'Expired', 1050, '2027-11-01'),
    (36, '2026-12-01', '2027-12-01', 'Active', 1300, '2027-12-01'),
    (37, '2027-01-01', '2028-01-01', 'Inactive', 1200, '2028-01-01'),
    (38, '2027-02-01', '2028-02-01', 'Active', 1100, '2028-02-01'),
    (39, '2027-03-01', '2028-03-01', 'Expired', 950, '2028-03-01'),
    (40, '2027-04-01', '2028-04-01', 'Inactive', 1400, '2028-04-01')
;

-- Data Insertion for employment_status

INSERT INTO employment_status (employees_id, status)
VALUES
    (1, 'Active'),
    (2, 'On Leave'),
    (3, 'Terminated'),
    (4, 'Active'),
    (5, 'On Leave'),
    (6, 'Active'),
    (7, 'Terminated'),
    (8, 'Active'),
    (9, 'On Leave'),
    (10, 'Active'),
    (11, 'Terminated'),
    (12, 'Active'),
    (13, 'On Leave'),
    (14, 'Active'),
    (15, 'On Leave'),
    (16, 'Terminated'),
    (17, 'Active'),
    (18, 'Active'),
    (19, 'Terminated'),
    (20, 'Active'),
    (21, 'On Leave'),
    (22, 'Active'),
    (23, 'On Leave'),
    (24, 'Terminated'),
    (25, 'Active'),
    (26, 'Active'),
    (27, 'On Leave'),
    (28, 'Terminated'),
    (29, 'Active'),
    (30, 'On Leave'),
    (31, 'Active'),
    (32, 'Terminated'),
    (33, 'Active'),
    (34, 'On Leave'),
    (35, 'Terminated'),
    (36, 'Active'),
    (37, 'Active'),
    (38, 'On Leave'),
    (39, 'Terminated'),
    (40, 'Active')
;

-- Indexes created

--- 1. indexes for WHERE clause used in maximum

create index idx_customers_email on customers(email);

CREATE INDEX idx_customers_gender ON customers(gender);

CREATE INDEX idx_orders_price ON orders(price);

CREATE INDEX idx_feedback_product_id ON feedback(product_id);

--- 2. indexes for JOIN clause used in maximum

create index idx_orders_customers_id on orders(customers_id);

create index idx_employment_status_employees_id on employment_status(employees_id);

create index idx_memberships_customer_id on memberships(customer_id);

--- 3. indexes for ORDER BY / GROUP BY clause used in maximum

CREATE INDEX idx_orders_datetime ON orders(datetime);

CREATE INDEX idx_reservations_num_people ON reservations(number_of_people);

CREATE INDEX idx_products_price ON products(price);

--- 4. indexes for HIGH CARDINALITY used in maximum

CREATE INDEX idx_customers_email ON customers(email);

CREATE INDEX idx_customers_phone ON customers(phone_number);

CREATE INDEX idx_employees_name ON employees(first_name);

--- 5. indexes for FREQUENTLY SEARCHED used in maximum

CREATE INDEX idx_feedback_review ON feedback(review);

CREATE INDEX idx_memberships_status ON memberships(status);

CREATE INDEX idx_reservations_status ON reservations(status);

----------------------------------------
-- Views created

--"View to summarize each customer's total number of orders and total amount spent."

create view customer_order_summary as
    select customers.id as customer_id, first_name, last_name, count(orders.id) as total_orders, sum(orders.price) as total_spent from customers
    Join orders on orders.customers_id = customers.id
    group by customers.id
;

--"View to summarize each customer's feedbacks."

create view total_customers_feedback as
select first_name, last_name, count(feedback.id) as total_feedbacks from customers
join feedback on customers.id = feedback.customer_id
group by customers.id
;

-- View to summarize each customer's feedbacks

create view customers_total_orders_with_total_spendings as
select first_name, last_name, count(orders.id) as total_orders, sum(orders.price) as total_spending from customers
    join orders on orders.customers_id = customers.id
    group by customers.id
;

-- View to show all customers with active memberships and their details

create view customers_active_memberships as
select first_name, last_name, membership as membership_status, start_date as membership_start_date, expiry_date as membership_expriy_date, status as membership_status
from customers
    join memberships on memberships.customer_id = customers.id
    where customers.membership = "Yes"
;

-- View to summarize total items purchased by each customer

create view customers_total_units_purchased as
select first_name, last_name, sum(ordered_products.quantity) as total_products from customers
    join orders on orders.customers_id = customers.id
    Join ordered_products on ordered_products.order_id = orders.id
    group by customers.id
;

-- View to find customers who never placed any order

create view customers_who_placed_order as
select first_name, last_name from customers
    join orders on customers.id = orders.customers_id
;


-- View to list total units bought by each customer

create view total_units_bought_by_customers as
select first_name, last_name, gender, sum(ordered_products.quantity) as total_units_purchased from customers
    join orders on customers.id = orders.customers_id
    join ordered_products on ordered_products.order_id = orders.id
    group by customers.id
    having sum(ordered_products.quantity) > 3
;


-- View to get top 3 spenders among customers with total orders and spending

create view top_3_customers as
select first_name, last_name, sum(orders.price) as total_amount_spent, count(orders.id) as total_orders from customers
    join orders on orders.customers_id = customers.id
    group by customers.id
;

select * from top_3_customers
    order by total_amount_spent desc limit 3
;

