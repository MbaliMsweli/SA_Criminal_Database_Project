--South Africa Criminal Database - 30 SQL Questions (Questions Only)
--1. Display all records from the CriminalCases table.
SELECT *
FROM [dbo].[SA_criminal_raw_data]

--2. Count the total number of cases in the table.
SELECT DISTINCT COUNT (CaseNumber ) AS NumberOfCases
FROM [dbo].[SA_criminal_raw_data]

--3. Count the number of cases in each province.
SELECT DISTINCT Province,
COUNT (CaseNumber ) AS NumberOfCasesPerProvince
FROM [dbo].[SA_criminal_raw_data]
GROUP BY Province;

--4. Retrieve all cases where the crime type is Fraud.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE CrimeType = 'Fraud'

--5. Count the number of cases for each crime type.
SELECT DISTINCT CrimeType,
COUNT (CaseNumber) as NumberOfCasesPerCrimeType
FROM [dbo].[SA_criminal_raw_data]
GROUP BY CrimeType
ORDER BY NumberOfCasesPerCrimeType DESC

--6. Display all cases classified as High or Critical risk.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE RiskLevel = 'High' OR RiskLevel = 'Critical risk'

--7. Calculate the average Financial Score of all suspects.
SELECT  [RecordID]
      ,[FirstName]
      ,[LastName]
      ,[FullName]
      ,[Age]
      ,[Gender]
      ,[Country]
      ,[Province]
      ,[SouthAfricanID]
      ,[CaseNumber]
      ,[CrimeType]
      ,[EstimatedFraudAmount_ZAR]
      ,[RiskLevel]
      ,[CaseStatus]
      ,[BankInvolved]
      ,[PreviousOffenses]
      ,[Arrested]
      ,[CrimeDate]
      ,[CourtDate]
      ,[InvestigatingOfficer]
      [StationCode],
AVG(FinancialScore) as AVGFinacialScore
FROM [dbo].[SA_criminal_raw_data]
GROUP BY [RecordID]
      ,[FirstName]
      ,[LastName]
      ,[FullName]
      ,[Age]
      ,[Gender]
      ,[Country]
      ,[Province]
      ,[SouthAfricanID]
      ,[CaseNumber]
      ,[CrimeType]
      ,[EstimatedFraudAmount_ZAR]
      ,[RiskLevel]
      ,[CaseStatus]
      ,[BankInvolved]
      ,[PreviousOffenses]
      ,[Arrested]
      ,[CrimeDate]
      ,[CourtDate]
      ,[InvestigatingOfficer]
      ,[StationCode]

--8. Find the highest Estimated Fraud Amount recorded.
SELECT MAX (EstimatedFraudAmount_ZAR) AS highest_Estimated_Fraud_Amount_recorded
FROM [dbo].[SA_criminal_raw_data]

--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.
SELECT TOP 10 CaseNumber,
MAX (EstimatedFraudAmount_ZAR) AS highest_Estimated_Fraud_Amount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY CaseNumber
ORDER BY highest_Estimated_Fraud_Amount DESC

--10. Display all cases where the suspect was arrested.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE Arrested >= 1

--11. Count how many suspects were arrested versus not arrested.
SELECT Arrested,
    COUNT(*) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY Arrested;

--12. Count the number of cases associated with each bank.
SELECT DISTINCT BankInvolved,
    COUNT(CaseNumber) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY BankInvolved;

--13. Calculate the total Estimated Fraud Amount per province.
SELECT DISTINCT Province,
    SUM(EstimatedFraudAmount_ZAR) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY Province;

--14. Retrieve all suspects older than 50 years.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE Age > 50

--15. Calculate the average age of suspects per province.
SELECT DISTINCT Province,
AVG (Age) as AVGAge
FROM [dbo].[SA_criminal_raw_data]
GROUP BY Province

--16. Display all cases recorded from 2020 onwards.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE CrimeDate >='2020-01-01'

--17. Count how many cases resulted in a Convicted status.
SELECT CaseStatus,
COUNT(*) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
WHERE CaseStatus = 'Convicted'
GROUP BY CaseStatus

--18. Retrieve all suspects with more than three previous offenses.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE PreviousOffenses > 3

--19. Show the distribution of cases by Risk Level.
SELECT RiskLevel,
COUNT(*) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY RiskLevel
ORDER BY TotalCount DESC

--20. Calculate the total Estimated Fraud Amount across all cases.
SELECT DISTINCT CaseNumber,
SUM(EstimatedFraudAmount_ZAR) AS TotalFraudAmount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY CaseNumber

--21. Identify the province with the highest number of cases.
SELECT TOP 1 Province,
COUNT(CaseNumber) AS HighestNumberOfCases
FROM [dbo].[SA_criminal_raw_data]
GROUP BY Province
ORDER BY HighestNumberOfCases DESC

--22. Retrieve the youngest suspect in the dataset.
SELECT TOP 1 FullName,
MIN(Age) as YoungestSuspect
FROM [dbo].[SA_criminal_raw_data]
GROUP BY FullName


--23. Retrieve the oldest suspect in the dataset.
SELECT TOP 1 FullName,
MAX(Age) as oldestSuspect
FROM [dbo].[SA_criminal_raw_data]
GROUP BY FullName
--24. Count the number of cases handled by each investigating officer.
SELECT DISTINCT InvestigatingOfficer,
COUNT (CaseNumber)as NumberOfCases
FROM [dbo].[SA_criminal_raw_data]
GROUP BY InvestigatingOfficer

--25. Calculate the average Estimated Fraud Amount per crime type.
SELECT DISTINCT CrimeType,
AVG (EstimatedFraudAmount_ZAR)as Estimated_Fraud_Amount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY CrimeType

--26. Display all cases occurring in Gauteng province.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE Province = 'Gauteng'

--27. Retrieve all Fraud cases classified as High risk.
SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE CrimeType = 'Fraud' AND RiskLevel = 'High'

--28. Count the number of cases per year based on CrimeDate.
SELECT 
    YEAR(CrimeDate) AS CrimeYear, 
    COUNT(*) AS CaseCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY YEAR(CrimeDate)
ORDER BY CrimeYear;

--29. Display all suspects with a Financial Score below 500.SELECT 
   SELECT *
FROM [dbo].[SA_criminal_raw_data]
WHERE FinancialScore < 500


--30. Identify the most common Crime Type in the dataset.
SELECT TOP 1 CrimeType, 
    COUNT(*) AS TotalCount
FROM [dbo].[SA_criminal_raw_data]
GROUP BY CrimeType
ORDER BY  TotalCount DESC;
