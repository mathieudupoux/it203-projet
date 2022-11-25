 -------------------------------------------------------------------------------------------------
-------                                     JEU                                              ------
 -------------------------------------------------------------------------------------------------


 -------------------------------------------------------
--Requête pour avoir la liste des noms de tous les jeux--
 -------------------------------------------------------
 SELECT bd.jeu.nom FROM bd.jeu;

 -------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu "game"--
 -------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.nom = game;


 ----------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont le type est "types"--
 ----------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.type_de_jeu = types;


 ----------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont l'éditeur est "editeur"--
 ----------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.editeur = editeur;

  ---------------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont la date de parution est avant"date_avant"--
  ---------------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.date_de_parution < date_avant;

  ----------------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont la date de parution est après "date_apres"--
  ----------------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.date_de_parution > date_apres;

  --------------------------------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont la date de parution est entre "date_avant" et "date_apres"--
  --------------------------------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.date_de_parution > date_avant && bd.jeu.date_de_parution < date_apres;

   ---------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont la durée est inférieur à "durée_max"--
  ----------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.duree < duree_max;

  -----------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont  la durée est supérieur à "durée_min"--
  -----------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.duree > duree_min;

  -------------------------------------------------------------------------------------------------------------------
--Requête pour avoir toutes les infos sur un jeu dont la durée est supérieur à "durée_min" et inférieur à "durée_max"--
  -------------------------------------------------------------------------------------------------------------------

 SELECT * FROM bd.jeu WHERE bd.jeu.duree > duree_min && bd.jeu.duree < duree_max;

  -----------------------------------------------------------------
--Requête pour avoir la liste des jeux qui utilise le thème "theme"--
  -----------------------------------------------------------------

 SELECT bd.jeu.nom FROM bd.jeu, bd.utilisation_theme, bd.theme WHERE bd.jeu.numero_jeu = bd.utilisation_theme.numero_jeu && bd.theme.numero_theme = bd.utilisation_theme.numero_theme && bd.theme.theme = theme;


  -------------------------------------------------------------------------
--Requête pour avoir la liste des jeux qui utilise la mécanique "mécanique"--
  -------------------------------------------------------------------------

 SELECT bd.jeu.nom FROM bd.jeu, bd.utilisation_mecanique, bd.mecanique WHERE bd.jeu.numero_jeu = bd.utilisation_mecanique.numero_jeu && bd.mecanique.numero_mecanique = bd.utilisation_mecanique.numero_mecanique && bd.mecanique.mecanique = mecanique;



 --------------------------------------------------------------------------------------------------
-------                                     JOUEUR                                            ------
 --------------------------------------------------------------------------------------------------

  -------------------------------------------------
--Requête pour avoir la liste des pseudos des joueurs --
  -------------------------------------------------

 SELECT bd.joueur.pseudo FROM bd.joueur;  

  ------------------------------------------------------------------
--Requête pour avoir le mail d'un joueur dont le pseudo est "pseudo"--
  ------------------------------------------------------------------

 SELECT bd.joueur.mail FROM bd.joueur WHERE bd.joueur.pseudo = pseudo;

  ------------------------------------------------------------------
--Requête pour avoir le mail d'un joueur dont le pseudo est "pseudo"--
  ------------------------------------------------------------------

 SELECT bd.joueur.mail FROM bd.joueur WHERE bd.joueur.pseudo = pseudo;

  ------------------------------------------------------------------------------------
--Requête pour avoir la liste des joueurs dont leur thème préféré est le thème "theme"--
  ------------------------------------------------------------------------------------

 SELECT bd.joueur.nom FROM bd.joueur, bd.preference_theme, bd.theme WHERE bd.joueur.numero_personne = bd.preference_theme.numero_personne && bd.theme.numero_theme = bd.preference_theme.numero_theme && bd.theme.theme = theme;

  ------------------------------------------------------------------------------------------------
--Requête pour avoir la liste des joueurs dont leur mécanique préféré est la mécanique "mécanique"--
  ------------------------------------------------------------------------------------------------

 SELECT bd.joueur.nom FROM bd.joueur, bd.preference_mecanique, bd.mecanique WHERE bd.joueur.numero_personne = bd.preference_mecanique.numero_personne && bd.mecanique.numero_mecanique = bd.preference_mecanique.numero_mecanique && bd.mecanique.mecanique = mecanique;


  -------------------------------------------------------------------------
