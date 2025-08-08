CREATE TABLE Customers (
    CustomerID INT NOT NULL AUTO_INCREMENT,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255),
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Categories (
    CategoryID INT NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(255),
    Description VARCHAR(255),
    PRIMARY KEY(CategoryID)
);

CREATE TABLE Employees (
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    BirthDate DATE,
    Photo VARCHAR(255),
    Notes VARCHAR(255),
    PRIMARY KEY(EmployeeID)
);

CREATE TABLE Shippers (
    ShipperID INT NOT NULL AUTO_INCREMENT,
    ShipperName VARCHAR(255),
    Phone VARCHAR(255),
    PRIMARY KEY(ShipperID)
);

CREATE TABLE Suppliers (
    SupplierID INT NOT NULL AUTO_INCREMENT,
    SupplierName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255),
    Phone VARCHAR(255),
    PRIMARY KEY(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT,
    PRIMARY KEY(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT, 
    Unit VARCHAR(255),
    Price DECIMAL(5, 2),
    PRIMARY KEY(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT NOT NULL AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY(OrderDetailID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 0, 1

-- 6, 7 -> 5

-- 2, 4 -> 3