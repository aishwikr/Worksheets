#1. Write SQL query to create table Customers
create table customers(
customerNumber int not null,
customerName varchar (20) not null,
customerLastName varchar (20) not null,
customerFirstName varchar (20) not null,
phone int not null,
addressLine1 char(25) not null,
adrressLine2 char(25) not null,
city char(10) not null,
state char(10) not null,
country char(7) not null,
salesRepEmployeeNumber int not null,
creditLimit int not null,
primary key (customerNumber)
);

#2. Write SQL query to create table Orders.
create table orders(
orderNumber int not null,
orderDate datetime not null,
requiredDate datetime not null,
shippedDate datetime not null,
status char(10) not null,
comments char(20),
customerNumber int not null,
primary key(orderNumber),
foreign key(customerNumber) references customers(customersID)
);

#3. Write SQL query to show all the columns data from the Orders Table. 
select * from orders;

#4. Write SQL query to show all the comments from the Orders Table
select comments from orders;

#5. Write a SQL query to show orderDate and Total number of orders placed on that date, from Orders table
select orderDate, count(*) from orders
group by orderDate;

#6. Write a SQL query to show employeNumber, lastName, firstName of all the employees from employees table.
select employeNumber, lastName, firstName
from employees;

#7. Write a SQL query to show all orderNumber, customerName of the person who placed the respective order.
select orderNumber, customerName from orders, customers
where orders.customerNumber = customers.customerNumber;

#8. Write a SQL query to show name of all the customers in one column and salerepemployee name in another
#column
select customerName, firstName, lastName from customers, employees
where customers.salesRepEmployeeNumber = employees.employeeNumber;

#9. Write a SQL query to show Date in one column and total payment amount of the payments made on that date
#from the payments table.
select paymentDate, sum(amount) from payments
group by paymentDate;

#10. Write a SQL query to show all the products productName, MSRP, productDescription from the products table. 
select productName, MSRP, productDescription from products;

#11. Write a SQL query to print the productName, productDescription of the most ordered product.
select productName, productDescription from products
order by sum(products.productCode) desc
limit 1;

#12. Write a SQL query to print the city name where maximum number of orders were placed.
select city, orders from customers, orders
where city.customerName = orders.customerName
group by city
order by count(orders.orderNumber) desc 
limit 1;

#13. Write a SQL query to get the name of the state having maximum number of customers.
select state from customers
group by state
order by count(customerNumber)
limit 1;

#14. Write a SQL query to print the employee number in one column and Full name of the employee in the second
#column for all the employees.
select employeeNumber, concat(firstName,lastName) as Fullname from employees;

#15. Write a SQL query to print the orderNumber, customer Name and total amount paid by the customer for that order (quantityOrdered × priceEach).
select orderNumber , quantityOrdered*priceEach as total_amount_paid FROM OrderDetails;


