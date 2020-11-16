
--- SELECT STATEMENTS

SELECT distinct field
from schema.table;

SELECT * from schema.table
where table.field = 'ABC';

SELECT count(*) from schema.table
where table.field1 = 'ABC'
and table.field2 = '123';

SELECT concept_name as name,
concept_code as code
from schema.table
where id = '123' or id = '456';

SELECT
domain_id as domain,
vocabulary_id as vocabulary
from schema.table
where domain_id = '123'
or domain_id = '456'
group by domain, system;

SELECT * FROM schema.table
WHERE id LIKE '%ABC%';


--- CASE STATEMENTS

SELECT distinct table1.id
max(CASE WHEN table1.measure = '% Limited Access' THEN value ELSE '0' end) AS field1
max(CASE WHEN table2.measure < 26 THEN) as field2
max(table2.display) as field3
FROM schema.table1
JOIN schema.table2 ON table1.id = table2.id
GROUP BY table1.id;


--- UPDATE/DATE STATEMENTS

SELECT * from schema.table
where code = '410' and date ::date > '10/01/2019' ::date;

UPDATE date_start ::date > '2019-04-01' ::date
* from achema.table
where id = '808';

UPDATE schema.table
SET start_date = '2019-04-01'::date
where id = '808';


--- DROP STATEMENTS

DROP view schema.table cascade;

DELETE from schema.table;

TRUNCATE table schema.table;