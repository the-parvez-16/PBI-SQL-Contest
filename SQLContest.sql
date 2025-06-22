create database ContestDB;
use ContestDB;

select * from Targets;
select * from Sales_Data;
select * from Product_Data;
select * from Customer_Data;



# 1.1
select Region,round(sum(profit),2) TotalProfit,count(OrderID) TotalSales from Sales_Data
where Year(orderDate)=2022 group by region;


# 1.2
select CustomerName,count(orderID) as TotalPurchase from Customer_Data cd
join Sales_Data sd on sd.CustomerID = cd.CustomerID
group by sd.CustomerID
order by TotalPurchase desc
limit 5;


# 1.3
select ProductName,`Discount (%)`,Profit from Sales_Data sd
join Product_Data pd on pd.ProductID = sd.ProductID
where `Discount (%)` > 20 and Profit > 0;

# 1.4
select Region, avg(`Discount (%)`) AverageDiscount from Sales_Data group by Region ;

# 1.5
select year(orderDate) Year,count(orderID) no_of_sales  from Sales_Data group by year(orderDate);


# 2.1
select Category,sum(Profit) as ProfitMargin from Product_Data pd
join Sales_Data sd on sd.ProductID = pd.ProductID 
group by Category order by ProfitMargin desc; 


# 2.2
select CustomerSegment,AOV from Customer_Data
group by CustomerSegment;