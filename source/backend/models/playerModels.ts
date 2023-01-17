import { Request, RequestHandler } from "express";
import { Query, Response } from "express-serve-static-core";
import { ServerResponse } from "http";
import { execute } from "../utils/mariadb.connector";
import mysql from "mysql";

export const getAllPlayers = (req: Request, res: Response) => {
    let sql = `select count(bd.avis.numero_avis) as nombre_avis, bd.joueur.* 
        from joueur
        left join bd.avis on bd.avis.numero_personne=bd.joueur.numero_personne
        group by bd.joueur.numero_personne
        order by count(bd.avis.numero_avis) DESC;`;
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getPlayerById = (req: Request, res: Response) => {
    let sql = "select * from bd.joueur where numero_personne = (?);";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}


export const getPlayerCommentsOnPreferedGames = (req: Request, res: Response) => {
    let sql = "select * from bd.avis " +
        "inner join bd.configuration on bd.configuration.numero_configuration=bd.avis.numero_configuration " +
        "inner join bd.jeu on bd.jeu.numero_jeu=bd.configuration.numero_jeu " +
        "inner join bd.utilsation_mecanique on bd.utilsation_mecanique.numero_jeu=bd.jeu.numero_jeu " +
        "inner join bd.preference_mecanique on bd.preference_mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique " +
        "inner join bd.joueur on bd.preference_mecanique.numero_personne=bd.joueur.numero_personne " +
        "where bd.joueur.numero_personne=(?);"
    let values = [
        req.params.id,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getPlayerGamesByPreferences = (req: Request, res: Response) => {
    let sql = "SELECT * FROM jeu as G " +
        "INNER JOIN utilsation_mecanique as UM on G.numero_jeu=UM.numero_jeu " +
        "INNER JOIN mecanique as M on UM.numero_mecanique=M.numero_mecanique " +
        "INNER JOIN preference_mecanique as PU on PU.numero_mecanique=UM.numero_mecanique " +
        "INNER JOIN joueur as J on J.numero_personne = PU.numero_personne " +
        "WHERE J.numero_personne=(?)";
    let values = [
        req.params.id,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const addNewPlayer = (req: Request, res: Response) => {
    let sql = `INSERT INTO joueur(numero_personne,pseudo,mail) VALUES (?,?,?);`;
    let values = [req.query.id, req.query.pseudo, req.query.mail];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const removePlayer = (req: Request, res: Response) => {
    let sql = "DELETE FROM bd.joueur WHERE numero_personne = ?";;
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const updatePlayer = (req: Request, res: Response) => {
    let sql = "UPDATE bd.joueur SET pseudo = ?, mail = ? WHERE numero_personne = ?";;
    let values = [req.query.pseudo, req.query.mail, req.query.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkPlayerTheme = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.preference_theme (numero_personne, numero_theme)
    select bd.joueur.numero_personne, bd.theme.numero_theme
    from bd.joueur, bd.theme
    where bd.joueur.numero_personne=?
    and bd.theme.theme=?`;
    let values = [req.query.numero_personne, req.query.theme];
    console.log(values);
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkPlayerMecanic = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.preference_mecanique (numero_personne, numero_mecanique)
    select bd.joueur.numero_personne, bd.mecanique.numero_mecanique
    from bd.joueur, bd.mecanique
    where bd.joueur.numero_personne=?
    and bd.mecanique.mecanisme=?`;
    let values = [req.query.numero_personne, req.query.mecanisme];
    console.log(values);
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}