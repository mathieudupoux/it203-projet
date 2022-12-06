--- un joueur ne peut pas apprécier son propre avis

delimiter $$
CREATE OR REPLACE TRIGGER bd.tri1
BEFORE INSERT
ON bd.appreciation
FOR EACH ROW
BEGIN
    DECLARE auteur_avis INT;
    select bd.avis.numero_personne into auteur_avis from bd.avis where NEW.numero_avis=bd.avis.numero_avis;
    IF NEW.numero_personne = auteur_avis THEN
        SIGNAL SQLSTATE '02000'
        SET message_text='Le joueur ne peut pas apprécier son propre avis.';
    END IF;
END;
$$

--- un joueur ne peut pas commenter deux fois le même jeu

delimiter $$
CREATE OR REPLACE TRIGGER bd.tri2
BEFORE INSERT
ON bd.avis
FOR EACH ROW
BEGIN
    DECLARE this_config INT;
    DECLARE config_commentes INT;
    DECLARE jeux_commentes INT;
    DECLARE this_game INT;

    select NEW.numero_configuration into this_config;

    select bd.configuration.numero_configuration into config_commentes from bd.configuration, bd.avis 
    where NEW.numero_personne=bd.avis.numero_personne 
    and bd.avis.numero_configuration=bd.configuration.numero_configuration 
    and bd.configuration.numero_configuration IN (this_config);

    select bd.configuration.numero_jeu into this_game from bd.configuration 
    where this_config=bd.configuration.numero_configuration;

    select bd.configuration.numero_jeu into jeux_commentes from bd.configuration 
    where bd.configuration.numero_configuration IN (config_commentes)
    and bd.configuration.numero_jeu IN (this_game);

    IF this_config = config_commentes OR this_game = jeux_commentes THEN
        SIGNAL SQLSTATE '02000'
        SET message_text='Le joueur ne peut pas commenter plusieurs fois un même jeu.';
    END IF;
END;
$$