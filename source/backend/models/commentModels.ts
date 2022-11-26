
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllComments = (req: Request, res: Response) => {
    let sql = "select * from avis";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostRecentComments = (req: Request, res: Response) => {
    let sql = "select * from bd.avis " +
        "order by bd.avis.date_avis DESC " +
        "limit " + req.params.count + ";";
    let values = [
        req.params.count
    ]
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostDebatedComment = (req: Request, res: Response) => {
    let sql = "select *, count(bd.appreciation.pertinence) from bd.avis " +
        "inner join bd.appreciation on bd.appreciation.numero_avis=bd.avis.numero_avis " +
        "group by bd.avis.numero_avis " +
        "order by count(bd.appreciation.pertinence) desc " +
        "limit 1;";
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