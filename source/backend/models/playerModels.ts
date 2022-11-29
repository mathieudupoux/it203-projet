import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllPlayers = (req: Request, res: Response) => {
    let sql = "select * from joueur";
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

export const addNewPlayer =   (req: Request, res : Response) => {
    let sql = `INSERT INTO joueur(pseudo, mail) VALUES (?)`;
    let values = [
      req.body.user_name,
      req.body.user_gender
    ];
    console.log(values);
    execute(sql, [values]).then(data => res.json(data)).catch(err => res.status(200).json(err));
  }