-- utilisation_mécanique entre jeu et mécanique en fonction du nom du jeu, et de la mécanique


insert into bd.utilsation_mecanique (numero_jeu, numero_mecanique)
select bd.jeu.numero_jeu, bd.mecanique.numero_mecanique
from bd.jeu, bd.mecanique
where bd.jeu.nom='Monopoly'
and bd.mecanique.mecanisme='Draft';

commit;

-- linkGameMecanisme()
-- `INSERT INTO bd.utilsation_mecanique (numero_jeu, numero_mecanique)
--     select bd.jeu.numero_jeu, bd.mecanique.numero_mecanique
--     from bd.jeu, bd.mecanique
--     where bd.jeu.nom=?
--     and bd.mecanique.mecanisme=?`


------------------------

-- utilisation_theme entre jeu et theme en fonction du nom du jeu, et du theme

insert into bd.utilsation_theme (numero_jeu, numero_theme)
select bd.jeu.numero_jeu, bd.theme.numero_theme
from bd.jeu, bd.theme
where bd.jeu.nom='Monopoly'
and bd.theme.theme='Policier';

commit;

-- linkGameTheme
-- INSERT INTO bd.utilsation_theme (numero_jeu, numero_theme)
--     select bd.jeu.numero_jeu, bd.theme.numero_theme
--     from bd.jeu, bd.theme
--     where bd.jeu.nom=?
--     and bd.theme.theme=?


------------------------

-- preferences_mécanique entre joueur et mécanique en fonction du pseudo, et de la mécanique

insert into bd.preference_mecanique (numero_personne, numero_mecanique)
select bd.joueur.numero_personne, bd.mecanique.numero_mecanique
from bd.joueur, bd.mecanique
where bd.joueur.numero_personne=2
and bd.mecanique.mecanisme='Draft';

commit;

-- linkPlayerMecanic
-- `INSERT INTO bd.preference_mecanique (numero_personne, numero_mecanique)
--     select bd.joueur.numero_personne, bd.mecanique.numero_mecanique
--     from bd.joueur, bd.mecanique
--     where bd.joueur.numero_personne=?
--     and bd.mecanique.mecanisme=?`;


------------------------

-- preferences_theme entre joueur et theme en fonction du pseudo, et du theme

insert into bd.preference_theme 
select bd.joueur.numero_personne, bd.theme.numero_theme
from bd.joueur, bd.theme
where bd.joueur.numero_personne=2
and bd.theme.theme='Policier';

commit;

-- linkPlayerTheme
-- `INSERT INTO bd.preference_theme (numero_personne, numero_theme)
--     select bd.joueur.numero_personne, bd.theme.numero_theme
--     from bd.joueur, bd.theme
--     where bd.joueur.numero_personne=?
--     and bd.theme.theme=?`

------------------------


-- appréciation entre joueur et avis en fonction du pseudo, numéro avis

insert into bd.appreciation (numero_personne, numero_avis, pertinence)
select bd.joueur.numero_personne, 3, 5
from bd.joueur
where bd.joueur.pseudo='tbm';
commit;

------------------------

-- extension_configuration entre configuration et extension en fonction du nom de l'extension, nom du jeu et nombre de joueurs dans la configuration

insert into bd.extension_configuration (numero_extension, numero_configuration)
select bd.extension.numero_extension, bd.configuration.numero_configuration
from bd.extension, bd.jeu, bd.configuration
where bd.extension.nom='Alliance'
and bd.jeu.nom='Abalone'
and bd.configuration.nb_joueurs=3
and bd.jeu.numero_jeu=bd.extension.numero_jeu
and bd.jeu.numero_jeu=bd.configuration.numero_jeu; -- vérifie si la configuration appartient bien au même jeu que l'extension

commit;

-- LinkExtension 
-- `INSERT INTO bd.extension_configuration (numero_configuration, numero_extension)
--     select ?, bd.extension.numero_extension
--     from bd.extension
--     where bd.extension.nom=?`

------------------------

-- concepteur entre personne et jeu en fonction du nom et prénom de la personne et nom du jeu

insert into bd.concepteur (numero_personne, numero_jeu)
select bd.personne.numero_personne, bd.jeu.numero_jeu
from bd.personne, bd.jeu
where bd.personne.nom='Michel'
and bd.personne.prenom='Jean'
and bd.jeu.nom='Monopoly';


commit;

------------------------

-- illustrateur entre personne et jeu en fonction du nom et prénom de la personne et nom du jeu

insert into bd.illustrateur (numero_personne, numero_jeu)
select bd.personne.numero_personne, bd.jeu.numero_jeu
from bd.personne, bd.jeu
where bd.personne.nom='Michel'
and bd.personne.prenom='Jean'
and bd.jeu.nom='Monopoly';


commit;


---------------------------

-- AddConfig
-- `INSERT INTO bd.configuration (nb_joueurs, numero_jeu)
--     select ? , bd.jeu.numero_jeu
--     from bd.jeu
--     where bd.jeu.nom=?`

-- AddExtension
-- `INSERT INTO bd.extension (nom, date_parution, numero_jeu)
--     select ? , ?, bd.jeu.numero_jeu
--     from bd.jeu
--     where bd.jeu.nom=?`





