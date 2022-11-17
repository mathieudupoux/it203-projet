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

  ----------------------------------------------------------------------------
--Requête pour avoir la liste des avis d'un joueur dont le pseudo est "pseudo"--
  ----------------------------------------------------------------------------

 SELECT bd.avis.date_avis, bd.avis.note, bd.avis.commentaire FROM bd.joueur, bd.avis WHERE bd.joueur.numero_personne = bd.joueur.numero_personne && bd.joueur.pseudo = pseudo;

  ------------------------------------------------------------------------------------
--Requête pour avoir la liste des joueurs dont leur thème préféré est le thème "theme"--
  ------------------------------------------------------------------------------------

 SELECT bd.joueur.nom FROM bd.joueur, bd.preference_theme, bd.theme WHERE bd.joueur.numero_personne = bd.preference_theme.numero_personne && bd.theme.numero_theme = bd.preference_theme.numero_theme && bd.theme.theme = theme;

  ------------------------------------------------------------------------------------------------
--Requête pour avoir la liste des joueurs dont leur mécanique préféré est la mécanique "mécanique"--
  ------------------------------------------------------------------------------------------------

 SELECT bd.joueur.nom FROM bd.joueur, bd.preference_mecanique, bd.mecanique WHERE bd.joueur.numero_personne = bd.preference_mecanique.numero_personne && bd.mecanique.numero_mecanique = bd.preference_mecanique.numero_mecanique && bd.mecanique.mecanique = mecanique;
