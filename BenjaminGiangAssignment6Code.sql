use renovation;

insert into project (clientId, contractorId, startDate, estimatedEndDate) values
(1, 2, "2022-04-01", "2022-05-01"),
(2, 2, "2022-05-03", "2022-06-15"),
(3, 2, "2022-06-16", "2022-08-01"),
(4, 2, "2022-08-02", "2022-09-30"),
(5, 2, "2022-10-01", "2022-11-30"),
(11, 8, "2022-04-01", "2022-04-15"),
(12, 8, "2022-04-16", "2022-05-16"),
(13, 8, "2022-06-01", "2022-06-30"),
(14, 8, "2022-07-06", "2022-08-25"),
(15, 8, "2022-08-25", "2022-10-31");

/*

Write a join query to create view scheduleView as 
a. Concatenate columns firstName and lastName from table contractor as 
Contractor
b. Concatenate columns firstName and lastName from table client as Client
c. Column startDate from table project as Start
d. Column estimatedEndDate from table project as Completion
e. Order by alias Contractor first, then alias Start

*/

create view scheduleView as 
SELECT concat(c.firstName, " ", c.lastName) AS Contractor, concat(cl.firstName, " ", cl.lastName) as Client, p.startDate as Start, p.estimatedEndDate as Completion 
FROM contractor c, client cl, project p 
where c.id = p.contractorId 
and cl.id = p.clientId 
Order by Contractor, Start;
