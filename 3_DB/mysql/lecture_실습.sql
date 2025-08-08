-- SQL 실행순서
FROM and JOIN
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT

-- 실습 1) 아래 테이블을 두개 만들어주세요
CREATE TABLE Students (
    StudentID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255),
    Age INT,
    Address VARCHAR(255),
    PRIMARY KEY(StudentID)
);

CREATE TABLE Grades (
    StudentID INT,
    Math INT,
    English INT,
    Science INT
);

-- 실습 2) 각 테이블에 데이터를 입력해주세요
INSERT INTO Students (Name, Age, Address)
    VALUES ('홍길동', 30, '인천'),
            ('이연걸', 60, '서울'),
            ('이몽룡', 42, '대전'),
            ('성춘향', 27, '경기');

INSERT INTO Grades (StudentID, Math, English, Science)
    VALUES (1, 90, 80, 50),
    (2, 69, 76, 65),
    (3, 98, 87, 97),
    (4, 87, 67, 79);

-- Q1. 직원(Employees) 중 LastName이 'King'인 직원의 이름(Name), 생일(BirthDate), 노트(Notes)를 조회
SELECT FirstName, BirthDate, Notes
FROM Employees
WHERE LastName = 'King';

-- Q2. 상품명(ProductName)이 'C'로 시작하고 가격(Price)이 20보다 큰 상품의 이름과 가격을 가격순으로 조회
SELECT ProductName, Price
FROM Products
WHERE ProductName LIKE 'C%' AND Price > 20
ORDER BY Price DESC;

-- Q3. 각 CategoryID별로 총 상품 가격의 합, 최대 가격, 최소 가격 구하기
SELECT CategoryID, SUM(Price), MAX(Price), MIN(Price)
FROM Products
GROUP BY CategoryID;

-- Q4. 상품(Products)의 카테고리 아이디(CategoryID)별로 상품개수와 상품개수가 10개가 넘을경우 많음 아니면 적음이표시되어있는 칼럼을 하나추가하고 상품수가 많은순서대로 조회해주세요
SELECT CategoryID, COUNT(*) AS ProductCount,
    CASE
        WHEN COUNT(*) > 10 THEN '많음'
        ELSE '적음'
    END AS Level
FROM Products
GROUP BY CategoryID
ORDER BY ProductCount DESC;

-- Q5. 국가(Country)별 고객 수와 백분율 구하기
SELECT
    Country,
    COUNT(*) AS Total,
    COUNT(*)/(SELECT COUNT(*) FROM Customers) * 100 AS Percentage
FROM Customers
GROUP BY Country;

-- Q6. 주문이력이 있는 고객명(CustomerName)과 주문일(OrderDate)를 조회
SELECT C.CustomerName, O.OrderDate
FROM Customers AS C INNER JOIN Orders AS O 
ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NOT NULL;

-- Q7. Tokyo에 위치한 공급자(Supplier)가 생산한 상품(Products) 목록 조회
SELECT S.City, P.*
FROM Suppliers AS S INNER JOIN Products AS P 
ON S.SupplierID = P.SupplierID
WHERE S.City = 'Tokyo';

-- Q8. 분류(CategoryName)가 'Seafood'인 상품명(ProductName) 조회
SELECT C.CategoryName, P.ProductName
FROM Categories C INNER JOIN Products P
ON C.CategoryID = P.CategoryID
WHERE C.CategoryName = 'Seafood';

-- Q9.  공급자(Supplier)가 공급한 상품의 공급자 국가(Country),카테고리별로 상품건수와 평균가격조회
SELECT S.Country, C.CategoryName, COUNT(*), AVG(P.Price)
FROM Suppliers S JOIN Products P 
    ON S.SupplierID = P.SupplierID
    Products P JOIN Categories C
    ON P.CategoryID = C.CategoryID
GROUP BY S.Country, C.CategoryID;

-- *Q10. 주문별 고객명(CustomerName), 직원명(LastName), 배송업체명(ShipperName), 주문 상세 건수 조회
SELECT c.CustomerName, e.LastName, s.ShipperName, COUNT(*) AS 'Total OrderDetail!'
FROM OrderDetails AS od
    JOIN Orders AS o ON od.OrderID = o.OrderID 
    JOIN Customers AS c ON o.CustomerID = c.CustomerID
    JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
    JOIN Shippers AS s ON o.ShipperID = s.ShipperID
GROUP BY od.OrderID;

-- Q11. 판매량(Quantity)기준 TOP3 공급자(Supplier) 조회
SELECT s.SupplierName, SUM(od.Quantity) AS total
FROM Suppliers s JOIN Products p ON s.SupplierID = p.SupplierID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY s.SupplierID
ORDER BY total DESC
LIMIT 3;

-- Q12. 상품분류(Category)별, 고객지역별(City)판매량 많은 순 정렬
SELECT ca.CategoryName, c.City, SUM(od.Quantity) AS total
FROM OrderDetails od 
    JOIN Orders o
    ON od.OrderID = o.OrderID
    JOIN Customers c 
    ON c.CustomerID = o.CustomerID
    JOIN Products p
    ON p.ProductID = od.ProductID
    JOIN Categories ca
    ON ca.CategoryID = p.CategoryID
GROUP BY ca.CategoryID, c.City
ORDER BY total DESC;

-- Q13. 고객국가(Country)가 USA이고, 상품별판매량(Quantity)의 합이 많은순으로정렬
SELECT p.ProductName, SUM(Quantity) AS total
FROM OrderDetails od
    JOIN Products p 
    ON od.ProductID = p.ProductID
    JOIN Orders o
    ON od.OrderID = o.OrderID
    JOIN Customers c 
    ON od.CustomerID = c.CustomerID
WHERE c.Country = 'USA'
GROUP BY p.ProductID
-- HAVING c.Country = 'USA'
-- HAVING 절은 집계한 값이나 GROUP BY한 대상을 기준으로만 조건문 사용 가능
ORDER BY total DESC;
