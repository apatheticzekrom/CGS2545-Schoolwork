use renovation;

/* create stored procedure */

DELIMITER $$
DROP PROCEDURE IF EXISTS printInvoice$$ 
CREATE PROCEDURE printInvoice (IN clientId int, INOUT invoice varchar(4000))
BEGIN
 
 -- declare variables FIRST!
 DECLARE v_finished INTEGER DEFAULT 0;
 DECLARE v_lines varchar(100) DEFAULT "----------------------------------------------------------------------------------------------------";
 DECLARE v_clientFirst varchar(100) DEFAULT "";
 DECLARE v_clientLast varchar(100) DEFAULT "";
 DECLARE v_contractorFirst varchar(100) DEFAULT "";
 DECLARE v_contractorLast varchar(100) DEFAULT "";
 DECLARE v_supplier varchar(100) DEFAULT "";
 DECLARE v_material varchar(100) DEFAULT "";
 DECLARE v_cost decimal(8,2) DEFAULT 0.0;
 DECLARE v_sum decimal(8,2) DEFAULT 0.0;
 DECLARE v_count integer DEFAULT 0;


 -- declare cursor for client
 DEClARE client_cursor CURSOR FOR 
SELECT cl.firstName, cl.lastName, co.firstName, co.lastName, RPAD(s.supplierName, 35, ' '), RPAD(m.description, 65, ' '), m.cost 
FROM material m, supplier s, contractor co, client cl, invoice i, project p
  WHERE i.projectId = p.Id
  AND i.materialId = m.ID
  AND p.clientId = cl.ID
  AND p.contractorId = co.ID
  AND m.supplierId = s.ID
  AND cl.id = clientId;

-- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;

OPEN client_cursor;
 
 -- use a label for the LOOP
 get_client: LOOP

FETCH client_cursor into v_clientFirst,
FETCH client_cursor into v_clientLast,
FETCH client_cursor into v_contractorFirst,
FETCH client_cursor into v_contractorLast,
FETCH client_cursor into v_supplier,
FETCH client_cursor into v_material,
FETCH client_cursor into v_cost;

 -- check if reached the end of the result set
 IF v_finished = 1 THEN 
    LEAVE get_client;
 END IF;
 
v_count = v_count++;

-- build the invoice --
 -- debug statements --
/*
SELECT v_lines;
SELECT v_clientFirst;
SELECT v_clientLast;
SELECT v_contractorFirst;
SELECT v_contractorLast;
SELECT v_supplier;
SELECT v_material;
SELECT v_cost;
*/

-- formatting for first row of data
IF v_count = 1 THEN
    -- contractor
    SET invoice = CONCAT(invoice, '\nINVOICE PREPARED FOR:\n\n');
    SET invoice = CONCAT(invoice, '\n', v_lines, '\n');     
    SET invoice = CONCAT(invoice, '\nCONTRACTOR\n\n');


    SET invoice = CONCAT(invoice, v_contractorFirst,' ', v_contractorLast);
    SET invoice = CONCAT(invoice, '\n',v_lines,'\n');
    SET invoice = CONCAT(invoice, '\nCUSTOMER\n\n');
    SET invoice = CONCAT(invoice, v_clientFirst, ' ', v_clientLast);
    SET invoice = CONCAT(invoice, '\n', v_lines, '\n');
    SET invoice = CONCAT(invoice, 'SUPPLIER', char(9), char(9), char(9), '   
MATERIAL', char(9), char(9), char(9), char(9), char(9), char(9), char(9), '     
COST');
  SET invoice = CONCAT(invoice, '\n', v_lines, '\n');


  SET invoice = CONCAT(invoice, v_supplier, v_material, '$',v_cost);
  SET v_sum = v_sum + v_cost;
  
    


 ELSE
    SET invoice = CONCAT(invoice, '\n');  
  SET invoice = CONCAT(invoice, v_supplier, v_material, '$',v_cost);
  SET v_sum = v_sum + v_cost;


 END IF;


 -- debug statements --
-- SELECT invoice;
 
END LOOP get_client;
 

SET invoice = CONCAT(invoice, '\n\n', char(9), char(9), char(9), char(9), char(9), char(9), char(9), 'TOTAL', char(9), char(9), char(9), char(9), '   $', v_sum, '\n');

close client_cursor;
 
 -- end the stored procedure
END$$
 
 -- reset the delimiter
DELIMITER ;




-- test the stored procedure

-- dane
SET @invoice = "";
CALL printInvoice(15, @invoice);
SELECT @invoice;

-- kavita
SET @invoice = "";
CALL printInvoice(20, @invoice);
SELECT @invoice;

-- uzair
SET @invoice = "";
CALL printInvoice(28, @invoice);
SELECT @invoice;

-- yvonne
SET @invoice = "";
CALL printInvoice(1, @invoice);
SELECT @invoice;





