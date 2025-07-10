-- Q1.고객(Customers)의 이름과 국가를 조회
SELECT CustomerName, Country
FROM Customers;

-- Q2.고객(Customers)의 정보 전체조회
SELECT *
FROM Customers;

-- Q3.고객(Customers)의 국가(Country) 목록조회(중복x)
SELECT DISTINCT Country
FROM Customers;

-- Q4.국가(Country)가 France 인 고객(Customers)조회
SELECT CustomerName, Country
FROM Customers
WHERE Country = 'France';

-- Q5.고객(Customers)테이블에서 이름(ContactName)이 ‘Mar’로 시작하는 직원조회
SELECT ContactName
FROM Customers
WHERE ContactName LIKE 'Mar%';

-- Q6.고객(Customers)테이블에서 이름(ContactName) 이 ‘et’로 끝나는 직원조회
SELECT ContactName
FROM Customers
WHERE ContactName LIKE '%et';

-- Q7.국가(Country)가 France이고 이름(ContactName)이 ‘La’로 시작하는고객(Customers)조회
SELECT ContactName
FROM Customers
WHERE Country = 'France' and ContactName LIKE 'La%';

-- Q8.국가(Country)가 France이거나 이름(ContactName)이 ‘La’로 시작하는 고객(Customers)조회
SELECT ContactName, Country
FROM Customers
WHERE Country = 'France' or ContactName LIKE 'La%';

-- Q9.국가(Country)가 France가 아닌 고객(Customers)조회
SELECT CustomerName, Country
FROM Customers
WHERE NOT Country = 'France';

-- Q10.국가(Country)가 France 혹은 Spain에사는 고객(Customers)조회
SELECT CustomerID, Country
FROM Customers
WHERE Country IN ('France', 'Spain');

-- Q11.가격(Price)이 15에서 20사이인 상품(Products)조회
SELECT ProductName, Price
FROM Products
WHERE Price BETWEEN 15 AND 20;

-- 고객의 우편번호가 빈 문자열인 데이터를 NULL로 바꾸기
UPDATE Customers SET PostalCode=NULL WHERE PostalCode = '';

-- Q12.우편번호(PostalCode)가 NULL인 고객(Customers)조회
SELECT ContactName, PostalCode
FROM Customers
WHERE PostalCode IS NULL;

-- Q13.우편번호(PostalCode)가 NULL이 아닌 고객(Customers)조회
SELECT ContactName, PostalCode
FROM Customers
WHERE PostalCode IS NOT NULL;

-- Q14.고객이름(CustomerName) 오름차순조회
SELECT ContactName
FROM Customers
ORDER BY ContactName ASC;

-- Q15.상품가격(Price) 내림차순조회
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

-- Q16.10명만 조회
SELECT CustomerID, ContactName
FROM Customers
LIMIT 10;

-- Q17.그 다음 10명조회
SELECT CustomerID, ContactName
FROM Customers
LIMIT 10 OFFSET 10;

-- OFFSET으로 Pagnation 구현하는법 예시
size = 10;
page = 1;

LIMIT size 
OFFSET size * (page-1)

-- Q18.상품가격(Price)이 30미만이면 '저', 30~50이면 '중', 50 초과는‘고’로조회
SELECT Price,
    CASE
        WHEN Price < 30 THEN '저'
        WHEN Price <= 50 THEN '중'
        ELSE '고'
    END
FROM Products;

-- Q19.위 조회한 CASE의 이름을 ‘Level’으로 바꿔주세요
SELECT Price,
    CASE
        WHEN Price < 30 THEN '저'
        WHEN Price <= 50 THEN '중'
        ELSE '고'
    END AS 'Level'
FROM Products;

-- Q20.국가(Country)가 France에사는 고객(Customers)수 조회
SELECT COUNT(CustomerName) AS 'Franch Customers'
FROM Customers
WHERE Country = 'France';
--COUNT(*)로 하든 column을 넣든 결과 같음

-- Q21.전체상품(Products)의 평균가격(Price)계산
SELECT AVG(Price) AS 'AVG_Price'
FROM Products;

-- Q22.주문상품수량(Quantity) 합계계산
SELECT SUM(Quantity) AS 'total'
FROM OrderDetails;

-- Q23.가격(Price) 최소값조회
SELECT MIN(Price) AS 'MIN_Price'
FROM Products;

-- 집계한 field에 대해서만 계산하고 다른 field는 첫번째 데이터만 나온다
SELECT ProductName, Price
FROM Products
ORDER BY Price ASC
LIMIT 1;

-- Q24.가격(Price) 최대값조회
SELECT MAX(Price) AS 'MAX_Price'
FROM Products;

-- 집계한 field에 대해서만 계산하고 다른 field는 첫번째 데이터만 나온다
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 1;

-- Q25.국가(Country)별 고객 수 조회(고객수 기준 오름차순)
SELECT Country, COUNT(CustomerName) AS 'CustomerCount'
FROM Customers
GROUP BY Country
ORDER BY CustomerCount ASC;

-- Q26.국가(Country)별, 도시(City)별 고객수 조회(고객수 기준내림차순)
SELECT Country, City, COUNT(CustomerName) AS 'CustomerCount'
FROM Customers
GROUP BY Country, City
ORDER BY CustomerCount DESC;

-- Q27.국가(Country)별 고객수를 조회하고 그 중 5명초과인 국가만 조회(고객수기준 내림차순)
SELECT Country, COUNT(CustomerName) AS 'CustomerCount' -- 4
FROM Customers -- 1
GROUP BY Country -- 3
-- WHERE에서는 COUNT()와 같은 집계 함수 사용이 불가능
HAVING COUNT(CustomerName) > 5 -- 5
ORDER BY CustomerCount DESC; -- 6

-- WHERE: 행(row) 단위에서 먼저 데이터를 거르고,
-- HAVING: 그룹(group) 단위로 묶은 후, 집계된 결과에 대해 조건을 거릅니다.