create schema quanlybanhang;
use quanlybanhang;
create table Customer(
                         cID int not null auto_increment primary key,
                         cName varchar(50) not null,
                         cAge int default 1
);

create table Product(
                        pID int not null auto_increment primary key,
                        pName varchar(100) not null,
                        pPrice decimal(10,2)
);

create table Orders(
                       oID int not null auto_increment primary key,
                       cID int not null,
                       oDate datetime,
                       oTotalPrice decimal(10,2) default NULL,
                       foreign key (cID) references Customer(cID)
);

create table OrderDetail(
                            oID int not null,
                            pID int not null,
                            odQTY int,
                            foreign key (oID) references Orders(oID),
                            foreign key (pID) references Product(pID)
);

insert into Customer (cName, cAge)
values ('Minh Quan', 10),
       ('Ngoc Oanh', 20),
       ('Hong Ha', 50);

insert into Orders (cId, oDate)
values (1, '2006-03-21'),
       (2, '2006-03-23'),
       (1, '2006-03-16');

insert into Product (pName, pPrice)
values ('May Giat', 3),
       ('Tu Lanh', 5),
       ('Dieu Hoa', 7),
       ('Quat', 1),
       ('Bep Dien', 2);

insert into OrderDetail (oID, pID, odQTY)
values (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);

SELECT o.oID, o.oDate,
       SUM(od.odQTY * p.pPrice) AS oPrice
FROM Orders o
         JOIN OrderDetail od ON o.oID = od.oID
         JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;

SELECT DISTINCT c.cID, c.cName, p.pName
FROM Customer c
         JOIN Orders o ON c.cID = o.cID
         JOIN OrderDetail od ON o.oID = od.oID
         JOIN Product p ON od.pID = p.pID;

SELECT c.cID, c.cName
FROM Customer c
         LEFT JOIN Orders o ON c.cID = o.cID
WHERE o.oID IS NULL;

SELECT o.oID, o.oDate,
       SUM(od.odQTY * p.pPrice) AS totalPrice
FROM Orders o
         JOIN OrderDetail od ON o.oID = od.oID
         JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;