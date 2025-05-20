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
                       oTotalPrice decimal(10,2),
                       foreign key (cID) references Customer(cID)
);
create table OrderDetail(
                            oID int not null,
                            pID int not null,
                            odQTY int,
                            foreign key (oID) references Orders(oID),
                            foreign key (pID) references Product(pID)
);









