import { JsonWebKeyInput } from "crypto";
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllGames = (req: Request, res: Response) => {
    let sql = "SELECT * FROM jeu as J " +
        "LEFT OUTER JOIN utilsation_mecanique as UM on J.numero_jeu=UM.numero_jeu " +
        "LEFT OUTER JOIN mecanique as M on UM.numero_mecanique=M.numero_mecanique " +
        "LEFT OUTER JOIN utilsation_theme as UT on J.numero_jeu=UT.numero_jeu " +
        "LEFT OUTER JOIN theme as T on T.numero_theme = UT.numero_theme ";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getThemeNames = (req: Request, res: Response) => {
    let sql = "SELECT numero_theme, theme FROM theme";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getPlayers = (req: Request, res: Response) => {
    let sql = "SELECT numero_personne,pseudo,mail FROM joueur";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getConfigFromMainGame = (req: Request, res: Response) => {
    let sql = `SELECT bd.C.*, J.*, E.* FROM configuration as C
    INNER JOIN extension_configuration as EC ON EC.numero_configuration = C.numero_configuration
    INNER JOIN extension as E ON E.numero_extension=EC.numero_extension
    INNER JOIN jeu as J on C.numero_jeu = J.numero_jeu
    WHERE J.numero_jeu = (?)`;
    let values = [
        req.params.numero_jeu,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));

}

export const getGamesByMechanics = (req: Request, res: Response) => {
    let sql = "select * from bd.jeu " +
        "inner join bd.utilsation_theme on bd.utilsation_theme.numero_jeu=bd.jeu.numero_jeu " +
        "inner join  bd.theme on bd.theme.numero_theme=bd.utilsation_theme.numero_theme " +
        "inner join bd.configuration on bd.configuration.numero_jeu=bd.jeu.numero_jeu " +
        "inner join bd.avis on bd.avis.numero_configuration=bd.configuration.numero_configuration " +
        "inner join bd.utilsation_mecanique on bd.jeu.numero_jeu=bd.utilsation_mecanique.numero_jeu " +
        "inner join bd.mecanique on bd.mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique " +
        "where bd.theme.theme=(?) " +
        "group by bd.jeu.numero_jeu " +
        "order by bd.mecanique.mecanisme;"
    let values = [
        req.params.mechanic,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}
export const addGame = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) VALUES (?,?,?,?,?)`;
    let values = [req.query.nom_jeu, req.query.editeur, req.query.date_de_parution, req.query.type_de_jeu, req.query.duree_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}
