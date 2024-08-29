SELECT *
FROM CUSTOMER_ORDERS;

--customer_orders tablosu veri Düzenleme
CREATE table new_table as
SELECT ORDER_ID,
	CUSTOMER_ID,
	PIZZA_ID,
	CASE
					WHEN EXCLUSIONS = 'null'
										OR EXCLUSIONS = '' THEN NULL
					ELSE EXCLUSIONS
	END AS EXCLUSIONS,
	CASE
					WHEN EXTRAS = 'null'
										OR EXTRAS = '' THEN NULL
					ELSE EXTRAS
	END AS EXTRAS,
	ORDER_TIME
FROM CUSTOMER_ORDERS;


select * from new_table

--Yeni tablomuzu entegre edelim(güncelleme kullandık)
UPDATE CUSTOMER_ORDERS
SET EXCLUSIONS = CASE
				WHEN EXCLUSIONS = 'null'
				OR EXCLUSIONS = '' THEN NULL
				ELSE EXCLUSIONS
	END,
UPDATE CUSTOMER_ORDERS
SET EXTRAS = CASE
			WHEN EXTRAS = 'null'
			OR EXTRAS = '' THEN NULL
			ELSE EXTRAS
	END;
--runner orders tablosu veri düzenleme

SELECT *
FROM RUNNER_ORDERS;


UPDATE RUNNER_ORDERS
SET PICKUP_TIME = CASE
		WHEN PICKUP_TIME = 'null' THEN NULL
								ELSE PICKUP_TIME
			END,
	DISTANCE = CASE
		WHEN DISTANCE = 'null' THEN NULL	
		WHEN DISTANCE LIKE '%km' THEN TRIM(DISTANCE,
													'km')
		ELSE DISTANCE
						END,
	DURATION = CASE
			WHEN DURATION = 'null' THEN NULL
						WHEN DURATION like '%min%' THEN TRIM (DURATION,
																	'minutes')
								ELSE DURATION
												END, 
												
CANCELLATION = CASE
					WHEN CANCELLATION = 'null'
					OR CANCELLATION = '' THEN NULL
					ELSE CANCELLATION
					END ;


SELECT *
FROM RUNNER_ORDERS

Alter table runner_orders
alter column pickup_time type timestamp 
using to_timestamp(pickup_time,'YYYY-MM-DD HH24:MI')

ALTER TABLE RUNNER_ORDERS
ALTER COLUMN DISTANCE TYPE float USING distance::double precision

Alter table runner_orders
alter column duration type int using duration ::integer 



