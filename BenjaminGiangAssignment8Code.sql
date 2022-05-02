use renovation;

insert into invoice (projectId, materialId) values 
(1, 5),
(1, 7),
(1, 14),
(10, 1),
(10, 32),                 
(10, 36),      
(15, 17),
(15, 18),
(15, 24),
(15, 32),
(15, 35),
(18, 3),
(18, 20);

CREATE VIEW invoiceView AS SELECT concat(cl.firstName, " ", cl.lastName) AS Client, concat(co.firstName, " ", co.lastName) AS Contractor, s.supplierName AS Supplier, m.description AS Material, m.cost AS Cost
  FROM material m, supplier s, contractor co, client cl, invoice i, project p
  WHERE i.projectId = p.Id
  AND i.materialId = m.ID
  AND p.clientId = cl.ID
  AND p.contractorId = co.ID
  AND m.supplierId = s.ID
  ORDER BY Client;