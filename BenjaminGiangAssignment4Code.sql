use renovation;

create table project (
  ID int(7) not null auto_increment,
  clientId int(7) not null,
  contractorId int(7) not null,
  startDate timestamp not null,
  estimatedEndDate timestamp not null,
  primary key (ID),
  foreign key (clientId) references client (ID),
  foreign key (contractorId) references contractor (ID)
);
  
create table contractorSupplier (
  ID int(7) not null auto_increment,
  contractorId int(7) not null,
  supplierId int(7) not null,
  primary key (ID),
  foreign key (contractorId) references contractor (ID),
  foreign key (supplierId) references supplier (ID)
);