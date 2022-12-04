
-- ajouter une personne et un joueur en même temps 

insert into bd.personne (nom, prenom) values ( 'Joueur'     , 'N'        ) ;
insert into bd.joueur (numero_personne, pseudo, mail)
select bd.personne.numero_personne, 'pseudo', 'n@gmail.com'
from bd.personne
where bd.personne.nom='Joueur'
and bd.personne.prenom='N';

commit;


------------------------

-- utilisation_mécanique entre jeu et mécanique en fonction du nom du jeu, et de la mécanique


insert into bd.utilsation_mecanique 
select bd.jeu.numero_jeu, bd.mecanique.numero_mecanique
from bd.jeu, bd.mecanique
where bd.jeu.nom='Monopoly'
and bd.mecanique.mecanisme='Draft';

commit;


------------------------

-- utilisation_theme entre jeu et theme en fonction du nom du jeu, et du theme

insert into bd.utilsation_theme 
select bd.jeu.numero_jeu, bd.theme.numero_theme
from bd.jeu, bd.theme
where bd.jeu.nom='Monopoly'
and bd.theme.theme='Policier';

commit;


------------------------

-- preferences_mécanique entre joueur et mécanique en fonction du pseudo, et de la mécanique

insert into bd.preference_mecanique 
select bd.joueur.numero_personne, bd.mecanique.numero_mecanique
from bd.joueur, bd.mecanique
where bd.joueur.pseudo='clio'
and bd.mecanique.mecanisme='Draft';

commit;


------------------------

-- preferences_theme entre joueur et theme en fonction du pseudo, et du theme

insert into bd.preference_theme 
select bd.joueur.numero_personne, bd.theme.numero_theme
from bd.joueur, bd.theme
where bd.joueur.pseudo='clio'
and bd.theme.theme='Policier';

commit;



------------------------


-- appréciation entre joueur et avis en fonction du pseudo, numéro avis

insert into bd.appreciation (numero_personne, numero_avis, pertinence)
select bd.jeu.numero_personne, 3, 5
from bd.jeu
where bd.jeu.pseudo='tbm';
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

