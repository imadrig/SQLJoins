/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories on categories.CategoryID = products.CategoryID
WHERE categories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
LEFT JOIN reviews on reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT sales.EmployeeID, SUM(sales.Quantity) AS TotalQuantity, employees.EmployeeID, employees.FirstName, employees.LastName
FROM sales
INNER JOIN employees on sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID, employees.FirstName, employees.LastName
ORDER BY TotalQuantity DESC
LIMIT 2; -- there is a tie for most total quantity sold
 
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT categories.Name AS Category, departments.Name as Department, categories.DepartmentID 
FROM categories
INNER JOIN departments on departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name as Product, sum(sales.Quantity) as QuantitySold, sum(sales.PricePerUnit * sales.Quantity) as DollarAmountSold
 FROM products
 INNER JOIN sales on sales.ProductID = products.ProductID
 WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
INNER JOIN products on products.ProductID = reviews.ProductID
WHERE products.ProductID = 857 AND reviews.Rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) as TotalQuantitySold
FROM sales
INNER JOIN employees on employees.EmployeeID = sales.EmployeeID
INNER JOIN products on products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.EmployeeID;