--Requête pour avoir la liste des mécaniques qu'un joueur "joueur" préfère --
  -------------------------------------------------------------------------

 SELECT bd.mecanique.mecanique FROM bd.joueur, bd.preference_mecanique, bd.mecanique WHERE bd.joueur.numero_personne = bd.preference_mecanique.numero_personne && bd.mecanique.numero_mecanique = bd.preference_mecanique.numero_mecanique && bd.joueur.nom = joueur;


  ---------------------------------------------------------------------
--Requête pour avoir la liste des thèmes qu'un joueur "joueur" préfère --
  ---------------------------------------------------------------------

 SELECT bd.theme.theme FROM bd.joueur, bd.preference_theme, bd.theme WHERE bd.joueur.numero_personne = bd.preference_theme.numero_personne && bd.theme.numero_theme = bd.preference_theme.numero_theme && bd.joueur.nom = joueur;

  

 --------------------------------------------------------------------------------------------------
-------                                       AVIS                                            ------
 --------------------------------------------------------------------------------------------------

  ----------------------------------------------------------------------------
--Requête pour avoir la liste des avis d'un joueur dont le pseudo est "pseudo"--
  ----------------------------------------------------------------------------

 SELECT bd.avis.date_avis, bd.avis.note, bd.avis.commentaire FROM bd.joueur, bd.avis WHERE bd.joueur.numero_personne = bd.joueur.numero_personne && bd.joueur.pseudo = pseudo;



--------------------------------------------------------------------------
-------------------------- Consultation ----------------------------------
--------------------------------------------------------------------------


----------------------------  1  ------------------------------
select * 
from bd.jeu, bd.theme, bd.utilsation_theme, bd.configuration, bd.avis, bd.mecanique, bd.utilsation_mecanique
where bd.theme.theme='Policier' 
and bd.theme.numero_theme=bd.utilsation_theme.numero_theme
and bd.jeu.numero_jeu=bd.utilsation_theme.numero_jeu
and bd.avis.numero_configuration=bd.configuration.numero_configuration
and bd.configuration.numero_jeu=bd.jeu.numero_jeu
and bd.jeu.numero_jeu=bd.utilsation_mecanique.numero_jeu
and bd.mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique
group by bd.jeu.numero_jeu
order by bd.mecanique.mecanisme;

--- ou 

select * 
from bd.jeu
inner join bd.utilsation_theme on bd.utilsation_theme.numero_jeu=bd.jeu.numero_jeu
inner join  bd.theme on bd.theme.numero_theme=bd.utilsation_theme.numero_theme
inner join bd.configuration on bd.configuration.numero_jeu=bd.jeu.numero_jeu
inner join bd.avis on bd.avis.numero_configuration=bd.configuration.numero_configuration
inner join bd.utilsation_mecanique on bd.jeu.numero_jeu=bd.utilsation_mecanique.numero_jeu
inner join bd.mecanique on bd.mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique
where bd.theme.theme='Policier'
group by bd.jeu.numero_jeu
order by bd.mecanique.mecanisme;

----------------------------  2  ------------------------------

select *
from bd.avis
inner join bd.configuration on bd.configuration.numero_configuration=bd.avis.numero_configuration
inner join bd.jeu on bd.jeu.numero_jeu=bd.configuration.numero_jeu
inner join bd.utilsation_mecanique on bd.utilsation_mecanique.numero_jeu=bd.jeu.numero_jeu
inner join bd.preference_mecanique on bd.preference_mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique
inner join bd.joueur on bd.preference_mecanique.numero_personne=bd.joueur.numero_personne
where bd.joueur.numero_personne=6;
-- réslutat qu'avec 6 pour le moment vu les données


----------------------------  3  ------------------------------

select *
from bd.joueur
inner join bd.appreciation on bd.appreciation.numero_personne=bd.joueur.numero_personne
inner join bd.avis on bd.avis.numero_avis=bd.appreciation.numero_avis
where bd.avis.numero_avis=3;