-- ============================================================
--    suppression des donnees
-- ============================================================

delete from bd.utilsation_mecanique ;
delete from bd.utilsation_theme ;
delete from bd.preference_mecanique ;
delete from bd.preference_theme ;
delete from bd.extension_configuration ;
delete from bd.appreciation ;
delete from bd.mecanique ;
delete from bd.theme ;
delete from bd.extension ;
delete from bd.concepteur ;
delete from bd.illustrateur ;
delete from bd.avis ;
delete from bd.configuration ;
delete from bd.jeu ;
delete from bd.joueur ;
delete from bd.personne ;

commit ;

-- ============================================================
--    Initialisation des auto-increment a 0 
-- ============================================================

ALTER TABLE bd.personne AUTO_INCREMENT=0;
ALTER TABLE bd.jeu AUTO_INCREMENT=0;
ALTER TABLE bd.mecanique AUTO_INCREMENT=0;
ALTER TABLE bd.theme AUTO_INCREMENT=0;
ALTER TABLE bd.extension AUTO_INCREMENT=0;
ALTER TABLE bd.configuration AUTO_INCREMENT=0;
ALTER TABLE bd.avis AUTO_INCREMENT=0;

commit;

-- ============================================================
--    creation des donnees
-- ============================================================

-- bd.personne

insert into bd.personne (nom, prenom) values ( 'Michel'     , 'Jean'        ) ;
insert into bd.personne (nom, prenom) values ( 'Pineau'     , 'Claude'      ) ;
insert into bd.personne (nom, prenom) values ( 'Catonais'   , 'Eric'        ) ;
insert into bd.personne (nom, prenom) values ( 'Zinedine'   , 'Zizou'       ) ;
insert into bd.personne (nom, prenom) values ( 'Avoine'     , 'Marc'        ) ;
insert into bd.personne (nom, prenom) values ( 'Hollandais' , 'Francois'    ) ;
insert into bd.personne (nom, prenom) values ( 'Lhermitte'  , 'Bernard'     ) ;
insert into bd.personne (nom, prenom) values ( 'Firefox'    , 'Mozzila'     ) ;
insert into bd.personne (nom, prenom) values ( 'Linux'      , 'Ubuntu'      ) ;
insert into bd.personne (nom, prenom) values ( 'Jacques'    , 'Jean'        ) ;
insert into bd.personne (nom, prenom) values ( 'Magne'      , 'Charles'     ) ;
insert into bd.personne (nom, prenom) values ( 'Premier'    , 'Francois'    ) ;
insert into bd.personne (nom, prenom) values ( 'Bonaparte'  , 'Napoleon'    ) ;
insert into bd.personne (nom, prenom) values ( 'Bus'        , 'Car'         ) ;
insert into bd.personne (nom, prenom) values ( 'Fiesta'     , 'Ford'        ) ;
insert into bd.personne (nom, prenom) values ( 'Vovard'     , 'Marine'      ) ;
insert into bd.personne (nom, prenom) values ( 'Dupoux'     , 'Mathieu'     ) ;
insert into bd.personne (nom, prenom) values ( 'Bizon'      , 'Nolan'       ) ;
insert into bd.personne (nom, prenom) values ( 'Gigault'    , 'Theodore'    ) ;

commit ;

-- bd.jeu

insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Monopoly'        , 'Hasbro'          , '1935-02-06'  , 'bd.jeu de societe'  , 150) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Cluedo'          , 'Miro Company'    , '1949-01-01'  , 'bd.jeu de societe'  , 30) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'TTMC'            , '-'               , '2016-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Mille Bornes'    , 'Dujardin'        , '1954-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Croque Carotte'  , 'Ravensburger'    , '2001-01-01'  , 'bd.jeu de societe'  , 20) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Abalone'         , 'Asmodee'         , '1989-01-01'  , 'bd.jeu de societe'  , 15) ;
insert into bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) values ( 'Oriflamme'       , 'Studio H'        , '2020-01-01'  , 'bd.jeu de societe'  , 20) ;

commit ;

-- bd.joueur

insert into bd.joueur values (  2, 'clio'             , 'ford.fiesta@gmail.com'           ) ;
insert into bd.joueur values (  6, 'g_t_president'    , 'f.hollandais@gmail.com'          ) ;
insert into bd.joueur values (  3, 'vive_le_riz'      , 'cantoneric@gmail.com'            ) ;
insert into bd.joueur values (  5, 'tbm'              , 'tbm.bus.car@gmail.com'           ) ;

commit ;


-- bd.mecanique

insert into bd.mecanique (mecanisme) values ( 'Draft'            ) ;
insert into bd.mecanique (mecanisme) values ( 'Deckbuilding'     ) ;
insert into bd.mecanique (mecanisme) values ( 'Tactique'         ) ;
insert into bd.mecanique (mecanisme) values ( 'Strategie'        ) ;
insert into bd.mecanique (mecanisme) values ( 'Majorite'         ) ;
insert into bd.mecanique (mecanisme) values ( 'Adresse'          ) ;
insert into bd.mecanique (mecanisme) values ( 'Memoire'          ) ;
insert into bd.mecanique (mecanisme) values ( 'Culture'          ) ;
insert into bd.mecanique (mecanisme) values ( 'Bluff'            ) ;
insert into bd.mecanique (mecanisme) values ( 'Encheres'         ) ;
insert into bd.mecanique (mecanisme) values ( 'Commerce'         ) ;
insert into bd.mecanique (mecanisme) values ( 'Reflexe'          ) ;
insert into bd.mecanique (mecanisme) values ( 'Parcours'         ) ;
insert into bd.mecanique (mecanisme) values ( 'Reflexion'        ) ;
insert into bd.mecanique (mecanisme) values ( 'Sens'             ) ;
insert into bd.mecanique (mecanisme) values ( 'Stop ou Encore'   ) ;
insert into bd.mecanique (mecanisme) values ( 'Observation'      ) ;
insert into bd.mecanique (mecanisme) values ( 'Gages'            ) ;
insert into bd.mecanique (mecanisme) values ( 'Cooperation'      ) ;
insert into bd.mecanique (mecanisme) values ( 'Hasard'           ) ;

