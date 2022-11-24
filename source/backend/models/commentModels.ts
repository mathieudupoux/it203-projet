
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getCommentsAppreciators = (req: Request, res: Response) => {
    let sql = "SELECT * FROM joueur as J " +
        "INNER JOIN appreciation as A on J.numero_personne=A.numero_personne " +
        "INNER JOIN avis as C on A.numero_avis = C.numero_avis " +
        "WHERE A.numero_avis = (?) and A.pertinence=true ";
    let values = [
        req.params.commentID,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}