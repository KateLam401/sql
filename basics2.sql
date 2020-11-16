
--- SELECT STATEMENTS

select * from schema.table
where code = '202';

select * from schema.table
where id = 'abc-%';

select id, count(*) from schema.table
GROUP BY id having count(1) > 1;

select * from schema.talbe
where code = '721'
AND UPPER(component) = 'TEXT';


--- INSERT STATEMENTS

INSERT into schema.table
SELECT DISTINCT id::character varying AS id,
    max(table1.measure) AS max,
    min(table2.measure) AS min,
    sum(table3.measure) AS sum,
    NULL::text AS field3,
    'Text'::text AS field4,
    TRUE AS field5
   FROM schema.table1
     LEFT JOIN schema.table2 ON table1.id = table2.id
     LEFT JOIN schema.table3 ON table1.id = table3.id
  GROUP BY table1.id;


--- CREATE OR REPLACE

create or replace view schema.table as 
select a.name,b.date from 
	(SELECT distinct a.id FROM schema1.table1 AS a
	INNER join schema2.table2 as b
	on a.name = b.name) as a
	inner join 
	(select name, min(date) as date from schema1.table1	
	 where code Like '250' or code like '250.%' or 
     upper(code) in ('110','90')
	 group by name) as b
	 on a.name = b.name
group by a.name,b.date;


--- AGE GROUP CASE STATMENT

                CASE
                    WHEN ((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) <= (18)::double precision) THEN '0-18'::text
                    WHEN (((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) > (18)::double precision) AND ((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) <= (35)::double precision)) THEN '19-35'::text
                    WHEN (((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) > (35)::double precision) AND ((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) <= (45)::double precision)) THEN '36-45'::text
                    WHEN (((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) > (45)::double precision) AND ((date_part('year'::text, CURRENT_DATE) - date_part('year'::text, c.date_of_birth)) <= (65)::double precision)) THEN '46-65'::text
                    ELSE '65+'::text
                END AS "Age Group"


--- DISTANCE CASE STATEMENT

                CASE
                    WHEN ((b.distance)::integer < 20) THEN '<20'::text
                    WHEN (((b.distance)::integer >= 20) AND ((b.distance)::integer <= 29)) THEN '20-29'::text
                    WHEN (((b.distance)::integer >= 30) AND ((b.distance)::integer <= 39)) THEN '30-39'::text
                    WHEN (((b.distance)::integer >= 40) AND ((b.distance)::integer <= 49)) THEN '40-49'::text
                    ELSE '>=50'::text
                END AS distance_group,


        CASE
            WHEN ((b.distance)::integer < 20) THEN 1
            ELSE 0
        END AS "<20 miles",
        CASE
            WHEN (((b.distance)::integer >= 20) AND ((b.distance)::integer <= 29)) THEN 1
            ELSE 0
        END AS "20-29",
        CASE
            WHEN (((b.distance)::integer >= 30) AND ((b.distance)::integer <= 39)) THEN 1
            ELSE 0
        END AS "30-39",
        CASE
            WHEN (((b.distance)::integer >= 40) AND ((b.distance)::integer <= 49)) THEN 1
            ELSE 0
        END AS "40-49",
        CASE
            WHEN ((b.distance)::integer >= 50) THEN 1
            ELSE 0
        END AS ">=50 miles",


--- DATABASE SETTINGS

ALTER SCHEMA dashboards OWNER TO analyzer;

ALTER TABLE schema.table OWNER TO analyzer;


--- AVG STATEMENTS

avg(CASE WHEN (upper(obs_display)='CALCIUM' and value is not null)   THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS CALCIUM, 
avg(CASE WHEN (upper(obs_display)='CARBOHYDRATE' and value is not null)  THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS CBH, 
avg(CASE WHEN (upper(obs_display)='WATER' and value is not null)THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS WATER, 
avg(CASE WHEN (upper(obs_display)='SODIUM' and value is not null) THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS SODIUM, 
avg(CASE WHEN (upper(obs_display)='DIETARY_FIBER' and value is not null) THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS DIET_FIBER, 
avg(CASE WHEN (upper(obs_display)='PROTEIN' and value is not null)  THEN ROUND((CAST(value AS NUMERIC(10,2)))) else null end) AS PROTEIN, 
avg(CASE WHEN (upper(obs_display)='UNSATURATED_FAT' and value is not null) THEN ROUND((CAST(value AS NUMERIC(10,2))))else null end) AS UNS_FAT,


--- SUM CASE STATEMENTS

sum(case when marital_status = 'Widowed' then 1 else 0 end) as Widowed,
sum(case when marital_status = 'Married' then 1 else 0 end) as Married,
sum(case when marital_status = 'Divorced' then 1 else 0 end) as Divorced,
sum(case when marital_status = 'Single' then 1 else 0 end) as Single,