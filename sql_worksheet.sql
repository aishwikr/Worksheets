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

select * from orders;

select comments from orders;

select orderDate, count(*) from orders
group by orderDate;

select employeNumber, lastName, firstName
from employees;

select orderNumber, customerName from orders, customers
where orders.customerNumber = customers.customerNumber;

select customerName, firstName, lastName from customers, employees
where customers.salesRepEmployeeNumber = employees.employeeNumber;

select paymentDate, amount from payments
group by paymentDate;
 
select productName, MSRP, productDescription from products;

select productName, productDescription from products
order by sum(products.productCode) desc
limit 1;

select city, orders from customers, orders
where city.customerName = orders.customerName
order by count(orders.orderNumber) desc 
limit 1;

select state from customers
order by count(customerNumber)
limit 1;


select employeeNumber, lastName, firstName
from employees;

#15. Write a SQL query to print the orderNumber, customer Name and total amount paid by the customer for that order (quantityOrdered × priceEach).
#order (quantityOrdered × priceEach).


