SELECT HOUSENAME, COUNT(*) as numOfResidents, round(AVG(round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12)), 2) as AvgAge, round(MAX(round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12)), 2) as Oldest 
FROM RESIDENTINFO NATURAL JOIN RESIDENTADDRESS NATURAL JOIN HOUSE 
WHERE (round(months_between(sysdate,to_date(dob,'MM-DD-YYYY'))/12)) > 1 AND
		dob IS NOT NULL 
GROUP BY HOUSENAME