commit;


-- bd.theme

insert into bd.theme (theme) values ( 'Immobilier'   ) ;
insert into bd.theme (theme) values ( 'Policier'     ) ;
insert into bd.theme (theme) values ( 'Aventure'     ) ;
insert into bd.theme (theme) values ( 'Automobile'   ) ;
insert into bd.theme (theme) values ( 'Animaux'      ) ;
insert into bd.theme (theme) values ( 'Sciences'     ) ;

commit;


-- bd.extension

insert into bd.extension (nom, date_parution, numero_jeu) values ( 'Embrasement'  , '2021-09-16', 6) ;
insert into bd.extension (nom, date_parution, numero_jeu) values ( 'Alliance'     , '2022-03-16', 6) ;

commit;


-- bd.illustrateurs

insert into bd.illustrateur values (   5 , 1 ) ;
insert into bd.illustrateur values (   1 , 2 ) ;
insert into bd.illustrateur values (   3 , 6 ) ;
insert into bd.illustrateur values (   4 , 7 ) ;

commit;


-- bd.concepteurs

insert into bd.concepteur values (   9 , 1 ) ;
insert into bd.concepteur values (   8 , 2 ) ;
insert into bd.concepteur values (   7 , 6 ) ;
insert into bd.concepteur values (   6 , 7 ) ;

commit;

-- configuration

insert into bd.configuration (nb_joueurs, numero_jeu) values ( 4 ,  1  ) ;
insert into bd.configuration (nb_joueurs, numero_jeu) values ( 2 ,  2  ) ;
insert into bd.configuration (nb_joueurs, numero_jeu) values ( 5 ,  2  ) ;
insert into bd.configuration (nb_joueurs, numero_jeu) values ( 3 ,  3  ) ;

commit;

-- avis

insert into bd.avis (date_avis, note, commentaire, numero_configuration, numero_personne) values ( '2022-09-16'  , 5 , 'Genial, nous avons passe un super moment !'                                           , 2 , 2) ;
insert into bd.avis (date_avis, note, commentaire, numero_configuration, numero_personne) values ( '2022-09-15'  , 0 , 'Vraiment nul.'                                                                        , 3 , 3) ;
insert into bd.avis (date_avis, note, commentaire, numero_configuration, numero_personne) values ( '2022-04-12'  , 2 , 'Pa compri le regle du jeu'                                                       , 1, 1) ;
insert into bd.avis (date_avis, note, commentaire, numero_configuration, numero_personne) values ( '2022-03-01'  , 4 , 'Sympa mais je perds tout le temps...'                                                 , 1 , 5) ;
insert into bd.avis (date_avis, note, commentaire, numero_configuration, numero_personne) values ( '2022-11-19'  , 3 , 'J avais commande le dernier FIFA a Noel et j ai eut ce jeu... Bien malgre tout '   , 2 , 2) ;

commit;

-- appreciation

insert into bd.appreciation values (  13 , 1 ,  1  ) ;
insert into bd.appreciation values (   8 , 2 , -1  ) ;
insert into bd.appreciation values (   7 , 5 , -1  ) ;
insert into bd.appreciation values (   6 , 3 ,  1  ) ;

commit;



-- extension_configuration

insert into bd.extension_configuration values (   1 , 4  ) ;
insert into bd.extension_configuration values (   2 , 2  ) ;
insert into bd.extension_configuration values (   1 , 2  ) ;
insert into bd.extension_configuration values (   1 , 3  ) ;

commit;

-- preference_mecanique

insert into bd.preference_mecanique values (  2 , 4  ) ;
insert into bd.preference_mecanique values (   6 , 2  ) ;
insert into bd.preference_mecanique values (   3 , 5  ) ;
insert into bd.preference_mecanique values (  2 , 3  ) ;

commit;

-- preference_theme

insert into bd.preference_theme values (  2 , 4  ) ;
insert into bd.preference_theme values (   6 , 2  ) ;
insert into bd.preference_theme values (   3 , 5  ) ;
insert into bd.preference_theme values (  2 , 3  ) ;

commit;

--
-- utilisation_mecanique

insert into bd.utilsation_mecanique values (   1 , 4  ) ;
insert into bd.utilsation_mecanique values (   2 , 2  ) ;
insert into bd.utilsation_mecanique values (   3 , 5  ) ;
insert into bd.utilsation_mecanique values (   4 , 3  ) ;

commit;

-- utilsation_theme

insert into bd.utilsation_theme values (   1 , 1  ) ;
insert into bd.utilsation_theme values (   2 , 2  ) ;
insert into bd.utilsation_theme values (   3 , 5  ) ;
insert into bd.utilsation_theme values (   4 , 3  ) ;

commit;
