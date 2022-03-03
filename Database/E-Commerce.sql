--Assignment


--# user table that store the details of customer and admin and also the permissions details
    CREATE TABLE User(
      user_id SERIAL PRIMARY KEY,
      user_name varchar(100),
      email varchar(100),
      phone int,
      age int,
      gender varchar(20),
      is_admin bool,
      is_customer bool,
      is_add_detail bool,
      is_delete_detail bool,
    );

insert into User_table (user_name,email,phone,age, gender, is_admin,is_customer, is_add_detail, is_delete_detail)
values ('rahul','rahul@gmail.com','7888978796',34,'Male',true,true,true,true);


--# category that store the details of categoey and the details of admin by which it is created 
    CREATE TABLE category(
      category_id SERIAL PRIMARY KEY,
      category_name varchar(255),
      user_id int REFERENCES User(user_id),  ----> User table (FK)

    );

insert into category (category_name, user_id) values ('Accessories',1);

--# products that come under the category
    CREATE TABLE products(
      product_id SERIAL PRIMARY KEY,
      product_name varchar(255),
      category_id int REFERENCES category(category_id), ----> Category table (FK)
      product_price int,
      status varchar(255) --# in stock or out_of_stock
    );

insert into products (product_name,categoey_id,product_price, status) values
('Asus Laptop',1,40000,'A'),('Dell Laptop',1,40000,'A'),
('Hp Laptop',1,40000,'A'),('Apple Laptop',1,55000,'A');

--# details of billing and order placed
    CREATE TABLE innvoice(
      bill_id SERIAL PRIMARY KEY,
      transaction_id int,
      user_id int REFERENCES User(user_id), -----> User table (FK) customer details
      transaction_amount int,
      payment_mode varchar(255),
      billing_address varchar(255),
      status_of_order varchar(255), --# failed/success 
      date_of_order date
    )

insert into innvoice (transaction_id,user_id,transaction_amount,payment_mode,billing_address,status_of_order,date_of_order)
values
(100,1,50000,'UPI-samyak@sbi','delhi','placed','2021-02-25');
--# details of products order in per orders
    CREATE TABLE orders(
      order_id SERIAL PRIMARY KEY;
      product_id int REFERENCES product(product_id), ----> products table (FK)
      bill_id int REFERENCES innvoice(bill_id), ----> bill details (FK)
      quantity int,
    )

insert into (product_id,bill_id,quantity) values (11,2,1);



-- # Views to see all the products order by a all user

    create  or replace view orderdetails
    as
    select u.id, u.name, n.*, p.*, o.quantity 
        from User u 
    INNER JOIN 
        innvoice n 
    on 
        u.user_id = n.user_id
    INNER JOIN
        orders o 
    on 
        o.bill_id = n.bill_id
    INNER JOIN
        products p
    on 
        p.product_id = o.product_id
    WHERE
        n.status_of_order != 'fail';


-- # 