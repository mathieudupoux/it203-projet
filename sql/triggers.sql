--- un joueur ne peut pas apprécier son propre avis

delimiter $$
CREATE OR REPLACE TRIGGER tri1
BEFORE INSERT
ON bd.appreciation
FOR EACH ROW
BEGIN
    DECLARE auteur_avis INT;
    select bd.avis.numero_personne into auteur_avis from bd.avis where NEW.numero_avis=bd.avis.numero_avis;
    IF NEW.numero_personne = auteur_avis THEN
        SIGNAL SQLSTATE '01000'
        SET message_text='Joueur ne peut pas apprécier son propre avis';
    END IF;
END;
$$

