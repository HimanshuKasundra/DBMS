CREATE TABLE DEPOSITE ( ACTNO INT , CNAME VARCHAR(50) , BNAME VARCHAR(50) , AMOUNT DECIMAL(8,2) , ADATE DATETIME )
CREATE TABLE BRANCH ( BNAME VARCHAR(50) , CITY VARCHAR(50))
CREATE TABLE Customers (Cname VARCHAR(50),City VARCHAR(50))
CREATE TABLE Borrow (Loanno INT,Cname VARCHAR(50),Bname VARCHAR(50),Amount DECIMAL(8,2))

--DEPOSITE TABLE--
	INSERT INTO DEPOSITE VALUES(101,'ANIL','VRCE',1000,'1995-03-01')
	INSERT INTO DEPOSITE VALUES (102,'SUNIL','AJNI',5000,'1996-01-04')
	INSERT INTO DEPOSITE VALUES (103,'MEHUL','KAROLBAGH',3500,'1995-11-17')
	INSERT INTO DEPOSITE VALUES (104,'MADDHURI','CHANDI',1200,'1995-12-17')
	INSERT INTO DEPOSITE VALUES (105,'PRMOD','M.G.ROAD',3000,'1996-03-27')
	INSERT INTO DEPOSITE VALUES (106,'SANDIP','ANDHERI',2000,'1996-03-31')
	INSERT INTO DEPOSITE VALUES (107,'SHIVANI','VIRAR',1000,'1995-09-05')
	INSERT INTO DEPOSITE VALUES (108,'KRANTI','NEHRU PLACE',5000,'1995-07-02')
	INSERT INTO DEPOSITE VALUES (109,'MINU','POWAI',7000,'1995-08-10')

SELECT * FROM DEPOSITE

--BRANCH TABLE--
	INSERT INTO BRANCH VALUES ('VRCE','NAGPUR')
	INSERT INTO BRANCH VALUES ('AJNI','NAGPUR')
	INSERT INTO BRANCH VALUES ('KAROLBAGH','DELHI')
	INSERT INTO BRANCH VALUES ('CHANDI','DELHI')
	INSERT INTO BRANCH VALUES('DHARMPRIT','NAGPUR')
	INSERT INTO BRANCH VALUES('M.G.ROAD','BANGLORE')
	INSERT INTO BRANCH VALUES('ANDHERI','BOMBAY')
	INSERT INTO BRANCH VALUES('VIRAR','BOMBAY')
	INSERT INTO BRANCH VALUES('NEHRU PLACE','DELHI')
	INSERT INTO BRANCH VALUES('POWAI','BOMBAY')

	SELECT * FROM BRANCH

	SELECT * FROM CUSTOMERS

	SELECT * FROM BORROW

--customers--
INSERT INTO Customers VALUES('anil','culcutta')
INSERT INTO Customers VALUES('sunil','delhi')
INSERT INTO Customers VALUES('mehul','baroda')
INSERT INTO Customers VALUES('mandar','patna')
INSERT INTO Customers VALUES('madhuri','nagpur')
INSERT INTO Customers VALUES('prmod','nagpur')
INSERT INTO Customers VALUES('sandip','surat')
INSERT INTO Customers VALUES('shivani','bombay')
INSERT INTO Customers VALUES('kranti','bombay')
INSERT INTO Customers VALUES('naren','bombay')

