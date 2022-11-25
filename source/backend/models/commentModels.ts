
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllComments = (req: Request, res: Response) => {
    let sql = "select * from avis";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getCommentsAppreciators = (req: Request, res: Response) => {
    let sql = "select * from bd.joueur " +
        "inner join bd.appreciation on bd.appreciation.numero_personne=bd.joueur.numero_personne " +
        "inner join bd.avis on bd.avis.numero_avis=bd.appreciation.numero_avis " +
        "where bd.avis.numero_avis=(?) and bd.appreciation.pertinence=true;"
    let values = [
        req.params.commentID,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}