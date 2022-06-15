USE Northwind;

select * from categories;
select * from customers;
select * from employees;
select * from `order details`;
select * from orders;
select * from products;
select * from shippers;
select * from suppliers;

 1. Write a query to get Product name and quantity/unit
  Ans. select ProductName, QuantityPerUnit 
       FROM Products;
       
2. Write a query to get current Product list (Product ID and name)       
Ans. select ProductID, ProductName
     FROM Products
     WHERE Discontinued = "False"
     ORDER BY ProductName;
     
3. Write a query to get discontinued Product list (Product ID and name)     
 Ans. select ProductID, ProductName
	  FROM Products
      WHERE Discontinued = 1 
      ORDER BY ProductName;
      
4. Write a query to get most expense and least expensive Product list (name and unit price)
 Ans. select ProductName, UnitPrice 
       FROM Products 
       ORDER BY UnitPrice desc; 
       
5. Write a query to get Product list (id, name, unit price) where current products cost less than $20
   Ans. select ProductID, ProductName, UnitPrice
        FROM Products
       WHERE (((UnitPrice)<20) AND ((Discontinued)=False))
       ORDER BY UnitPrice desc; 
       
6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
   Ans. select ProductName, UnitPrice
         FROM Products
         WHERE (((UnitPrice)>=15 And (UnitPrice)<=25) 
         AND ((Products.Discontinued)=False))
         ORDER BY Products.UnitPrice desc;   
         
7. Write a query to get Product list (name, unit price) of above average price
   Ans. select DISTINCT ProductName, UnitPrice
        FROM Products
        WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
        ORDER BY UnitPrice; 
        
8. Write a query to get Product list (name, unit price) of ten most expensive products
  Ans. select DISTINCT ProductName as Twenty_Most_Expensive_Products, UnitPrice
       FROM Products AS a
       WHERE 20 >= (SELECT COUNT(DISTINCT UnitPrice)
       FROM Products AS b
	   WHERE b.UnitPrice >= a.UnitPrice)
       ORDER BY UnitPrice desc;  
       
 9. Write a query to count current and discontinued products  
   Ans. select Count(ProductName)
        FROM Products
        GROUP BY Discontinued;
        
 10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order. 
     Ans. select ProductName,  UnitsOnOrder , UnitsInStock
          FROM Products
          WHERE (((Discontinued)=False) AND ((UnitsInStock)<UnitsOnOrder));          