


### Before
<img width="800" alt="image" src="https://github.com/jmhirsch/ResidenceLifeDBMS/blob/master/Examples/Division/1.%20Before.png">

### After
<img width="800" alt="image" src="https://github.com/jmhirsch/ResidenceLifeDBMS/blob/master/Examples/Division/2.%20After.png">

### Query
```
SELECT * 
FROM HOUSE h 
WHERE NOT EXISTS
			(SELECT * 
			FROM UNIT u 
			WHERE (u.CAPACITY = 5) 
			AND NOT EXISTS 
					(SELECT * 
					FROM HOUSE h2 
					WHERE h.HOUSENAME = u.HOUSENAME  
					AND u.HOUSENAME = h2.HOUSENAME))
```
