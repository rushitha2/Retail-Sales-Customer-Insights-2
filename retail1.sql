create database retail1;
use retail1;

create table dim_product ( productkey int primary key,
    productsubcategorykey int,
    product varchar(50),
    color varchar(15),
    model varchar(50),
    subcategory varchar(20),
    category varchar(20));
   
   
create table dim_salesterritory ( salesterritorykey int primary key,
    salesterritoryregion varchar(20),
    salesterritorycountry varchar(20),
    salesterritorygroup varchar(20));
 
 
create table dim_geography ( geographykey int primary key,
    city varchar(30),
    state varchar(20),
    country varchar(20),
    postalcode varchar(10),
    salesterritorykey int,
    foreign key (salesterritorykey) references dim_salesterritory(salesterritorykey));
 
 
 create table dim_employee ( employeekey int primary key,
    parentemployeekey int,
    salesterritorykey int,
    employeename varchar(30),
    title varchar(30),
    emailaddress varchar(50),
    departmentname varchar(10),
    hiredate date,
    birthdate date,
    foreign key (salesterritorykey) references dim_salesterritory(salesterritorykey));

    
create table dim_customer ( customerkey int primary key,
    geographykey int,
    customername varchar(30),
    birthdate date,
    maritalstatus varchar(1),
    gender varchar(1),
    emailaddress varchar(50),
    yearlyincome int,
    education varchar(30),
    occupation varchar(30),
    houseownerflag int,
    address varchar(40),
    firstpurchasedate date,
    foreign key (geographykey) references dim_geography(geographykey));
  

 create table dim_reseller ( resellerkey int primary key,
    geographykey int,
    businesstype varchar(30),
    resellername varchar(50),
    foreign key (geographykey) references dim_geography(geographykey));   
  
  
create table fact_internetsales ( productkey int,
    customerkey int,
    salesterritorykey int,
    salesordernumber varchar(10),
    salesorderlinenumber int,
    totalproductcost decimal(7, 2),
    salesamount decimal(7, 2),
    freight decimal(4, 2),
    orderdate date,
    duedate date,
    shipdate date,
    primary key (salesordernumber, salesorderlinenumber),
    foreign key (productkey) references dim_product(productkey),
    foreign key (customerkey) references dim_customer(customerkey),
    foreign key (salesterritorykey) references dim_salesterritory(salesterritorykey));
    
  
  create table fact_resellersales ( productkey int,
    resellerkey int,
    employeekey int,
    salesterritorykey int,
    salesordernumber varchar(10),
    salesorderlinenumber int,
    discountamount decimal(6, 2),
    totalproductcost decimal(7, 2),
    salesamount decimal(7, 2),
    freight decimal(6, 2),
    carriertrackingnumber varchar(25),
    orderdate date,
    duedate date,
    shipdate date,
    primary key (salesordernumber, salesorderlinenumber),
    foreign key (productkey) references dim_product(productkey),
    foreign key (resellerkey) references dim_reseller(resellerkey),
    foreign key (employeekey) references dim_employee(employeekey),
    foreign key (salesterritorykey) references dim_salesterritory(salesterritorykey));
    
select * from dim_product;

select * from dim_salesterritory;

select * from dim_geography;

select * from dim_employee;

select * from dim_customer;

select count(*) from dim_customer;

select * from dim_reseller;

select * from fact_internetsales;

select count(*) from fact_internetsales;


select * from fact_resellersales;

select count(*) from fact_resellersales;

