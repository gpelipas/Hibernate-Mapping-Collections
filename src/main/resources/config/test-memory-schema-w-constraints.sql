CREATE MEMORY TABLE USERS (
	USER_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,USER_LOGINNAME VARCHAR(30)
	,USER_PASSWORD VARCHAR(30)
	,USER_EMAIL VARCHAR(70)
	);

CREATE MEMORY TABLE CUSTOMER (
	USER_ID	BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,CUSTOMER_FIRSTNAME VARCHAR(60)
	,CUSTOMER_LASTNAME VARCHAR(60)
	,CONSTRAINT CUST_USERS_FK FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
	);

CREATE MEMORY TABLE ADDRESS (
	ADDRESS_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,ADDRESS_ADDRESS1 VARCHAR(255)
	,ADDRESS_ADDRESS2 VARCHAR(255)
	,ADDRESS_CITY VARCHAR(50)
	,ADDRESS_STATE VARCHAR(50)
	,ADDRESS_ZIP VARCHAR(15)
	,USER_ID BIGINT NOT NULL
	,CONSTRAINT ADDRESS_CUST_FK FOREIGN KEY (USER_ID) REFERENCES CUSTOMER(USER_ID)
	);

--CREATE MEMORY TABLE CATEGORY (
--	CATEGORY_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
--	,CATEGORY_NAME VARCHAR(255)
--	);

CREATE MEMORY TABLE ORDER_ITEM (
	ORDER_ITEM_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,ORDER_ITEM_QUANTITY INT
	,ORDER_ID BIGINT 
	,PRODUCT_ID BIGINT NOT NULL
	);

CREATE MEMORY TABLE PRODUCT (
	PRODUCT_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,PRODUCT_NAME VARCHAR(255)
	,PRODUCT_PRICE DOUBLE
	,PRODUCT_DESCRIPTION VARCHAR(255)
	);

--CREATE MEMORY TABLE PRODUCT_CATEGORIES (
--	PRODUCT_ID BIGINT NOT NULL
--	,CATEGORY_ID BIGINT NOT NULL
--	,PRIMARY KEY (
--		PRODUCT_ID
--		,CATEGORY_ID
--		)
--	,CONSTRAINT CAT_PRODUCT_FK FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
--	,CONSTRAINT PRODUCT_CAT_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
--	);

CREATE MEMORY TABLE ORDERS (
	ORDER_ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY
	,ORDER_SUBTOTAL DOUBLE
	,ORDER_TAX DOUBLE
	,ORDER_TOTAL DOUBLE
	,USER_ID BIGINT NOT NULL
	,CONSTRAINT ORDER_CUST_FK FOREIGN KEY (USER_ID) REFERENCES CUSTOMER(USER_ID)
	);

--ALTER TABLE ORDER_ITEM ADD CONSTRAINT FK4BBDE984F8BBB8E0 FOREIGN KEY(PRODUCT_ID) 
--REFERENCES PRODUCT(PRODUCT_ID)

--ALTER TABLE ORDER_ITEM ADD CONSTRAINT FK4BBDE984715B5200 FOREIGN KEY(ORDER_ID) 
--REFERENCES ORDERS(ORDER_ID)

ALTER TABLE CUSTOMER ALTER COLUMN USER_ID RESTART WITH 10

--ALTER TABLE ADDRESS ALTER COLUMN ADDRESS_ID RESTART WITH 1

---ALTER TABLE CATEGORY ALTER COLUMN CATEGORY_ID RESTART WITH 6

--ALTER TABLE ORDER_ITEM ALTER COLUMN ORDER_ITEM_ID RESTART WITH 1

--ALTER TABLE PRODUCT ALTER COLUMN PRODUCT_ID RESTART WITH 7

--ALTER TABLE ORDERS ALTER COLUMN ORDER_ID RESTART WITH 1

