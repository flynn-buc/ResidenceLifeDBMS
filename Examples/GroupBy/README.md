
### Before
<img width="800" alt="image" src="https://github.com/jmhirsch/ResidenceLifeDBMS/blob/master/Examples/GroupBy/1.%20Before.png">

### After
<img width="800" alt="image" src="https://github.com/jmhirsch/ResidenceLifeDBMS/blob/master/Examples/GroupBy/2.%20After.png">

### Query
```
SELECT round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12) advisorAge, AVG(YEARSOFEXPERIENCE) avgExperience
FROM RESIDENTINFO NATURAL JOIN RESIDENCEADVISOR 
WHERE DOB IS NOT NULL AND YEARSOFEXPERIENCE IS NOT NULL 
GROUP BY (round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12)) 
UNION 
SELECT round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12) age, AVG(YEARSOFEXPERIENCE) avgExperience 
FROM RESIDENTINFO NATURAL JOIN SENIORADVISOR 
WHERE DOB IS NOT NULL AND YEARSOFEXPERIENCE IS NOT NULL 
GROUP BY (round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12)) 
ORDER BY advisorAge
```
