create database demoSQL;
use demoSQL;

create table products (
                          id int auto_increment primary key,
                          productCode varchar(50) not null,
                          productName varchar(100),
                          productPrice decimal(10,2),
                          productAmount int,
                          productDescription text,
                          productStatus varchar(50)
);

insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values
    ('P001', 'Keyboard', 25.50, 100, 'Mechanical keyboard', 'Available'),
    ('P002', 'Mouse', 15.00, 150, 'Wireless mouse', 'Available'),
    ('P003', 'Monitor', 120.00, 50, '24-inch LCD monitor', 'Out of Stock');

create unique index idx_product_code on products(productCode);

create index idx_name_price on products(productName, productPrice);

-- Trước khi tạo index
explain select * from products where productCode = 'P001';

-- Sau khi tạo index
explain select * from products where productName = 'Mouse' and productPrice = 15.00;

create view product_view as
select productCode, productName, productPrice, productStatus
from products;

create or replace view product_view as
select productCode, productName, productPrice, productAmount, productStatus
from products;

drop view if exists product_view;

delimiter //
create procedure getAllProducts()
begin
select * from products;
end //
delimiter ;

delimiter //
create procedure addProduct(
    in p_code varchar(50),
    in p_name varchar(100),
    in p_price decimal(10,2),
    in p_amount int,
    in p_description text,
    in p_status varchar(50)
)
begin
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values (p_code, p_name, p_price, p_amount, p_description, p_status);
end //
delimiter ;

delimiter //
create procedure updateProductById(
    in p_id int,
    in p_code varchar(50),
    in p_name varchar(100),
    in p_price decimal(10,2),
    in p_amount int,
    in p_description text,
    in p_status varchar(50)
)
begin
update products
set
    productCode = p_code,
    productName = p_name,
    productPrice = p_price,
    productAmount = p_amount,
    productDescription = p_description,
    productStatus = p_status
where id = p_id;
end //
delimiter ;

delimiter //
create procedure deleteProductById(in p_id int)
begin
delete from products where id = p_id;
end //
delimiter ;

call getAllProducts();

call addProduct('P004', 'Webcam', 45.00, 75, 'HD webcam', 'Available');

call updateProductById(1, 'P001', 'Gaming Keyboard', 29.99, 90, 'RGB mechanical keyboard', 'Available');

call deleteProductById(3);