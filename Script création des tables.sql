DROP TABLE IF EXISTS Vente;
DROP TABLE IF EXISTS Bien;
DROP TABLE IF EXISTS Commune;
DROP TABLE IF EXISTS Departement;
DROP TABLE IF EXISTS Region;


CREATE TABLE Departement (
	Code_departement VARCHAR(3) NOT NULL,
	Nom_departement VARCHAR (50) NOT NULL, 
	Pop_departement MEDIUMINT UNSIGNED NOT NULL,
	CONSTRAINT pk_departement PRIMARY KEY (Code_departement)
);


CREATE TABLE Region (
	Code_region TINYINT UNSIGNED NOT NULL,
	Nom_region VARCHAR (50) NOT NULL,
	Pop_region MEDIUMINT UNSIGNED NOT NULL,
	CONSTRAINT pk_region PRIMARY KEY (Code_region)
);


CREATE TABLE Commune (
	Id_commune SMALLINT UNSIGNED NOT NULL,
	Nom_commune VARCHAR (50) NOT NULL,
	Pop_commune MEDIUMINT UNSIGNED NOT NULL,
	Code_departement VARCHAR(3) NOT NULL,
	Code_region TINYINT UNSIGNED NOT NULL,
	CONSTRAINT pk_commune PRIMARY KEY (Id_commune),
	CONSTRAINT fk_Code_region FOREIGN KEY (Code_region) REFERENCES region(Code_region),
	CONSTRAINT fk_Code_departement FOREIGN KEY (Code_departement) REFERENCES departement(Code_departement)
);


CREATE TABLE Bien (
	Id_bien SMALLINT UNSIGNED NOT NULL,
	No_voie VARCHAR(4),
    Btq VARCHAR (1),
	Type_voie VARCHAR (4),
	Voie VARCHAR (50) NOT NULL,
	Total_piece TINYINT UNSIGNED NOT NULL,
	Surface_carrez SMALLINT UNSIGNED NOT NULL,
	Surface_local SMALLINT UNSIGNED NOT NULL,
	Type_local VARCHAR(15) NOT NULL,
	Id_commune SMALLINT UNSIGNED NOT NULL,
	CONSTRAINT pk_bien PRIMARY KEY (Id_bien),
	CONSTRAINT fk_Id_commune FOREIGN KEY (Id_commune) REFERENCES commune(Id_commune)
);


CREATE TABLE Vente (
	Id_vente SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	Date DATE NOT NULL,
	Valeur MEDIUMINT UNSIGNED,
    Prix_m2 MEDIUMINT UNSIGNED,
	Id_bien SMALLINT UNSIGNED NOT NULL,
	CONSTRAINT pk_vente PRIMARY KEY (Id_vente),
	CONSTRAINT fk_Id_bien FOREIGN KEY (Id_bien) REFERENCES Bien(Id_bien)
);