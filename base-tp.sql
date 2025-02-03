create database animal;

use animal

-- Table Animal

CREATE TABLE Animal (
    idAnimal int AUTO_INCREMENT PRIMARY kEY,
    nomAnimal varchar(255) NOT NULL,
    idType int,
    FOREIGN KEY (idType) REFERENCES Types(idType)
);

CREATE TABLE  Types (
    idType INT AUTO_INCREMENT PRIMARY KEY,
    nomType VARCHAR(100) NOT NULL,
    poidMinimalVente DECIMAL(10, 2) NOT NULL,
    prixVenteKg DECIMAL(10, 2) NOT NULL,
    poidMaximal DECIMAL(10, 2) NOT NULL,
    joursSansManger INT NOT NULL,
    pourcentagePertePoidJour DECIMAL(5, 2) NOT NULL
);

-- Table Alimentation
CREATE TABLE  Alimentation (
    idAlimentation INT AUTO_INCREMENT PRIMARY KEY,
    nomAlimentation VARCHAR(100) NOT NULL,
    prixAlimentation DECIMAL(10, 2) NOT NULL,
    pourcentageGainPoid DECIMAL(5, 2) NOT NULL
);

-- Table AnimalAlimentation (relation entre Animal et Alimentation)
CREATE TABLE  AnimalAlimentation (
    idType INT,
    idAlimentation INT,
    quantiteAlimentationJour DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idType) REFERENCES Animal(idType),
    FOREIGN KEY (idAlimentation) REFERENCES Alimentation(idAlimentation)
);

-- Table Elevage
CREATE TABLE  Elevage (
    idElevage INT AUTO_INCREMENT PRIMARY KEY,
    dateDebut DATE NOT NULL,
    capitalInitial DECIMAL(15, 2) NOT NULL
);

-- Table AchatAnimal
CREATE TABLE  AchatAnimal (
    idAchatAnimal INT AUTO_INCREMENT PRIMARY KEY,
    idAnimal INT,
    idElevage INT,
    dateAchat DATE NOT NULL,
    poidAchat DECIMAL(10, 2) NOT NULL,
    prixAchat DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal),
    FOREIGN KEY (idElevage) REFERENCES Elevage(idElevage)
);

-- Table VenteAnimal
CREATE TABLE  VenteAnimal (
    idVenteAnimal INT AUTO_INCREMENT PRIMARY KEY,
    idAnimal INT,
    idElevage INT,
    dateVente DATE NOT NULL,
    poidVente DECIMAL(10, 2) NOT NULL,
    prixVente DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal),
    FOREIGN KEY (idElevage) REFERENCES Elevage(idElevage)
);

-- Table AchatAlimentation
CREATE TABLE  AchatAlimentation (
    idAchatAlimentation INT AUTO_INCREMENT PRIMARY KEY,
    idAlimentation INT,
    idElevage INT,
    dateAchat DATE NOT NULL,
    quantiteAchete DECIMAL(10, 2) NOT NULL,
    prixAchat DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (idAlimentation) REFERENCES Alimentation(idAlimentation),
    FOREIGN KEY (idElevage) REFERENCES Elevage(idElevage)
);

-- Table NourritureJour
CREATE TABLE NourritureJour (
    idNourritureJour INT AUTO_INCREMENT PRIMARY KEY,
    idType INT,
    idAlimentation INT,
    dateNourriture DATE NOT NULL,
    quantiteNourriture DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idType) REFERENCES Animal(idType),
    FOREIGN KEY (idAlimentation) REFERENCES Alimentation(idAlimentation)
);

-- Table SuiviPoids
CREATE TABLE  SuiviPoids (
    idSuiviPoid INT AUTO_INCREMENT PRIMARY KEY,
    idAnimal INT,
    dateSuivi DATE NOT NULL,
    poidActuel DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)
);