-- ============================================================
--   Nom de la base   :  JEU                              
--   Nom de SGBD      :  MARIADB Version 3.1                   
--   Date de creation :  11/11/2022  17:42                       
-- ============================================================


-- ============================================================
--   Base de donnees : bd                                       
-- ============================================================
CREATE DATABASE IF NOT EXISTS bd;

-- ============================================================
--   DROP TABLES                                     
-- ============================================================

DROP TABLE IF EXISTS bd.mecanique;

DROP TABLE IF EXISTS bd.theme;

DROP TABLE IF EXISTS bd.joueur;

DROP TABLE IF EXISTS bd.extension;

DROP TABLE IF EXISTS bd.personne;

DROP TABLE IF EXISTS bd.jeu;


-- ============================================================
--   Table : PERSONNE                                         
-- ============================================================
CREATE TABLE bd.personne(
    numero_personne INT NOT NULL,
    nom CHAR(32),
    prenom CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_personne)
);

-- ============================================================
--   Table : JEU                                        
-- ============================================================
CREATE TABLE bd.jeu(
    numero_jeu INT NOT NULL,
    nom CHAR(32),
    editeur CHAR(32),
    date_de_parution date,
    type_de_jeu CHAR(32),
    duree  INT,
    CONSTRAINT 
        PRIMARY KEY (numero_jeu)
);

-- ============================================================
--   Table : JOUEUR                                        
-- ============================================================
CREATE TABLE bd.joueur(
    numero_personne INT NOT NULL,
    pseudo CHAR(32),
    mail CHAR(32),
    CONSTRAINT 
        -- FOREIGN KEY (numero_personne) REFERENCES personne(num_personne),
        PRIMARY KEY (numero_personne)
);

-- ============================================================
--   Table : MECANIQUE                                       
-- ============================================================
CREATE TABLE bd.mecanique(
    numero_mecanique INT NOT NULL,
    mecanisme CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_mecanique)
);

-- ============================================================
--   Table : THEME                                      
-- ============================================================
CREATE TABLE bd.theme(
    numero_theme INT NOT NULL,
    theme CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_theme)
);

-- ============================================================
--   Table : EXTENSION                                     
-- ============================================================
CREATE TABLE bd.extension(
    numero_extension INT NOT NULL,
    nom CHAR(32),
    date_parution date,
    numero_jeu INT NOT NULL,
    CONSTRAINT 
        FOREIGN KEY (numero_jeu) REFERENCES jeu(numero_jeu),
        PRIMARY KEY (numero_extension)
);

-- ============================================================
--   Table :                                    
-- ============================================================

