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

insert into bd.personne values ( 'Michel'     , 'Jean'        ) ;
insert into bd.personne values ( 'Pineau'     , 'Claude'      ) ;
insert into bd.personne values ( 'Catonais'   , 'Eric'        ) ;
insert into bd.personne values ( 'Zinedine'   , 'Zizou'       ) ;
insert into bd.personne values ( 'Avoine'     , 'Marc'        ) ;
insert into bd.personne values ( 'Hollandais' , 'Francois'    ) ;
insert into bd.personne values ( 'Lhermitte'  , 'Bernard'     ) ;
insert into bd.personne values ( 'Firefox'    , 'Mozzila'     ) ;
insert into bd.personne values ( 'Linux'      , 'Ubuntu'      ) ;
insert into bd.personne values ( 'Jacques'    , 'Jean'        ) ;
insert into bd.personne values ( 'Magne'      , 'Charles'     ) ;
insert into bd.personne values ( 'Premier'    , 'Francois'    ) ;
insert into bd.personne values ( 'Bonaparte'  , 'Napoleon'    ) ;
insert into bd.personne values ( 'Bus'        , 'Car'         ) ;
insert into bd.personne values ( 'Fiesta'     , 'Ford'        ) ;
insert into bd.personne values ( 'Vovard'     , 'Marine'      ) ;
insert into bd.personne values ( 'Dupoux'     , 'Mathieu'     ) ;
insert into bd.personne values ( 'Bizon'      , 'Nolan'       ) ;
insert into bd.personne values ( 'Gigault'    , 'Theodore'    ) ;

commit ;

-- bd.jeu

insert into bd.jeu values ( 'Monopoly'        , 'Hasbro'          , '1935-02-06'  , 'bd.jeu de societe'  , 150) ;
insert into bd.jeu values ( 'Cluedo'          , 'Miro Company'    , '1949-01-01'  , 'bd.jeu de societe'  , 30) ;
insert into bd.jeu values ( 'TTMC'            , '-'               , '2016-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu values ( 'Mille Bornes'    , 'Dujardin'        , '1954-01-01'  , 'bd.jeu de societe'  , 60) ;
insert into bd.jeu values ( 'Croque Carotte'  , 'Ravensburger'    , '2001-01-01'  , 'bd.jeu de societe'  , 20) ;
insert into bd.jeu values ( 'Abalone'         , 'Asmodee'         , '1989-01-01'  , 'bd.jeu de societe'  , 15) ;
insert into bd.jeu values ( 'Oriflamme'       , 'Studio H'        , '2020-01-01'  , 'bd.jeu de societe'  , 20) ;

commit ;

-- bd.joueur

insert into bd.joueur values ( 15, 'clio'             , 'ford.fiesta@gmail.com'           ) ;
insert into bd.joueur values (  6, 'g_t_president'    , 'f.hollandais@gmail.com'          ) ;
insert into bd.joueur values (  3, 'vive_le_riz'      , 'cantoneric@gmail.com'            ) ;
insert into bd.joueur values ( 14, 'tbm'              , 'tbm.bus.car@gmail.com'           ) ;

commit ;


-- bd.mecanique

insert into bd.mecanique values ( 'Draft'            ) ;
insert into bd.mecanique values ( 'Deckbuilding'     ) ;
insert into bd.mecanique values ( 'Tactique'         ) ;
insert into bd.mecanique values ( 'Strategie'        ) ;
insert into bd.mecanique values ( 'Majorite'         ) ;
insert into bd.mecanique values ( 'Adresse'          ) ;
insert into bd.mecanique values ( 'Memoire'          ) ;
insert into bd.mecanique values ( 'Culture'          ) ;
insert into bd.mecanique values ( 'Bluff'            ) ;
insert into bd.mecanique values ( 'Encheres'         ) ;
insert into bd.mecanique values ( 'Commerce'         ) ;
insert into bd.mecanique values ( 'Reflexe'          ) ;
insert into bd.mecanique values ( 'Parcours'         ) ;
insert into bd.mecanique values ( 'Reflexion'        ) ;
insert into bd.mecanique values ( 'Sens'             ) ;
insert into bd.mecanique values ( 'Stop ou Encore'   ) ;
insert into bd.mecanique values ( 'Observation'      ) ;
insert into bd.mecanique values ( 'Gages'            ) ;
insert into bd.mecanique values ( 'Cooperation'      ) ;
insert into bd.mecanique values ( 'Hasard'           ) ;

commit;


-- bd.theme

insert into bd.theme values ( 'Immobilier'   ) ;
insert into bd.theme values ( 'Policier'     ) ;
insert into bd.theme values ( 'Aventure'     ) ;
insert into bd.theme values ( 'Automobile'   ) ;
insert into bd.theme values ( 'Animaux'      ) ;
insert into bd.theme values ( 'Sciences'     ) ;

commit;


-- bd.extension

insert into bd.extension values ( 'Embrasement'  ) ;
insert into bd.extension values ( 'Alliance'     ) ;

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

insert into bd.avis values ( '2022-09-16'  , 5 , 'Genial, nous avons passe un super moment !'                                           , 0 , 2) ;
insert into bd.avis values ( '2022-09-15'  , 0 , 'Vraiment nul.'                                                                        , 3 , 3) ;
insert into bd.avis values ( '2022-04-12'  , 2 , 'G pa compri le regle du bd.jeu'                                                       , 5 , 1) ;
insert into bd.avis values ( '2022-03-01'  , 4 , 'Sympa mais je perds tout le temps...'                                                 , 7 , 5) ;
insert into bd.avis values ( '2022-11-19'  , 3 , 'J avais commande le dernier FIFA a Noel et j ai eut ce bd.jeu... Bien malgre tout '   , 3 , 2) ;

commit;

-- appreciation

insert into bd.appreciation values (  13 , 1 ,  1  ) ;
insert into bd.appreciation values (   8 , 2 , -1  ) ;
insert into bd.appreciation values (   7 , 5 , -1  ) ;
insert into bd.appreciation values (   6 , 3 ,  1  ) ;

commit;

-- configuration

insert into bd.configuration values ( 4 ,  1  ) ;
insert into bd.configuration values ( 2 ,  2  ) ;
insert into bd.configuration values ( 5 ,  2  ) ;
insert into bd.configuration values ( 3 ,  3  ) ;

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
