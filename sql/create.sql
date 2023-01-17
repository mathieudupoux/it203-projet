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
DROP TABLE IF EXISTS bd.preference_theme;

DROP TABLE IF EXISTS bd.preference_mecanique;

DROP TABLE IF EXISTS bd.utilsation_theme;

DROP TABLE IF EXISTS bd.utilsation_mecanique;

DROP TABLE IF EXISTS bd.appreciation;

DROP TABLE IF EXISTS bd.avis;

DROP TABLE IF EXISTS bd.extension_configuration;

DROP TABLE IF EXISTS bd.configuration;

DROP TABLE IF EXISTS bd.illustrateur;

DROP TABLE IF EXISTS bd.concepteur;

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
    numero_personne INT NOT NULL AUTO_INCREMENT, 
    nom CHAR(32),
    prenom CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_personne)
);

-- ============================================================
--   Table : JEU                                        
-- ============================================================
CREATE TABLE bd.jeu(
    numero_jeu INT NOT NULL AUTO_INCREMENT,
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
        FOREIGN KEY (numero_personne) REFERENCES personne(numero_personne) ON DELETE CASCADE,
        PRIMARY KEY (numero_personne)
);

-- ============================================================
--   Table : MECANIQUE                                       
-- ============================================================
CREATE TABLE bd.mecanique(
    numero_mecanique INT NOT NULL AUTO_INCREMENT,
    mecanisme CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_mecanique)
);

-- ============================================================
--   Table : THEME                                      
-- ============================================================
CREATE TABLE bd.theme(
    numero_theme INT NOT NULL AUTO_INCREMENT,
    theme CHAR(32),
    CONSTRAINT 
        PRIMARY KEY (numero_theme)
);

-- ============================================================
--   Table : EXTENSION                                     
-- ============================================================
CREATE TABLE bd.extension(
    numero_extension INT NOT NULL AUTO_INCREMENT,
    nom CHAR(32),
    date_parution date,
    numero_jeu INT NOT NULL,
    CONSTRAINT 
        FOREIGN KEY (numero_jeu) REFERENCES jeu(numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_extension)
);

-- ============================================================
--   Table : CONCEPTEUR                                        
-- ============================================================
CREATE TABLE bd.concepteur(
    numero_personne INT NOT NULL,
    numero_jeu INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_personne) REFERENCES personne (numero_personne) ON DELETE CASCADE,
        FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_jeu,numero_personne)
 );

-- ============================================================
--   Table : ILLUSTRATEUR                                        
-- ============================================================
CREATE TABLE bd.illustrateur(
    numero_personne INT NOT NULL,
    numero_jeu INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_personne) REFERENCES personne (numero_personne) ON DELETE CASCADE,
        FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_jeu,numero_personne)
 );

-- ============================================================
--   Table : CONFIGURATION                                       
-- ============================================================
CREATE TABLE bd.configuration(
    numero_configuration INT NOT NULL AUTO_INCREMENT,
    nb_joueurs INT NOT NULL,
    numero_jeu INT,
    CONSTRAINT
        FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_configuration)
 );

-- ============================================================
--   Table : EXTENSION_CONFIGURATION                                       
-- ============================================================
CREATE TABLE bd.extension_configuration(
    numero_extension INT NOT NULL,
    numero_configuration INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_extension) REFERENCES extension (numero_extension) ON DELETE CASCADE,
        FOREIGN KEY (numero_configuration) REFERENCES configuration (numero_configuration) ON DELETE CASCADE,
        PRIMARY KEY (numero_configuration,numero_extension)
 );
 
-- ============================================================
--   Table : AVIS                                       
-- ============================================================
CREATE TABLE bd.avis(
    numero_avis INT NOT NULL AUTO_INCREMENT,
    date_avis date,
    note INT,
    commentaire CHAR(255),
    numero_configuration INT NOT NULL,
    numero_personne INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_personne) REFERENCES personne (numero_personne) ON DELETE CASCADE,
        FOREIGN KEY (numero_configuration) REFERENCES configuration (numero_configuration) ON DELETE CASCADE,
        PRIMARY KEY (numero_avis),
        CHECK (note>=0 AND note<=20)
 );

-- ============================================================
--   Table : APPRECIATION                                 
-- ============================================================
CREATE TABLE bd.appreciation(
    numero_personne INT NOT NULL,
    numero_avis INT NOT NULL,
    pertinence BOOLEAN,
    CONSTRAINT
        FOREIGN KEY (numero_personne) REFERENCES personne (numero_personne) ON DELETE CASCADE,
        FOREIGN KEY (numero_avis) REFERENCES avis (numero_avis) ON DELETE CASCADE,
        PRIMARY KEY (numero_personne,numero_avis)
 );

-- ============================================================
--   Table : UTILISATION_MECANIQUE                                 
-- ============================================================
CREATE TABLE bd.utilsation_mecanique(
    numero_mecanique INT NOT NULL,
    numero_jeu INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_mecanique) REFERENCES mecanique (numero_mecanique) ON DELETE CASCADE,
        FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_mecanique,numero_jeu)
 );

 -- ============================================================
--   Table : UTILISATION_THEME                              
-- ============================================================
CREATE TABLE bd.utilsation_theme(
    numero_theme INT NOT NULL,
    numero_jeu INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_theme) REFERENCES theme (numero_theme) ON DELETE CASCADE,
        FOREIGN KEY (numero_jeu) REFERENCES jeu (numero_jeu) ON DELETE CASCADE,
        PRIMARY KEY (numero_theme,numero_jeu)
 );

 -- ============================================================
--   Table : PREFERENCE_MECANIQUE                                 
-- ============================================================
CREATE TABLE bd.preference_mecanique(
    numero_personne INT NOT NULL,
    numero_mecanique INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_mecanique) REFERENCES mecanique (numero_mecanique) ON DELETE CASCADE,
        FOREIGN KEY (numero_personne) REFERENCES joueur (numero_personne) ON DELETE CASCADE,
        PRIMARY KEY (numero_mecanique,numero_personne)
 );

-- ============================================================
--   Table : PREFERENCE_THEME                               
-- ============================================================
CREATE TABLE bd.preference_theme(
    numero_personne INT NOT NULL,
    numero_theme INT NOT NULL,
    CONSTRAINT
        FOREIGN KEY (numero_theme) REFERENCES theme(numero_theme) ON DELETE CASCADE,
        FOREIGN KEY (numero_personne) REFERENCES joueur (numero_personne) ON DELETE CASCADE,
        PRIMARY KEY (numero_theme,numero_personne)
 );