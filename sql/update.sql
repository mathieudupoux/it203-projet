UPDATE bd.avis 
SET date_avis = '2022-12-06', note = 10, commentaire = "ceci n'est pas un exercice", numero_configuration = 1, numero_personne = 2 
WHERE numero_avis = 3;

UPDATE bd.jeu 
SET nom = "test_nom_jeu", editeur = "test_editeur", date_de_parution = '2022-12-06', type_de_jeu = "test_type_jeu", duree = 60 
WHERE numero_jeu = 3;

UPDATE bd.joueur 
SET pseudo = "test", mail = "test.joueur@gmail.com" 
WHERE numero_personne = 3;