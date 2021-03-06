
CREATE TABLE CustomerBack (
	CustomerID INTEGER UNIQUE NOT NULL,
  	FirstName VARCHAR(15),
  	LastName VARCHAR(15),
  	PRIMARY KEY(CustomerID)
);

PARTITION TABLE CustomerBack ON COLUMN CustomerID;
CREATE PROCEDURE addCustomer AS INSERT INTO CustomerBack VALUES ?,?,?;
PARTITION PROCEDURE addCustomer ON TABLE CustomerBack COLUMN CustomerID;

CREATE STREAM CUSTOMER PARTITION ON COLUMN CustomerID EXPORT TO TARGET test (
   	CustomerID INTEGER NOT NULL,
  	FirstName VARCHAR(15) NOT NULL,
  	LastName VARCHAR(15) NOT NULL
);