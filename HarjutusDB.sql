-- Task 1 + 2 | Loo andmebaas ja tabel --

Create Database HarjutusDB
GO

Use HarjutusDB
GO

Create Table Tootajad
(
	ID int primary key identity,
	Nimi nvarchar(50),
	Amet nvarchar(50),
	Palk int,
)
GO

INSERT Tootajad VALUES ('Mark', 'IT', 2000)
INSERT Tootajad VALUES ('Tanya', 'HR', 2500)

SELECT * FROM HarjutusDB.dbo.Tootajad

-- Task 3-6 | Loo login ja kasutajad --

-- Arendaja
USE HarjutusDB  
GO  

CREATE LOGIN ArendajaLogin WITH PASSWORD = 'vrBu1tR1iECpJkeYq8vo'
GO

CREATE USER ArendajaUser
FOR LOGIN ArendajaLogin
GO

-- Raamatupidaja
CREATE LOGIN RaamatupidajaLogin WITH PASSWORD = 'Jf5iXunxa3aQkZ86JLmL'
GO

CREATE USER RaamatupidajaUser
FOR LOGIN RaamatupidajaLogin
GO

-- Admin
CREATE LOGIN AdminLogin WITH PASSWORD = 'VNeztHrEgozUaAuob0zB'
GO

CREATE USER AdminUser
FOR LOGIN AdminLogin
GO

-- Task 7-9 | Anna User-ile erinevad õigused ja rollid
USE HarjutusDB  
GO 

GRANT SELECT ON dbo.Tootajad TO ArendajaUser
GO

GRANT SELECT, UPDATE ON dbo.Tootajad TO RaamatupidajaUser
GO 

ALTER ROLE [db_owner] ADD MEMBER AdminUser
GO

-- Task 10 | Loo Vaatajad roll ja anna seda ArendajaUser-ile
USE HarjutusDB  
GO  

CREATE ROLE vaatajad AUTHORIZATION AdminUser
GO

ALTER ROLE [vaatajad] ADD MEMBER ArendajaUser
GO

-- Task 11 | Keela RaamatupidajaUser-ile andmete kustutamine tabelist tootajad
USE HarjutusDB  
GO  

DENY DELETE ON dbo.Tootajad TO RaamatupidajaUser
GO

-- Task 12 | Loo kasutaja TestUser, kellel on ainult SELECT õigus
USE HarjutusDB  
GO

-- If Msg 5061 error, left click HarjutusDB and do "Tasks" >> "Take Offline"
-- Afterwards then do "Tasks" >> "Bring Online", this SHOULD fix issues
ALTER DATABASE HarjutusDB SET CONTAINMENT = PARTIAL
GO

-- Continued
CREATE USER TestUser WITH PASSWORD = 'H81pv7}hP/fy'
GO

GRANT SELECT TO TestUser
GO 

-- Task 13 | Kontrolli õigusi erniveadel login ja kasutajadel (SELECT, UPDATE, DELETE)

-- Arendaja
EXECUTE AS USER = 'ArendajaUser';
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

-- Raamatupidaja
EXECUTE AS USER = 'RaamatupidajaUser';
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

EXECUTE AS USER = 'RaamatupidajaUser';
UPDATE HarjutusDB.dbo.Tootajad
SET Nimi = 'Bob'
WHERE ID = 1;
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

EXECUTE AS USER = 'RaamatupidajaUser';
DELETE HarjutusDB.dbo.Tootajad
WHERE ID = 1;
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

-- Admin
EXECUTE AS USER = 'AdminUser';
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

EXECUTE AS USER = 'AdminUser';
UPDATE HarjutusDB.dbo.Tootajad
SET Nimi = 'Maria'
WHERE ID = 2;
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

EXECUTE AS USER = 'AdminUser';
DELETE HarjutusDB.dbo.Tootajad
WHERE ID = 2;
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT

-- TestUser
EXECUTE AS USER = 'TestUser';
SELECT * FROM HarjutusDB.dbo.Tootajad
REVERT