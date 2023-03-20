CREATE DATABASE RpgResposta;

USE RpgResposta;

CREATE TABLE Usuarios
(
UserID INT PRIMARY KEY IDENTITY,
Email VARCHAR(150) UNIQUE NOT NULL,
Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Classes 
(
Classeid INT PRIMARY KEY IDENTITY,
Nome VARCHAR(150) UNIQUE NOT NULL,
Descricao VARCHAR (255)
);

CREATE TABLE Habilidades
(
Skillid INT PRIMARY KEY IDENTITY,
Nome VARCHAR(150) UNIQUE NOT NULL,
Descricao VARCHAR (255)
);

CREATE TABLE Personagens
(
Charid INT PRIMARY KEY IDENTITY,
UserID INT UNIQUE FOREIGN KEY REFERENCES Usuarios (UserID),
Classeid INT FOREIGN KEY REFERENCES Classes (Classeid),
NomeC VARCHAR(12) UNIQUE NOT NULL,
);

CREATE TABLE ClasseHabilidade
(
Skillid INT UNIQUE FOREIGN KEY REFERENCES Habilidades (Skillid),
Classeid INT FOREIGN KEY REFERENCES Classes (Classeid),
);


-- Inserção

INSERT INTO Usuarios VALUES ('Dark', 'Senha666');
INSERT INTO Classes VALUES ('Necromante', 'Senhor da Morte');
INSERT INTO Habilidades VALUES ('Explodir Cadaver', 'Explode o Inimigo Morto');
INSERT INTO Personagens (NomeC, UserID, Classeid) VALUES ('Necrodancer', 1,1 );
INSERT INTO ClasseHabilidade (Classeid, Skillid) VALUES (1, 1);

-- Exclusão

DELETE FROM Usuarios WHERE UserID = 2;

-- Alteração 

UPDATE Personagens SET NomeC = 'Necrodark' WHERE NomeC = 'Necrodancer'

-- Consulta

SELECT * FROM Usuarios;
SELECT * FROM Classes;
SELECT Nome FROM Habilidades;
SELECT * FROM Personagens;
