-- ============================================================
--   Nom de la base   :  JEU                              
--   Nom de SGBD      :  MARIADB Version 3.1                   
--   Date de creation :  11/11/2022  17:42                       
-- ============================================================

-- COMMENTAIRE

--- SHOW CREATE TABLE nom_table ok  

--- INSERT test.personne VALUES (1,'BIZON','Nolan'), (2,'VOVARD','Marine');

--- verfier que la casse ne compte pas pour les noms et prénoms pcq sinon c'est embêtant

-- DROP TABLE test.concepteur;

-- CREATE TABLE test.concepteur(
--     numero_personne INT,
--     numero_jeu INT NOT NULL,
-- CONSTRAINT 
-- FOREIGN KEY (numero_personne) REFERENCES personne (num_personne),
-- FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu),
-- PRIMARY KEY (numero_jeu,numero_personne)
-- );


-- ============================================================
--   Base de donnees : bd                                       
-- ============================================================
CREATE DATABASE bd;

-- ============================================================
--   DROP TABLES                                     
-- ============================================================
DROP TABLE bd.personne;


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
    CONSTRAINT pk 
        PRIMARY KEY (numero_personne)
        FOREIGN KEY (numero_personne) REFERENCES personne (num_personne)
);

-- ============================================================
--   Table : MECANIQUE                                       
-- ============================================================
CREATE TABLE bd.mecanisme(
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
        PRIMARY KEY (numero_extension)
        FOREIGN KEY (numero_jeu) REFERENCES 
);







-- ============================================================
--   Table : CONCEPTEUR                                         
-- ============================================================
create table CONCEPTEUR
(
    numero_personne          number(3)                      ,
    numero_jeu               number(3)              not null,
    constraint pk_concepteur primary key (numero_personne,numero_jeu)
);

-- ============================================================
--   Table : ILLUSTRATEUR                                        
-- ============================================================
create table ILLUSTRATEUR
(
    NUMERO_PERSONNE          NUMBER(3)                      ,
    NUMERO_JEU               NUMBER(3)              not null,
    constraint pk_illustrateur primary key (NUMERO_PERSONNE,NUMERO_JEU)
);



-- ============================================================
--   Table : UTILISATION_MECANIQUE                                       
-- ============================================================
create table UTILISATION_MECANIQUE
(
    NUMERO_MECANIQUE               NUMBER(3)              not null,
    NUMERO_JEU               NUMBER(3)              not null,
    constraint pk_utilisation_mecanique primary key (NUMERO_MECANIQUE,NUMERO_JEU)
);

-- ============================================================
--   Table : UTILISATION_THEME                                     
-- ============================================================
create table UTILISATION_THEME
(
    NUMERO_THEME             NUMBER(3)              not null,
    NUMERO_JEU               NUMBER(3)              not null,
    constraint pk_utilisation_theme primary key (NUMERO_THEME,NUMERO_JEU)
);

-- ============================================================
--   Table : MECANIQUE                                    
-- ============================================================
create table MECANIQUE
(
    NUMERO_MECANIQUE            NUMBER(3)              not null,
    MECANISME               CHAR(20)                        ,
    constraint pk_mecanique primary key (NUMERO_MECANIQUE)
);

-- ============================================================
--   Table : THEME                                    
-- ============================================================
create table THEME
(
    NUMERO_THEME            NUMBER(3)              not null,
    THEME               CHAR(20)                        ,
    constraint pk_theme primary key (NUMERO_THEME)
);

-- ============================================================
--   Table : PREFERENCE_MECANIQUE                                    
-- ============================================================
create table PREFERENCE_MECANIQUE
(
    NUMERO_MECANIQUE            NUMBER(3)              ,
    NUMERO_PERSONNE          NUMBER(3)              not null,
    constraint pk_preference_mecanique primary key (NUMERO_MECANIQUE,NUMERO_PERSONNE)
);

-- ============================================================
--   Table : PREFERENCE_THEME                                    
-- ============================================================
create table PREFERENCE_THEME
(
    NUMERO_MECANIQUE            NUMBER(3)              ,
    NUMERO_PERSONNE          NUMBER(3)              not null,
    constraint pk_preference_theme primary key (NUMERO_MECANIQUE,NUMERO_PERSONNE)
);

-- ============================================================
--   Table : JOUEUR                                    
-- ============================================================
create table JOUEUR
(
    NUMERO_PERSONNE            NUMBER(3)              not null,
    PSEUDO          CHAR(20)              ,
    MAIL            CHAR(20),
    constraint pk_joueur primary key (NUMERO_PERSONNE)
);

-- ============================================================
--   Table : EXTENSION_CONFIGURATION                                  
-- ============================================================
create table EXTENSION_CONFIGURATION
(
    NUMERO_EXTENSION            NUMBER(3)              ,
    NUMERO_CONFIGURATION            NUMBER(3)              ,
    constraint pk_extension_configuration primary key (NUMERO_EXTENSION,NUMERO_CONFIGURATION)
);

-- ============================================================
--   Table : EXTENSION_CONFIGURATION                                  
-- ============================================================
create table EXTENSION_CONFIGURATION
(
    NUMERO_EXTENSION            NUMBER(3)              ,
    NUMERO_CONFIGURATION            NUMBER(3)              ,
    constraint pk_extension_configuration primary key (NUMERO_EXTENSION,NUMERO_CONFIGURATION)
);

-- ============================================================
--   Table : CONFIGURATION                                  
-- ============================================================
create table CONFIGURATION
(
    NUMERO_CONFIGURATION            NUMBER(3)              ,
    NOMBRE_JOUEURS                  NUMBER(3)               ,
    NUMERO_JEU                      NUMBER(3)       not null,
    constraint pk_extension_configuration primary key (NUMERO_CONFIGURATION)
);

-- ============================================================
--   Table : AVIS                                 
-- ============================================================
create table AVIS
(
    NUMERO_AVIS            NUMBER(3)              not null,
    DATE_AVIS                  DATE               ,
    NOTE                    NUMBER(3)               ,
    COMMENTAIRE                      CHAR(20)      ,
    constraint pk_extension_configuration primary key (NUMERO_AVIS)
);

