/*Calculate the price of all products*/

SELECT SUM(price) AS total_price FROM invoice

/*display the sum of price per customer*/

SELECT customer.*, SUM(price) AS total_price FROM customer 
INNER JOIN invoice ON invoice.fk_customer = customer.id_customer GROUP BY customer.id_customer

/*count the number of packets*/

select count(id_packages) from packages where type='packages'
/*Count the number of mails*/
select count(id_packages) from packages where type='mail'
/*prepare a table in order to bill each customer*/

SELECT customer.*, billing_address.*, invoice.price FROM customer 
LEFT JOIN invoice ON invoice.fk_customer = customer.id_customer 
LEFT JOIN billing_address ON invoice.fk_billing_address = billing_address.id_billingadress


/*Show all the packets and mails that were sorting by each employee with the corresponf size*/

SELECT * FROM employees
INNER JOIN sorting ON sorting.fk_employee = employees.id_employee
INNER JOIN packages ON sorting.fk_package = packages.id_packages
LEFT JOIN package_size ON package_size.id_size = packages.fk_size

/*Show the reception way of packet 1 from a customer to the processing system*/


SELECT customer.*, location.*, receive.*, packages.*, processing_system.*  from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN receive ON receive.fk_package = packages.id_packages
INNER JOIN location ON receive.fk_location = location.id_location
INNER JOIN customer on location.id_location = customer.fk_location
WHERE packages.id_packages=1

/*Show the expedition way of packet 1 from the processing system to the customer*/

SELECT packages.*, deliver.*, location.*, customer.*, processing_system.* from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN deliver ON deliver.fk_package = packages.id_packages
LEFT JOIN location ON deliver.fk_location = location.id_location
LEFT JOIN customer on location.id_location = customer.fk_location
WHERE packages.id_packages=1

/*Calculate the average weight of a packet*/

select avg (packages.weigth) as average_packet from packages

/*Display where are the packet stored in the warehouse*/

SELECT packages.*, warehouse.*, processing_system.* from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN warehouse ON warehouse.id_warehouse = processing_system.fk_warehouse

/*show the packet in roww 2 with their corresponding size*/

SELECT packages.*, warehouse.*, processing_system.*, package_size.* from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN warehouse ON warehouse.id_warehouse = processing_system.fk_warehouse
INNER JOIN package_size ON package_size.id_size = packages.fk_size
where warehouse.roww = 2

/*show the packets and the mails in roww 1 and display the size for the packet*/

SELECT packages.*, warehouse.*, processing_system.*, package_size.* from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN warehouse ON warehouse.id_warehouse = processing_system.fk_warehouse
LEFT JOIN package_size ON package_size.id_size = packages.fk_size
where warehouse.roww = 1

/* count the number of mails in the roww1.*/
SELECT COUNT(id_packages) from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN warehouse ON warehouse.id_warehouse = processing_system.fk_warehouse
where warehouse.roww = 1 AND packages.type = 'mail'

/* count the number of packets in roww1*/

SELECT COUNT(id_packages) from packages
INNER JOIN processing_system ON processing_system.fk_package = packages.id_packages
INNER JOIN warehouse ON warehouse.id_warehouse = processing_system.fk_warehouse
where warehouse.roww = 1 AND packages.type = 'packages'


/*Show all the dates of a packet in the right order from the reception to the delivery*/ 

SELECT packages.id_packages, timelocation.receive_date, timesystem.arrival_date, timesystem.expedition_date, timelocation.deliver_date from packages
LEFT JOIN receive ON receive.fk_package = packages.id_packages
LEFT JOIN timelocation ON timelocation.id_timelocation = receive.fk_timelocation
LEFT JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN timesystem ON processing_system.fk_time = timesystem.id_timesystem

/*Show the packet with their arriveal time and date and their expedition time and date*/

SELECT packages.id_packages, timesystem.arrival_date, timesystem.arrival_time, timesystem.expedition_date, timesystem.expedition_time from packages
LEFT JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN timesystem ON processing_system.fk_time = timesystem.id_timesystem


/*Show the packet which are present in the warehouse on the 10.07.2020*/
SELECT packages.id_packages, timesystem.arrival_date, timesystem.arrival_time, timesystem.expedition_date, timesystem.expedition_time from packages
LEFT JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN timesystem ON processing_system.fk_time = timesystem.id_timesystem
where timesystem.arrival_date <= "2019-07-10" AND timesystem.expedition_date >="2019-07-10"

/*Show the packet which what where received between 2019-07-05 and 2019-07-10*/
SELECT packages.id_packages, timesystem.arrival_date, timesystem.arrival_time, timesystem.expedition_date, timesystem.expedition_time from packages
LEFT JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN timesystem ON processing_system.fk_time = timesystem.id_timesystem
where timesystem.arrival_date between "2019-07-05" AND "2019-07-10"


/*Join all the tables together*/

SELECT * FROM employees
LEFT JOIN sorting ON sorting.fk_employee = employees.id_employee
LEFT JOIN packages ON sorting.fk_package = packages.id_packages
LEFT JOIN package_size ON package_size.id_size = packages.fk_size
LEFT JOIN processing_system ON processing_system.fk_package = packages.id_packages
LEFT JOIN timesystem ON processing_system.fk_time = timesystem.id_timesystem
LEFT JOIN warehouse ON processing_system.fk_warehouse = warehouse.id_warehouse
LEFT JOIN receive ON receive.fk_package = packages.id_packages
LEFT JOIN deliver ON deliver.fk_package = packages.id_packages
LEFT JOIN timelocation ON timelocation.id_timelocation = receive.fk_timelocation
LEFT JOIN location ON location.id_location = receive.fk_location
LEFT JOIN customer ON customer.fk_location = location.id_location
LEFT JOIN invoice ON invoice.fk_customer = customer.id_customer 
LEFT JOIN billing_address ON invoice.fk_billing_address = billing_address.id_billingadress