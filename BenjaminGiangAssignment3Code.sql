use renovation;
  
create table cityState (
city varchar(90) not null,
state char(2) not null,
zipCode char(5) unique not null,
primary key (zipCode)
);


insert into cityState (city, state, zipCode) values
("Piscataway", "NJ", "08854"),
("Clover", "SC", "29710"),
("Duluth", "GA", "30096"),
("Nashville", "TN", "37205"),
("Willoughby", "OH", "44094"),
("Jupiter", "FL", "33458"),
("Huntington Beach", "CA", "92647"),
("Memphis", "TN", "38117"),
("Abingdon", "VA", "24210"),
("San Marcos", "CA", "92078"),
("Jefferson", "LA", "70121"),
("Covington", "LA", "70433"),
("Ontario", "CA", "91764"),
("Cuyahoga Falls", "OH", "44223"),
("Battle Creek", "MI", "49016"),
("Scottsdale", "AZ", "85260"),
("Lanham", "MD", "20706")
;



alter table client
add foreign key (zipCode) references cityState (zipCode);

alter table contractor
  add foreign key (zipCode) references cityState (zipCode);

alter table supplier
  add foreign key (zipCode) references cityState (zipCode);

/* client and cityState */

SELECT c.firstName, c.lastName, c.address, cs.city, cs.state, c.zipCode FROM client c, cityState cs WHERE c.zipCode = cs.zipCode;

/* contractor and cityState */

SELECT c.firstName, c.lastName, c.address, cs.city, cs.state, c.zipCode FROM contractor c, cityState cs WHERE c.zipCode = cs.zipCode;

/* supplire and cityState */

SELECT s.supplierName, s.address, cs.city, cs.state, s.zipCode FROM supplier s, cityState cs 
  WHERE s.zipCode = cs.zipCode;