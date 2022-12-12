
--> Vendor
create table Vendor (
    vendor_id int primary key,
    vendor_name varchar(50),
    vendor_phone varchar(20),
    vender_email varchar(50)
);

INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5000,'Apple',2569561656,'apple@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5100,'Microsoft',6165486561,'microsoft@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5200,'Lenovo',3215689466,'lenovo@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5300,'Asus',9568484613,'asus@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5400,'Dell',8465473132,'dell@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5500,'Monoprice',3189831684,'monoprice@gmail.com');
INSERT INTO Vendor(vendor_id,vendor_name,vendor_phone,vender_email) VALUES (5600,'Sony',4846531876,'sony@gmail.com');

--> Category
create table Category (
    category_id int primary key,
    category_name varchar(50)
);

INSERT INTO Category(category_id,category_name) VALUES (4000,'Laptops');
INSERT INTO Category(category_id,category_name) VALUES (4100,'Mobile phones');
INSERT INTO Category(category_id,category_name) VALUES (4200,'Tablets');
INSERT INTO Category(category_id,category_name) VALUES (4300,'Servers');
INSERT INTO Category(category_id,category_name) VALUES (4400,'PC');
INSERT INTO Category(category_id,category_name) VALUES (4500,'Cables');
INSERT INTO Category(category_id,category_name) VALUES (4600,'Headphones');

--> Product_belong
create table Product_belong (
    product_id int primary key,
    product_name varchar(200),
    description varchar(1000),
    category_id int not null, --> key + participation constrain between entity & belong relationship.
    foreign key (category_id) references Category(category_id)
);

INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1200,4000,'Macbook Pro (2017)','The ultimate pro notebook. MacBook Pro features faster processors upgraded memorythe Apple T2 chipand a Retina display with True Tone technology.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1300,4000,'Macbook Air (2015)','MacBook Air lasts up to an incredible 12 hours between charges So from your morning coffee till your evening commuteyou can work unplugged. When it is time to kick back and relaxyou can get up to 12 hours of iTunes movie playback.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1400,4100,'Iphone X','The iPhone X display is so immersive the device itself disappears into the experience.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1500,4100,'Iphone 7','Great connectivity of this device includes Bluetooth 4.2 version with A2DP');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1600,4100,'Iphone 8','iPhone 8 introduces a glass design. The glass back enables easy wireless charging.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1700,4200,'Ipad Air','4th gen The iPad Air is unbelievably thin and light. And yet it is so much more powerful and capable');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1800,4200,'Ipad Mini 3th gen','3th gen Everything you love about iPad the beautiful screen and fast');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (1900,4300,'ESC8000 G3','G3 High-density GPU server with hybrid computing power. ASUS-patented Adaptable Topology design.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2000,4300,'ESC8000 G4','G4 High performance ASUS 2U server with hybrid-storage design and high power-efficiency');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2100,4400,'XPS 13 - 5080','Thinner and more powerful than ever the Dell XPS reinforces its lofty standing with an 8th Gen Intel Core processor immaculate 4K UHD display and super-slim build.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2200,4400,'XPS 15 - 5070','Ultra-thin and distinctly refined the stylish Dell Inspiron gives definitive elegance to a powerful and expansive PC experience.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2300,4500,'Monoprice Ultra Slim Series High Speed HDMI Cable','The Monoprice Ultra Slim Active High Speed HDMI Cable series is designed with the thinnest TVs in mind');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2400,4500,'Monoprice Ultra Slim Series High Speed HDMI Cable - 4K','Monoprice Commercial Cable supports the following HDMI features: 4K resolution at 24Hz. 3D video.');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2500,4600,'Avantree HT3189 Wireless Headphones','Avantree HT3189 Wireless Headphones for TV Watching & PC Gaming with Bluetooth');
INSERT INTO Product_belong(product_id,category_id,product_name,description) VALUES (2600,4600,'COWIN E7 PRO','Active Noise Cancelling Headphone Bluetooth Headphones with Microphone Hi-Fi Deep Bass Wireless Headphones Over Ear 30H Playtime for Travel Work TV Computer Phone');


--> Product_sold_vendor
create table Product_sold_vendor (
    vendor_id int,
    product_id int,
    primary key (vendor_id, product_id),
    foreign key (vendor_id) references Vendor(vendor_id),
    foreign key (product_id) references Product_belong(product_id)
);

INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5000,1200);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5000,1300);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5100,1400);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5100,1500);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5100,1600);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5200,1700);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5200,1800);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5300,1900);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5300,2000);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5400,2100);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5400,2200);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5500,2300);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5500,2400);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5600,2500);
INSERT INTO Product_sold_vendor(vendor_id,product_id) VALUES (5600,2600);


--> Users
create table Users (
    user_id int primary key,
    username varchar(20),
    password varchar(20),
    full_name varchar(30),
    address varchar(100),
    email varchar(30),
    phone varchar(20)
);

INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (100,'anna0','white00','Anna Addison','1325 Candy Rd, San Francisco, CA 96123','anna.addison@yahoo.com',3841019535);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (101,'carol1','orange01','Carol Campbell','1931 Brown St, Gainesville, FL 85321','carol.campbell@aol.com',2548952651);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (102,'julia2','yellow02','Julia Jones','1622 Seaside St, Seattle, WA 32569','jolie.jones@msn.com',3651469235);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (103,'irene3','blue03','Irene Everly','1756 East Dr, Houston, TX 28562','irene.everly@gmail.com',9859423698);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (104,'rachel4','red04','Rachel Rose','1465 River Dr, Boston, MA 43625','rachel.rose@hotmail.com',2945632543);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (105,'sophie5','green05','Sophie Sutton','1896 West Dr, Portland, OR 65842','sophie.sutton@yahoo.com',5169525614);
INSERT INTO Users(user_id,username,password,full_name,address,email,phone) VALUES (106,'wendy6','purple06','Wendy West','1252 Vine St, Chicago, IL 73215','wendy.west@gmail.com',6645936156);


--> Carts_has_products_options
create table Carts_has_products_options(
   shopping_cart_id int,
   quantity int,
   product_id int,
   option_id int,
   primary key (shopping_cart_id, product_id,option_id,quantity)
);

INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3000,1200,1201,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3000,1200,1202,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3000,1300,1301,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3000,1300,1302,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3100,1400,1401,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3100,1400,1402,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3100,1500,1501,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3100,1500,1502,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3200,1600,1601,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3200,1600,1602,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3200,1700,1701,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3200,1700,1702,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3300,1800,1801,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3300,1800,1802,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3300,1900,1901,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3300,1900,1902,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2000,2001,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2000,2002,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2100,2101,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2100,2102,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2200,2201,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3400,2200,2202,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3500,2300,2301,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3500,2300,2302,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3500,2400,2401,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3500,2400,2402,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3600,2500,2501,3);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3600,2500,2502,1);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3600,2600,2601,2);
INSERT INTO Carts_has_products_options(shopping_cart_id,product_id,option_id,quantity) VALUES (3600,2600,2602,1);


--> Options_associated_with (we cannot represent the the participation constraint from product to options via "associated with" relationship.)
create table Options_associated_with(
    option_id int primary key,
    option_name varchar(300),
    product_id int not null, --> to accomodate the key + participation constraint between option and relationship associated with to products, we combine "associated with" and options, and bring in product_id.
    quantity int,
    price int, 
    on_sale bit,
    specs varchar(300),
    foreign key (product_id) references Product_belong(product_id)
);

INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1201,'Macbook Pro 13.3-inch',1200,3,1299,cast(1 as bit),'Macbook Pro 13.3-inch (diagonal) LED-backlit display with IPS technology; 2560-by-1600 native resolution at 227 pixels');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1202,'Macbook Pro 15.4-inch',1200,2,2199,cast(0 as bit),'Macbook Pro 15.4-inch (diagonal) LED-backlit display with IPS technology; 2880-by-1800 native resolution at 220 pixels');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1301,'Macbook Air 11.6-inch',1300,1,999,cast(0 as bit),'Macbook Air 11.6-inch (diagonal) LED-backlit glossy widescreen display with support for millions of colors');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1302,'Macbook Air 13-inch',1300,4,1099,cast(1 as bit),'Macbook Air 13.3-inch (diagonal) LED-backlit glossy widescreen display with support for millions of colors');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1401,'Iphone X 128GB',1400,5,799,cast(1 as bit),'Iphone X Storage capacity 128 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1402,'Iphone X 256GB',1400,7,899,cast(0 as bit),'Iphone X Storage capacity 256 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1501,'Iphone 7 64GB',1500,8,399,cast(0 as bit),'Iphone 7 Storage capacity 64 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1502,'Iphone 7 32GB',1500,9,499,cast(1 as bit),'Iphone 7 Storage capacity 32 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1601,'Iphone 8 64GB',1600,4,599,cast(0 as bit),'Iphone 8 Storage capacity 64 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1602,'Iphone 8 128GB',1600,7,699,cast(1 as bit),'Iphone 8 Storage capacity 128 GB');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1701,'Ipad Air 9.7-inch',1700,20,899,cast(1 as bit),'Ipad Air 9.7-inch (diagonal) LED-backlit Multi-Touch display with IPS technology');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1702,'Ipad Air 12-inch',1700,9,999,cast(0 as bit),'Ipad Air 12-inch (diagonal) LED-backlit Multi-Touch display with IPS technology');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1801,'Ipad Mini 7.9-inch',1800,40,499,cast(1 as bit),'Ipad Mini 7.9-inch (diagonal) LED-backlit Multi-Touch display with IPS technology');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1802,'Ipad Mini 10-inch',1800,100,599,cast(1 as bit),'Ipad Mini 10-inch (diagonal) LED-backlit Multi-Touch display with IPS technology');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1901,'ESC8000 G3 - 8 G Intel Xeon E5-1603 V4(2.80GHz140WL3:10M)',1900,4,650,cast(1 as bit),'ESC4000 G3 Server with 2U 4-GPU Hybrid Computing Power with Mass Storage Capability');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (1902,'ESC8000 G3 - 8 G Intel Xeon E5-1620 v3 (3.5G140WL3:10M4CHT)',1900,6,750,cast(0 as bit),'ESC8000 G4 Server with High-density 4U GPU server support 8 GPUs');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2001,'ESC8000 G4 - 8 G Intel Xeon E5-1603 v3 (3.5G140WL3:10M4CHT)',2000,1,450,cast(0 as bit),'RS100-E8-PI2 Server with Smart compact 1U server');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2002,'ESC8000 G4 - 8 G Intel Xeon E5-1620 v3 (3.5G140WL3:10M4CHT)',2000,2,550,cast(1 as bit),'RS300-E9-PI4 Server with Flagship Model with Versatile Expandability');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2101,'XPS 13 - 5080 8GB LPDDR3 1866MHz',2100,7,1250,cast(1 as bit),'Dell XPS 13 PC with 13.3-inch Intel Core i5-8250U. 8GB memory/128GB SSD');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2102,'XPS 13 - 5080 16GB LPDDR3 1866MHz',2100,1,1650,cast(0 as bit),'Dell XPS 15 PC with 15.6-inch Intel Core i5-7300HQ. 8GB memory/256GB SSD');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2201,'XPS 15- 5070 256GB PCIe Solid State Drive',2200,10,600,cast(0 as bit),'Dell Inspiron 15 PC with 15.6-inch Full HD. Intel Core i5-8250U. 8GB memory/1TB HDD');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2202,'XPS 15- 5070 500GB PCIe Solid State Drive',2200,50,700,cast(1 as bit),'Dell Inspiron 24 PC with 23.8-in Full HD. Intel Core i5-7200U. 8GB memory/1TB SATA');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2301,'Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 1ft',2300,40,15,cast(0 as bit),'Monoprice Ultra Slim 24Hz High Speed HDMI Cable 10Gbps 36AWG YUV 4:2:0 6ft Black');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2302,'Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 1.5ft',2300,30,25,cast(1 as bit),'Monoprice Ultra Slim 60Hz High Speed HDMI Cable 18Gbps 40AWG YUV 6:4:0 8ft Black');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2401,'Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 3ft',2400,1,10,cast(0 as bit),'Monoprice Commercial 32Hz High Speed HDMI Cable 10Gbps 24AWG CL2 6ft Black');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2402,'Monoprice Ultra Slim Series High Speed HDMI Cable - 4K - Length - 5ft',2400,10,20,cast(0 as bit),'Monoprice Commercial 80Hz High Speed HDMI Cable 18Gbps 40AWG CL2 8ft Black');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2501,'COWIN E7 PRO - Black',2500,1,250,cast(1 as bit),'1000XM1 Wireless Headphones 20 Hz 20000 Hz (44 kHz Sampling)/ 20 Hz 40000 Hz (LDAC 96 kHz Sampling 990 kbps)');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2502,'COWIN E7 PRO - Red',2500,20,350,cast(1 as bit),'1200XM3 Wireless Headphones 40 Hz 40000 Hz (54 kHz Sampling)/40 Hz 60000 Hz (LDAC 120 kHz Sampling 800 kbps)');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2601,'COWIN E7 PRO - Pink',2600,9,800,cast(0 as bit),'Sony IER-M7 In-ears Headphone. Driver Unit by Quad-balanced armature. Frequency Response 5 Hz 20000 Hz');
INSERT INTO Options_associated_with(option_id,option_name,product_id,quantity,price,on_sale,specs) VALUES (2602,'COWIN E7 PRO - White',2600,60,900,cast(1 as bit),'Sony IER-M9 In-ears Headphone. Driver Unit by Penta Balanced Armature. Frequency Response 10 Hz 40000 Hz');


--> Orders
create table Orders (
    order_id int primary key,
    total_item int,
    shipping_fee int,
    tax float,
    processing_fee float,
    order_date date,
    delivery_date date,
    ship_name varchar(30),
    ship_address varchar(60),
    tracking_number varchar(10),
    delivery_status bit
);

INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1000,4,7,0.0925,50.02,'2018-10-17','2018-10-20','Anna Addison','1325 Candy Rd San Francisco CA 96123','ZW60001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1001,5,8,0.06,62.45,'2018-10-15','2018-10-18','Carol Campbell','1931 Brown St Gainesville FL 85321','AB61001',cast(0 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1002,7,10,0.087,40.33,'2018-10-14','2018-10-17','Julia Jones','1622 Seaside St Seattle WA 32569','CD62001',cast(0 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1003,9,20,0.0625,70.98,'2018-10-12','2018-10-15','Irene Everly','1756 East Dr Houston TX 28562','KB63001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1004,6,7,0.0625,30.45,'2018-10-16','2018-10-19','Rachel Rose','1465 River Dr Boston MA 43625','IK64001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1005,5,8,0.0625,100.2,'2018-10-13','2018-10-16','Sophie Sutton','1896 West Dr Portland OR 65842','OP65001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1006,3,5,0.1025,58.52,'2018-10-21','2018-10-24','Wendy West','1252 Vine St Chicago IL 73215','XH66001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1007,20,7,0.0925,50.02,'2018-11-17','2018-11-20','Anna Addison','1325 Candy Rd San Francisco CA 96123','ZW60001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1008,15,8,0.06,62.45,'2018-12-15','2018-12-18','Carol Campbell','1931 Brown St Gainesville FL 85321','AB61001',cast(1 as bit));
INSERT INTO Orders(order_id,total_item,shipping_fee,tax,processing_fee,order_date,delivery_date,ship_name,ship_address,tracking_number,delivery_status) VALUES (1009,12,10,0.087,40.33,'2018-12-14','2018-12-17','Julia Jones','1622 Seaside St Seattle WA 32569','CD62001',cast(1 as bit));


--> Order_has_Product (participation constrain between order_has_product and orders cannot be enforced without key constraint)
create table Order_has_Product (
    order_id int,
    product_id int,
    option_id int,
    quantity int,
    primary key (order_id, option_id, product_id),
    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Product_belong(product_id),
    foreign key (option_id) references Options_associated_with(option_id)
);

INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1000,1200,1201,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1000,1200,1202,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1000,1300,1301,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1000,1300,1302,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1001,1400,1401,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1001,1400,1402,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1001,1500,1501,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1001,1500,1502,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1002,1600,1601,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1002,1600,1602,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1002,1700,1701,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1002,1700,1702,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1003,1800,1801,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1003,1800,1802,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1003,1900,1901,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1003,1900,1902,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2000,2001,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2000,2002,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2100,2101,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2100,2102,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2200,2201,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1004,2200,2202,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1005,2300,2301,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1005,2300,2302,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1005,2400,2401,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1006,2400,2402,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1006,2500,2501,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1006,2500,2502,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1006,2600,2601,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1006,2600,2602,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1007,1200,1201,10);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1007,1200,1202,5);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1007,1300,1301,4);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1007,1300,1302,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1400,1401,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1400,1402,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1500,1501,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1500,1502,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1900,1901,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1008,1900,1902,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1600,1601,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1600,1602,2);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1700,1701,3);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1700,1702,4);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1800,1801,1);
INSERT INTO Order_has_Product(order_id,product_id,option_id,quantity) VALUES (1009,1800,1802,1);

--> Orders_placed_user
CREATE TABLE Orders_placed_user(
   user_id  int,
   order_id int,
   primary key(user_id, order_id)
);

INSERT INTO Orders_placed_user(user_id,order_id) VALUES (100,1000);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (101,1001);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (102,1002);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (103,1003);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (104,1004);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (105,1005);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (106,1006);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (100,1007);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (101,1008);
INSERT INTO Orders_placed_user(user_id,order_id) VALUES (102,1009);


--> User_has_creditcard
create table User_has_creditcard (
    credit_card_number bigint,
    user_id int,
    primary key(credit_card_number, user_id),
    foreign key (user_id) references Users(user_id) on delete cascade -- enforced given it is a weak entity
);

INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (100,342467503070813);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (101,348864826937583);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (102,343154796230754);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (103,374076805153960);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (104,343347536655997);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (105,342604471676748);
INSERT INTO User_has_creditcard(user_id,credit_card_number) VALUES (106,377208849059385);


--> Order_paid_CreditCard
create table Orders_paid_creditcard (
    order_id int,
    credit_card_number bigint,
    user_id int,
    primary key (order_id, credit_card_number, user_id), --> given User_has_creditcard is a weak entity, its parent table Users' user_id is also required as part of the primary key
    foreign key (order_id) references Orders(order_id),
    foreign key (credit_card_number, user_id) references User_has_creditcard(credit_card_number, user_id)
);

INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (342467503070813,1000,100);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (348864826937583,1001,101);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (343154796230754,1002,102);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (374076805153960,1003,103);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (343347536655997,1004,104);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (342604471676748,1005,105);
INSERT INTO Orders_paid_creditcard(credit_card_number,order_id,user_id) VALUES (377208849059385,1006,106);