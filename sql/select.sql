 -------------------------------------------------------------------------------------------------
-------                                     JEU                                              ------
 -------------------------------------------------------------------------------------------------


 -------------------------------------------------------
--Requête pour avoir toutes les infos sur tous les jeux--
 -------------------------------------------------------
SELECT * FROM bd.jeu;

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