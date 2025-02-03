drop database elevage;   

create database elevage;

use elevage

CREATE TABLE users (
    idUsers INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    pwd VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table admin (
    idAdmin int primary key AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    email varchar(50) NOT NULL,
    pwd varchar(25) NOT NULL,
    capitale INT NOT NULL
);

INSERT INTO admin(nom,email, pwd) values(
    'admin','admin@gmail.com', 'admin'
);

create table espece (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(255) NOT NULL,
    poidsMinVente DECIMAL(10,2) NOT NULL,
    poidsMaxVente DECIMAL(10,2) NOT NULL,
    prixKg INT NOT NULL,
    jours_sans_manger INT NOT NULL,
    perte_poids_par_jours DECIMAL(10,2) NOT NULL
);

create table animaux (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idEspece INT NOT NULL,
    poids INT NOT NULL,
    jours_sans_manger INT DEFAULT 0,
    FOREIGN KEY (idEspece) REFERENCES espece(id)
);

create table alimentation (
    id INT  PRIMARY KEY AUTO_INCREMENT,
    idEspece INT,
    gains_poids DECIMAL(10,2),
    prix INT,
    FOREIGN KEY (idEspece) REFERENCES espece(id)
);

create table stockNourriture (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idAlimentation INT NOT NULL,
    quantite INT,
    FOREIGN KEY (idAlimentation) REFERENCES alimentation(id)
);

create table transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idanimal INT NOT NULL, 
    quantite INT,
    prix INT NOT NULL,
    date_transaction TIMESTAMP NOT NULL,
    FOREIGN KEY (idanimal) REFERENCES animaux(id)
);