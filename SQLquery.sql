-- Select all columns from each table
SELECT * FROM customer_details;
SELECT * FROM exchange_details;
SELECT * FROM product_details;
SELECT * FROM sales_details;
SELECT * FROM stores_details;


-- 1. Overall female count
SELECT COUNT(Gender) AS Female_count
FROM customer_details
WHERE Gender = 'Female';

--2. overall male count
SELECT COUNT(Gender) AS Male_count
FROM customer_details
WHERE Gender = 'Male';

--3. Overall selling amount
SELECT SUM(Unit_Price_USD * sd.Quantity) AS total_sales_amount
FROM product_details pd
JOIN sales_details sd ON pd.ProductKey = sd.ProductKey;

--4.Total Revenue by Gender
SELECT Gender, SUM(Quantity * Unit_Price_USD) As TotalRevenue
From sales_details s
JOIN product_details p ON s.ProductKey 
= p.ProductKey
JOIN customer_details c ON 
s.CustomerKey = c.CustomerKey
GROUP BY c.Gender ORDER BY 
TotalRevenue DESC

--5. Total sales revenue brand  wise
SELECT p.Brand ,p.Subcategory, (s.Quantity * p.Unit_Price_USD) AS TotalRevenue
FROM sales_details s 
join product_details p on s.ProductKey = p.ProductKey
join customer_details c on s.CustomerKey =c.CustomerKey
group by p.Brand,p.Subcategory, s.Quantity, p.Unit_Price_USD order by TotalRevenue DESC;

--6.store count
SELECT * FROM stores_details;
select Country,State,count(All Square_Meters) 
from stores_details
group by Country,State,Square_Meters;

--7.year wise revenue
SELECT p.productKey, p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date,
sum(s.Quantity * p.Unit_Price_USD) as
Totalrevenue
FROM product_details p inner join sales_details s
on p.productKey =s.productKey
group by p.productKey,
p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date;

--8.City and Gender wise customer count
SELECT City,Gender, COUNT(*) AS customer_count from customer_details
AS Count group by City,Gender order by customer_count DESC;

--9.count of customer by city
SELECT Continent,Country,State,City,
Count(CustomerKey) As Customer_count
from customer_details
group by Continent,Country,State,City
order by Customer_count DESC

--10.Highest ordered quantity of product category
SELECT Product_Name,Category,Unit_Cost_USD,
Unit_Price_USD, Quantity,(p.Unit_Price_USD * s. Quantity) as TotalRevenue
from sales_details as s join product_details as p on s.ProductKey = p.ProductKey 
order by TotalRevenue DESC;

--11.Top 10 total revenue by product name
SELECT p.Product_Name,
Unit_Price_USD,
s.Quantity,
sum(p.Unit_Price_USD * s. Quantity) as TotalRevenue 
from sales_details s
join product_details as p on s.ProductKey = p.ProductKey
join customer_details c on c.CustomerKey = s.CustomerKey
group by Product_Name,Unit_Price_USD,
s.Quantity
order by TotalRevenue  DESC;

--12.Month wise order performance
select p.productKey, p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date,
sum(s.Quantity * p.Unit_Price_USD) as
Totalrevenue
FROM product_details p inner join sales_details s
on p.productKey =s.productKey
group by p.productKey,
p.Product_Name,
p.Unit_Price_USD,
p.Unit_Cost_USD,
s.Quantity,
s.Order_Date;

