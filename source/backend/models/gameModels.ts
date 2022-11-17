import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getThemeNames = (req: Request, res: Response) => {
    let sql = "SELECT numero_theme, theme FROM theme";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getGamesByMechanics = (req: Request, res: Response) => {
    let sql = "SELECT J.numero_jeu, J.nom, M.mecanisme FROM jeu as J " +
        "INNER JOIN utilsation_mecanique as UM on J.numero_jeu=UM.numero_jeu " +
        "INNER JOIN mecanique as M on UM.numero_mecanique=M.numero_mecanique " +
        "INNER JOIN utilsation_theme as UT on J.numero_jeu=UT.numero_jeu " +
        "INNER JOIN theme as T on T.numero_theme = UT.numero_theme " +
        "WHERE T.theme LIKE (?)";
    let values = [
        req.body.thema_filter,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}