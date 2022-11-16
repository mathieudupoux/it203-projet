-- ============================================================
--    suppression des donnees
-- ============================================================

delete from bd.personne ;
delete from bd.jeu ;
delete from bd.joueur ;
delete from bd.mecanique ;
delete from bd.theme ;
delete from bd.extension ;
delete from bd.concepteur ;
delete from bd.illustrateur ;
delete from bd.avis ;
delete from bd.appreciation ;
delete from bd.configuration ;
delete from bd.extension_configuration ;
delete from bd.preference_mecanique ;
delete from bd.preference_theme ;
delete from bd.utilsation_mecanique ;
delete from bd.utilsation_theme ;

commit ;

-- ============================================================
--    creation des donnees
-- ============================================================

-- bd.personne

insert into bd.personne values (  1 , 'Michel'     , 'Jean'        ) ;
insert into bd.personne values (  2 , 'Pineau'     , 'Claude'      ) ;
insert into bd.personne values (  3 , 'Catonais'   , 'Eric'        ) ;
insert into bd.personne values (  4 , 'Zinedine'   , 'Zizou'       ) ;
insert into bd.personne values (  5 , 'Avoine'     , 'Marc'        ) ;
insert into bd.personne values (  6 , 'Hollandais' , 'Francois'    ) ;
insert into bd.personne values (  7 , 'Lhermitte'  , 'Bernard'     ) ;
insert into bd.personne values (  8 , 'Firefox'    , 'Mozzila'     ) ;
insert into bd.personne values (  9 , 'Linux'      , 'Ubuntu'      ) ;
insert into bd.personne values ( 10 , 'Jacques'    , 'Jean'        ) ;
insert into bd.personne values ( 11 , 'Magne'      , 'Charles'     ) ;
insert into bd.personne values ( 12 , 'Premier'    , 'Francois'    ) ;
insert into bd.personne values ( 13 , 'Bonaparte'  , 'Napoleon'    ) ;
insert into bd.personne values ( 14 , 'Bus'        , 'Car'         ) ;
insert into bd.personne values ( 15 , 'Fiesta'     , 'Ford'        ) ;
insert into bd.personne values ( 16 , 'Vovard'     , 'Marine'      ) ;
insert into bd.personne values ( 17 , 'Dupoux'     , 'Mathieu'     ) ;
insert into bd.personne values ( 18 , 'Bizon'      , 'Nolan'       ) ;
insert into bd.personne values ( 19 , 'Gigault'    , 'Theodore'    ) ;

commit ;

-- bd.jeu

