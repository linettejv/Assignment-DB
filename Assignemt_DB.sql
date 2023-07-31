create table users
(
	"id" uuid not null default uuid_generate_v4(),
	"name" character varying not null,
	"address" character varying not null,
	"phone" character varying not null,
	"email" character varying not null,
	"password" character varying not null,
	 constraint "PK_userid" primary key ("id")
)

create table products
(
	"id" uuid not null default uuid_generate_v4(),
	"name" character varying not null,
	"description" character varying ,
	"price"  float  not null,
	"sku" character varying not null,
	 constraint "PK_productid" primary key ("id")
)

create table category
(
	"id" uuid not null default uuid_generate_v4(),
	"cat_name" character varying not null,
	 constraint "PK_categoryid" primary key ("id")
)

create table prod_cat
(
	"product_id" uuid not null ,
	"cat_id" uuid not null 
)

create table orders
(
	"order_id" uuid not null default uuid_generate_v4(),
	"user_id" uuid not null,
	"add_id" uuid not null,
	"total_price" float,
	constraint "PK_order_id" primary key ("order_id")

)


create table order_products
(
	"order_id" uuid not null,
	"quantity" integer,
	"prod_id" uuid not null
)

create table order_address(
"id" uuid not null default uuid_generate_v4(),
"house_name" character varying,
"city"  character varying,
"country" character varying,
"pincode" character varying,
constraint "PK_addressidpkconstraint" primary key ("id"));


INSERT INTO "Assignment".users
(id, "name", address, phone, email, "password")
VALUES(uuid_generate_v4(), 'Devi', 'guruvayoor', '3652452846', 'devi@gmail.com', 'password');

INSERT INTO "Assignment".users
(id, "name", address, phone, email, "password")
VALUES(uuid_generate_v4(), 'linette', 'thrissur', '7955027027', 'linu@gmail.com', '3030330');

INSERT INTO "Assignment".users
(id, "name", address, phone, email, "password")
VALUES(uuid_generate_v4(), 'martho', 'pala', '77002760', 'martho@gmail.com', '2050');


INSERT INTO "Assignment".products
(id, "name", description, price, sku)

VALUES(uuid_generate_v4(), 'pears', 'small', 40, '2'),
(uuid_generate_v4(), 'fiama', 'medium', 80, '6');

select * from product ;

ALTER TABLE order_products  RENAME to "order_product";

INSERT INTO "Assignment".product
(id, "name", description, price, sku)
VALUES(uuid_generate_v4(), 'parker', '', 70, '2'),
(uuid_generate_v4(), 'hero', '', 30, '6');

INSERT INTO "Assignment".category
(id, cat_name)
VALUES(uuid_generate_v4(), 'soap'),
(uuid_generate_v4(), 'pen');

INSERT INTO "Assignment".order_address
(id, house_name, city, country, pincode)
VALUES(uuid_generate_v4(), 'ahouse', 'thrissur', 'India', '6585858');

select * from product ;
select * from "user" ;

delete from "user" where "id" ='8236d05b-bf33-4bcd-8914-c4b391d0bbc1';

select * from category;

select * from order_address ;


INSERT INTO "Assignment".order_address
(id, house_name, city, country, pincode)
VALUES(uuid_generate_v4(), 'meledath', 'Koyilandi', 'India', '4524758'),
(uuid_generate_v4(), 'thazhedath', 'ollur', 'India', '8265750'),
(uuid_generate_v4(), 'kizhkedath', 'pala', 'India', '658659'),
(uuid_generate_v4(), 'thekedath', 'uzhavoor', 'India', '683585');

alter table prod_cat rename to product_category;

alter table category  
rename column category_id  to category_name;

select * from product ;
select * from category ;
select * from "user" ;
select * from order_address ;

INSERT INTO "Assignment".product_category
(product_id, category_id)
VALUES('f695f5be-c6f8-4682-9b94-658cacc5be0a', 'af34b84c-8d14-4ef9-959f-5244c903bf54'),
('d8f947de-e914-4a5d-9d03-9414ef8ba500','af34b84c-8d14-4ef9-959f-5244c903bf54'),
('74ab5740-c4d4-4a77-baa3-d8a679c7312b','af34b84c-8d14-4ef9-959f-5244c903bf54'),
('d81fd372-b71f-4a67-8a7a-7f56af3476e6','b82bc3fb-fcc6-4648-9d29-dcc6ac3c8f4c'),
('42a76356-9aad-446d-9b90-b31651b80570','b82bc3fb-fcc6-4648-9d29-dcc6ac3c8f4c');

INSERT INTO "Assignment"."order"
(order_id, user_id, address_id, total_price)
VALUES(uuid_generate_v4(), 'fd6b0011-4498-42bc-b45d-6164122648b7', 'bf4df6d5-780d-4060-b02c-e1fb8828a681', 300),
(uuid_generate_v4(),'e23306b0-e370-4c4c-820d-a56008e3edae' , '77aafaa7-0c0b-4cdc-82db-26d1b5b4db85', 2000),
(uuid_generate_v4(),'76725b07-cdab-4045-9ef5-c9e8f9342b79' , 'ed6c4456-f801-4a05-bc20-d0b67980dfeb', 2001),
(uuid_generate_v4(), 'fd6b0011-4498-42bc-b45d-6164122648b7', '3a6d855e-aff3-4528-bc4f-31996a23c828', 330),
(uuid_generate_v4(), 'e23306b0-e370-4c4c-820d-a56008e3edae', '77aafaa7-0c0b-4cdc-82db-26d1b5b4db85', 1245);

create index "product_name" on product ("name");
create index "category_name" on category ("category_name");

-- all orders(product name) of user linette and display their addresses:
select u.name,p.name
from "user" u 
inner join "order" o on o.user_id = u.id 
inner join order_product op on op.order_id  = o.order_id 
inner join product p on op.product_id = p.id 
where u."name" = 'linette'



select * from order_product ;

select * from "order" ;
select * from product ;

INSERT INTO "Assignment".order_product
(order_id, quantity, product_id)
VALUES('800d76f4-0429-4d15-9aa8-edc74bf2c382', 0, 'd8f947de-e914-4a5d-9d03-9414ef8ba500'),('051e1b89-3992-4557-affc-a691cad16939', 0, 'f695f5be-c6f8-4682-9b94-658cacc5be0a'),
('8949e5ce-0e0c-4550-8597-bce6d2575da6', 0, 'd81fd372-b71f-4a67-8a7a-7f56af3476e6'),('acf93a15-0d7a-464f-b1f4-574e5cc3a884', 0, '74ab5740-c4d4-4a77-baa3-d8a679c7312b'),
('ebfb61de-8eef-4f2a-9dc0-e87eb71f01dd', 0, 'f695f5be-c6f8-4682-9b94-658cacc5be0a');






