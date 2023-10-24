CREATE TABLE PRODUCT (
    PROD_ID INT primary key generated always as identity,
    PROD_NAME VARCHAR(50) NOT NULL,
    PROD_PRICE DECIMAL(10,2) NOT NULL,
    PROD_STOCK INT NOT NULL,
    PROD_IMAGE VARCHAR(2400),
    DATE_CREATED DATE NOT NULL,
    PROD_DESC VARCHAR(3000)
);

CREATE TABLE SPECIFICATION (
    SPEC_ID INT primary key generated always as identity,
    SPEC_NAME VARCHAR(50)
);

CREATE TABLE PRODUCT_SPECIFICATION (
    PROD_SPEC_ID INT primary key generated always as identity,
    PROD_ID INT NOT NULL,
    SPEC_ID INT NOT NULL,
    SPEC_VALUE VARCHAR(100),

    foreign key(PROD_ID) references PRODUCT(PROD_ID),
    foreign key(SPEC_ID) references SPECIFICATION(SPEC_ID)
);

CREATE TABLE IMAGE(
    IMAGE_ID INT primary key generated always as identity,
    PROD_ID INT,
    IMAGE_URL VARCHAR(2400),
    foreign key(PROD_ID) references PRODUCT(PROD_ID)
);

INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('Product Type');
INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('Brand');
INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('Model');
INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('Processor');
INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('Storage Capacity');
INSERT INTO NBUSER.SPECIFICATION (SPEC_NAME) 
	VALUES ('RAM');


INSERT INTO NBUSER.PRODUCT (PROD_NAME, PROD_PRICE, PROD_STOCK, PROD_IMAGE, DATE_CREATED, PROD_DESC) 
	VALUES ('Test Product RandomName Lol', 10.50, 20, 'images/test.png', CURRENT_DATE, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tincidunt sed metus vitae porttitor. Etiam eleifend neque nulla, sit amet interdum velit interdum mattis. In purus massa, elementum in semper vitae, convallis sed nisl. Suspendisse suscipit velit porta sapien vestibulum, eu accumsan turpis finibus. Donec fermentum orci ut elementum placerat. Nulla sed imperdiet mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada, quam eu venenatis mattis, leo lectus tempus eros, nec pellentesque diam metus ac lorem. Vivamus non commodo lacus. Integer et convallis leo. Maecenas venenatis vulputate metus, eu aliquam nisi malesuada eu. Nulla urna elit, porta feugiat efficitur ut, bibendum non urna.');
INSERT INTO NBUSER.PRODUCT (PROD_NAME, PROD_PRICE, PROD_STOCK, PROD_IMAGE, DATE_CREATED, PROD_DESC) 
	VALUES ('Test Product Random Name k', 99.99, 10, 'images/test3.jfif', CURRENT_DATE, 'Test dscription');
INSERT INTO NBUSER.PRODUCT (PROD_NAME, PROD_PRICE, PROD_STOCK, PROD_IMAGE, DATE_CREATED, PROD_DESC) 
	VALUES ('Test Product Random Name kk', 2.00, 9, 'images/test2.jfif', CURRENT_DATE, 'description for kk');
INSERT INTO NBUSER.PRODUCT (PROD_NAME, PROD_PRICE, PROD_STOCK, PROD_IMAGE, DATE_CREATED, PROD_DESC) 
	VALUES ('Test Product Random Name j', 9.80, 13, 'images/test4.jpg', CURRENT_DATE, 'Description for name j');


INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (1, 1, 'Tablet');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (1, 2, 'Samsung');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (1, 4, 'utx-0293049');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (1, 5, '8gb');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (1, 6, '128gb');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (2, 1, 'Phone');
INSERT INTO NBUSER.PRODUCT_SPECIFICATION (PROD_ID, SPEC_ID, SPEC_VALUE) 
	VALUES (2, 2, 'Apple');




-- DROP TABLE IMAGE;
-- DROP TABLE PRODUCT_SPECIFICATION;
-- DROP TABLE PRODUCT;
-- DROP TABLE SPECIFICATION;