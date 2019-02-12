use master -- use a different database so it will alowe to delete TEC detabase 
if db_id ('TEC') is not null -- if TEC database is there 
begin -- run this code if the if statment is true
drop database TEC -- delete the data base 
end -- end of the if statement  

CREATE DATABASE TEC; -- creat database 

use TEC -- change the using database to TEC database 


-- creating tables and adding informations

-- PostNrBy table 
CREATE TABLE PostNrBy(
PostNr int NOT NULL,
ByNavn varchar(500) NOT NULL
PRIMARY KEY (PostNr) -- manking PostNr the primery key 
);

-- values for PostNrBy table 

INSERT INTO PostNrBy (PostNr,ByNavn)
VALUES ('2650','Hvidovre'),
		('2300','København S'),
		('2500','Valby'),
		('2610','Rødovre'),
		('3650','Ølstykke'),
		('2830','Virum'),
		('2770','Kastrup'),
		('1824','Frederiksberg C'),
		('2740','Skovlunde'),
		('2750','Ballerup ');

-- Elev table 
CREATE TABLE Elev(
ElevID int IDENTITY(1,1) NOT NULL,
Fornavn varchar(500) NOT NULL,
Efternavn varchar(500) NOT NULL,
Adresse varchar(500) NOT NULL,
PostNr int NOT NULL
PRIMARY KEY (ElevID), -- making keys 
FOREIGN KEY (PostNr) 
REFERENCES PostNrBy (PostNr)
);

-- values for Elev table 
INSERT INTO Elev (Fornavn,Efternavn,Adresse,PostNr)
VALUES ('Bo','Andersen','Gammel Byvej 12','2650'),
		('Frederikke','Hansen','Amager Boulevard 5','2300'),
		('Jens','Mikkelsen','Lily Brobergs Vej 17','2500'),
		('Phillip','Mortensen','Brunevang 90','2610'),
		('Kasper','Frederiksen','Bryggertorvet 32','3650'),
		('Milla','Jørgensen','Virum Torv 25','2830'),
		('Fie','Knudsen','Allen 85','2770'),
		('Henrik','Madsen','Lily Brobergs Vej 53','2500');

-- Klasse table 
CREATE TABLE Klasse( 
KlasseID int IDENTITY(1,1) NOT NULL,
KlasseNavn varchar(500) NOT NULL
PRIMARY KEY (KlasseID)
);

-- values for Klasse table 
INSERT INTO Klasse (KlasseNavn)
VALUES ('A210'),
		('E224'),
		('D307');


-- Laerer table 		
CREATE TABLE Laerer(
LaererID int IDENTITY(1,1) NOT NULL primary key foreign key references Klasse (KlasseID),
Fornavn varchar(500) NOT NULL,
Efternavn varchar(500) NOT NULL,
Adresse varchar(500) NOT NULL,
PostNr int NOT NULL FOREIGN KEY REFERENCES PostNrBy (PostNr),
);

-- values for Laerer table
INSERT INTO Laerer (Fornavn,Efternavn,Adresse,PostNr)
VALUES ('Tom','It','Sankt Thomas Alle 3','1824'),
		('Lars','Henriksen','Nissedalen 76','2740'),
		('Mia','Hansen','Østervej 16','2750');

select * from Elev

select * from Klasse

select * from Laerer

select * from PostNrBy