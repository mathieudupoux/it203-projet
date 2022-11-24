import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getPlayerCommentsOnPreferedGames = (req: Request, res: Response) => {
    let sql = "SELECT * FROM avis as A " +
        "INNER JOIN configuration as C on A.numero_configuration = C.numero_configuration " +
        "INNER JOIN jeu as G on G.numero_jeu = C.numero_jeu " +
        "INNER JOIN utilsation_mecanique as UM on G.numero_jeu=UM.numero_jeu " +
        "INNER JOIN mecanique as M on UM.numero_mecanique=M.numero_mecanique " +
        "INNER JOIN preference_mecanique as PU on PU.numero_mecanique=UM.numero_mecanique " +
        "INNER JOIN joueur as J on J.numero_personne = PU.numero_personne " +
        "WHERE J.pseudo LIKE (?)";
    let values = [
        req.params.name,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getPlayerGamesByPreferences = (req: Request, res: Response) => {
    let sql = "SELECT * FROM jeu as G " +
        "INNER JOIN utilsation_mecanique as UM on G.numero_jeu=UM.numero_jeu " +
        "INNER JOIN mecanique as M on UM.numero_mecanique=M.numero_mecanique " +
        "INNER JOIN preference_mecanique as PU on PU.numero_mecanique=UM.numero_mecanique " +
        "INNER JOIN joueur as J on J.numero_personne = PU.numero_personne " +
        "WHERE J.pseudo LIKE (?)";
    let values = [
        req.params.pseudo,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}