--borrow--
INSERT INTO Borrow VALUES(201,'anil','vrce',1000)
INSERT INTO Borrow VALUES(206,'mehul','ajni',5000)
INSERT INTO Borrow VALUES(311,'sunil','dharampeth',3000)
INSERT INTO Borrow VALUES(321,'madhuri','andheri',2000)
INSERT INTO Borrow VALUES(375,'prmod','virar',8000)
INSERT INTO Borrow VALUES(481,'kranti','nehru place',3000)
	
	
	---2.1-----
	--1--Retrieve all data from table DEPOSIT.
		SELECT * FROM DEPOSITE

	--2--Retrieve all data from table BORROW.
		SELECT * FROM BORROW

	--3--Retrieve all data from table CUSTOMERS.
		SELECT * FROM CUSTOMERS

	--4--Display Account No, Customer Name & Amount from DEPOSIT.
		SELECT ACTNO,CNAME,AMOUNT FROM DEPOSITE

	--5--Display Loan No, Amount from BORROW.
		SELECT LOANNO,AMOUNT FROM BORROW

	--6--Display loan details of all customers who belongs to ‘ANDHERI’ branch.
		SELECT * FROM BORROW WHERE BNAME = 'ANDHERI'

	--7--Give account no and amount of depositor, whose account no is equals to 106.
		SELECT ACTNO,AMOUNT FROM DEPOSITE WHERE ACTNO = 106

	--8--Give name of borrowers having amount greater than 5000.
		SELECT CNAME FROM BORROW WHERE AMOUNT > 5000

	--9--Give name of customers who opened account after date '1-12-96'.
		SELECT CNAME FROM DEPOSITE WHERE ADATE='1996-12-01'

	--10--Display name of customers whose account no is less than 105.
		SELECT CNAME FROM DEPOSITE WHERE ACTNO < 105

	--11--Display name of customer who belongs to either ‘NAGPUR’ Or ‘DELHI’.(OR & IN)
		SELECT CNAME FROM CUSTOMERS WHERE CITY = 'NAGPUR' OR CITY = 'DELHI'

		------------OR--------------
		SELECT CNAME FROM CUSTOMERS WHERE CITY IN ('NAGPUR' , 'DELHI')

	--12--Display name of customers with branch whose amount is greater than 4000 and account no is less than 105.
		SELECT CNAME FROM DEPOSITE WHERE AMOUNT > 4000 AND ACTNO < 105

	--13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000.(AND & BETWEEN)
		SELECT * FROM BORROW WHERE AMOUNT >= 3000 AND AMOUNT  <= 8000

		------------OR-----------
		SELECT * FROM BORROW WHERE AMOUNT BETWEEN 3000 AND 8000

	--14. Find all depositors who do not belongs to ‘ANDHERI’ branch.
	 SELECT CNAME FROM DEPOSITE WHERE BNAME <> 'ANDHERI'
	 --or---
	 select * from deposite where bname !='andheri'
	--15. Display the name of borrowers whose amount is NULL.
		SELECT CNAME FROM BORROW WHERE AMOUNT IS   NULL
		
	--16. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ Or ‘M.G. ROAD’ and Account No is less than 104.
		SELECT ACTNO,CNAME,AMOUNT FROM DEPOSITE WHERE BNAME IN ('AJNI','KAROLBAGH','M.G.ROAD') AND ACTNO < 104

	--17.Display all the details of first five customers.
		SELECT TOP 5 * FROM DEPOSITE

	--18. Display all the details of first three depositors whose amount is greater than 1000.
		SELECT TOP 3 * FROM DEPOSITE WHERE AMOUNT > 1000

	--19. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to ‘ANDHERI’.
		SELECT TOP 5 LOANNO,CNAME FROM BORROW WHERE BNAME <> 'ANDHERI'

	--20. Retrieve all unique cities using DISTINCT. (Use Customers Table)
		SELECT DISTINCT CITY FROM Customers

	--21. Retrieve all unique branches using DISTINCT. (Use Branch Table)
		SELECT DISTINCT BNAME FROM BRANCH

	--22. Retrieve all the records of customer table as per their city name in ascending order.
		SELECT * FROM CUSTOMERS ORDER BY CITY ASC

	--23. Retrieve all the records of deposit table as per their amount column in descending order.
		SELECT * FROM DEPOSITE ORDER BY AMOUNT DESC

	--24. Retrieve all the details of customers in which decending order of their city name.
		SELECT * FROM CUSTOMERS ORDER BY CITY DESC

	--25. Show all unique borrowers & label the column UNI_Borrowers. (Display only Names)
		select distinct cname as uni_borrowers from Borrow

	-----------2.2-----------------
	--1. Update deposit amount of all customers from 3000 to 5000.
	UPDATE DEPOSITE SET AMOUNT=5000 WHERE AMOUNT=3000

	--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
	UPDATE BORROW SET BNAME='C.G.ROAD' WHERE CNAME='ANIL'

	--3. Update Account No of SANDIP to 111 & Amount to 5000.
	UPDATE DEPOSITE SET ACTNO=111,AMOUNT=5000 WHERE CNAME ='SANDIP'

	--4. Give 10% Increment in Loan Amount.
	UPDATE BORROW SET AMOUNT=(AMOUNT+AMOUNT*0.1)

	--5. Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
	UPDATE DEPOSITE SET AMOUNT=5000 WHERE ACTNO > 103 AND ACTNO<107
	SELECT * FROM DEPOSITE
	
	--6. Update amount of loan no 321 to NULL.
	UPDATE BORROW SET AMOUNT=NULL WHERE LOANNO=321
	SELECT * FROM Borrow 

	--7. Change Loan number from 201 to 401 & also change branch name from VRCE to AJNI.
	UPDATE BORROW SET LOANNO=401,BNAME='AJNI' WHERE LOANNO=201

	--8. Modify customer name ANIL to ANIL JAIN.
	UPDATE CUSTOMERS SET CNAME='ANIL JAIN' WHERE CNAME='ANIL'

	--9. Change Name to Ramesh, Branch Name VRCE & Amount 5500, Whose Account Number is 102.
	UPDATE DEPOSITE SET CNAME='RAMESH',BNAME='VRCE',AMOUNT=5500 WHERE ACTNO=102

	--10. Make Branch Name & Amount NULL, Whose Loan Number is 481 & Name is KRANTI.
	UPDATE BORROW SET BNAME=NULL,AMOUNT=NULL WHERE LOANNO=481


	--------------------2.3---------------------
	--1. Delete records of Customer table who belongs to BOMBAY City.
	DELETE FROM CUSTOMERS WHERE CITY='BOMBAY'

	--2. Delete all account numbers whose amount less than equals to 1000.
	DELETE FROM DEPOSITE WHERE AMOUNT <= 1000

	--3. Delete borrowers whose branch name is ‘AJNI’.
	DELETE FROM BORROW WHERE BNAME='AJNI'

	--4. Delete all the borrowers whose loan number between 201 to 210.
	DELETE FROM BORROW WHERE LOANNO >201 AND LOANNO<210
	SELECT * FROM BORROW

	--5. Delete customers who opened account after date '1-12-96'. (Use DEPOSIT table)
	DELETE FROM DEPOSITE WHERE ADATE>'1996-12-01'

	--6. Delete all the records of Customers table. (Use TRUNCATE)
	TRUNCATE TABLE CUSTOMERS
	select* from Customers
	--7. Remove all customers whose name is ANIL & Account Number is 101.
	DELETE FROM DEPOSITE WHERE ACTNO=101 AND CNAME='ANIL'

	--8. Delete all the depositors who do not belongs to ‘ANDHERI’ branch.
	DELETE FROM DEPOSITE WHERE BNAME<>'ANDHERI'

	--9. Delete all the borrowers whose loan amount is less than 2000 and does not belong to VRCE branch.
	DELETE FROM BORROW WHERE LOANNO<2000 AND BNAME<>'VRCE'

	--10. Remove Branch table. (Use DROP)
	DROP TABLE BRANCH