insert into bd.jeu values (  1 , 'Monopoly'        , 'Hasbro'          , '1935-02-06'  , 'bd.jeu de societe'  , 150) ;
insert into bd.jeu values (  2 , 'Cluedo'          , 'Miro Company'    , '1949-01-01'  , 'bd.jeu de societe'  , 30) ;
insert into bd.jeu values (  3 , 'TTMC'            , '-'               , '2016-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu values (  4 , 'Mille Bornes'    , 'Dujardin'        , '1954-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu values (  5 , 'Croque Carotte'  , 'Ravensburger'    , '2001-01-01'  , 'bd.jeu de societe'  , 20) ;
insert into bd.jeu values (  6 , 'Abalone'         , 'Asmodee'         , '1989-01-01'  , 'bd.jeu de societe'  , 15) ;
insert into bd.jeu values (  7 , 'Oriflamme'       , 'Studio H'        , '2020-01-01'  , 'bd.jeu de societe'  , 20) ;

commit ;

-- bd.joueur

insert into bd.joueur values ( 15 , 'clio'             , 'ford.fiesta@gmail.com'           ) ;
insert into bd.joueur values (  6 , 'g_t_president'    , 'f.hollandais@gmail.com'          ) ;
insert into bd.joueur values (  3 , 'vive_le_riz'      , 'cantoneric@gmail.com'            ) ;
insert into bd.joueur values ( 14 , 'tbm'              , 'tbm.bus.car@gmail.com'           ) ;

commit ;


-- bd.mecanique

insert into bd.mecanique values (   1 , 'Draft'            ) ;
insert into bd.mecanique values (   2 , 'Deckbuilding'     ) ;
insert into bd.mecanique values (   3 , 'Tactique'         ) ;
insert into bd.mecanique values (   4 , 'Strategie'        ) ;
insert into bd.mecanique values (   5 , 'Majorite'         ) ;
insert into bd.mecanique values (   6 , 'Adresse'          ) ;
insert into bd.mecanique values (   7 , 'Memoire'          ) ;
insert into bd.mecanique values (   8 , 'Culture'          ) ;
insert into bd.mecanique values (   9 , 'Bluff'            ) ;
insert into bd.mecanique values (  10 , 'Encheres'         ) ;
insert into bd.mecanique values (  11 , 'Commerce'         ) ;
insert into bd.mecanique values (  12 , 'Reflexe'          ) ;
insert into bd.mecanique values (  13 , 'Parcours'         ) ;
insert into bd.mecanique values (  14 , 'Reflexion'        ) ;
insert into bd.mecanique values (  15 , 'Sens'             ) ;
insert into bd.mecanique values (  16 , 'Stop ou Encore'   ) ;
insert into bd.mecanique values (  17 , 'Observation'      ) ;
insert into bd.mecanique values (  18 , 'Gages'            ) ;
insert into bd.mecanique values (  19 , 'Cooperation'      ) ;
insert into bd.mecanique values (  20, 'Hasard'           ) ;

commit;


-- bd.theme

insert into bd.theme values (   1 , 'Immobilier'   ) ;
insert into bd.theme values (   2 , 'Policier'     ) ;
insert into bd.theme values (   3 , 'Aventure'     ) ;
insert into bd.theme values (   4 , 'Automobile'   ) ;
insert into bd.theme values (   5 , 'Animaux'      ) ;
insert into bd.theme values (   6 , 'Sciences'     ) ;

commit;


-- bd.extension

insert into bd.extension values (   1 , 'Embrasement'  ) ;
insert into bd.extension values (   2 , 'Alliance'     ) ;

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


-- avis

insert into bd.avis values ( 1 , '2022-09-16'  , 5 , 'Genial, nous avons passe un super moment !'                                           , 0 , 2) ;
insert into bd.avis values ( 2 , '2022-09-15'  , 0 , 'Vraiment nul.'                                                                        , 3 , 3) ;
insert into bd.avis values ( 3 , '2022-04-12'  , 2 , 'G pa compri le regle du bd.jeu'                                                       , 5 , 1) ;
insert into bd.avis values ( 4 , '2022-03-01'  , 4 , 'Sympa mais je perds tout le temps...'                                                 , 7 , 5) ;
insert into bd.avis values ( 5 , '2022-11-19'  , 3 , 'J avais commande le dernier FIFA a Noel et j ai eut ce bd.jeu... Bien malgre tout '   , 3 , 2) ;

commit;

-- appreciation

insert into bd.appreciation values (  13 , 1 ,  1  ) ;
insert into bd.appreciation values (   8 , 2 , -1  ) ;
insert into bd.appreciation values (   7 , 5 , -1  ) ;
insert into bd.appreciation values (   6 , 3 ,  1  ) ;

commit;

-- configuration

insert into bd.configuration values (   1 , 4 ,  1  ) ;
insert into bd.configuration values (   2 , 2 ,  2  ) ;
insert into bd.configuration values (   3 , 5 ,  2  ) ;
insert into bd.configuration values (   4 , 3 ,  3  ) ;

commit;

-- extension_configuration

insert into bd.extension_configuration values (   1 , 4  ) ;
insert into bd.extension_configuration values (   2 , 2  ) ;
insert into bd.extension_configuration values (   3 , 5  ) ;
insert into bd.extension_configuration values (   4 , 3  ) ;

commit;

-- preference_mecanique

insert into bd.preference_mecanique values (  15 , 4  ) ;
insert into bd.preference_mecanique values (   6 , 2  ) ;
insert into bd.preference_mecanique values (   3 , 5  ) ;
insert into bd.preference_mecanique values (  14 , 3  ) ;

commit;

-- preference_theme

insert into bd.preference_theme values (  15 , 4  ) ;
insert into bd.preference_theme values (   6 , 2  ) ;
insert into bd.preference_theme values (   3 , 5  ) ;
insert into bd.preference_theme values (  14 , 3  ) ;

commit;

--
-- utilsation_mecanique

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
