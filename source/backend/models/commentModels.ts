
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllComments = (req: Request, res: Response) => {
    let sql = "select * from avis";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostRecentComments = (req: Request, res: Response) => {
    let sql = `select bd.avis.*, count(bd.appreciation.pertinence) as nbUp, jeu.numero_jeu, jeu.nom from bd.avis
    left join bd.appreciation using(numero_avis)
    inner join bd.configuration using(numero_configuration)
    inner join bd.jeu using(numero_jeu)
    group by bd.avis.numero_avis
    order by bd.avis.date_avis DESC
    limit ${req.params.count};`;
    let values = [
        req.params.count
    ]
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostReliableComments = (req: Request, res: Response) => {
    let sql = `select * from bd.avis inner join
    (
    with c_table as ( select numero_avis,
    case 
      WHEN sum(pertinence)>=1 THEN sum(pertinence)
      ELSE 0
    end as c
    from bd.appreciation
    group by numero_avis)
    , d_table as ( select numero_avis,
    case 
      WHEN sum(pertinence)<=-1 THEN sum(pertinence)*-1
      ELSE 0
    end as d
    from bd.appreciation
    group by numero_avis)
    select c_table.numero_avis,(1+c_table.c)/(1+d_table.d) as indice
    from c_table
    inner join d_table on c_table.numero_avis=d_table.numero_avis
    group by c_table.numero_avis)
    as classement on bd.avis.numero_avis=classement.numero_avis
    order by classement.indice DESC;`;
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostDebatedComment = (req: Request, res: Response) => {
    let sql = `select bd.avis.*, count(bd.appreciation.pertinence) as nbUp, jeu.numero_jeu, jeu.nom from bd.avis
    inner join bd.appreciation on bd.appreciation.numero_avis=bd.avis.numero_avis
    inner join bd.configuration using(numero_configuration)
    inner join bd.jeu using(numero_jeu)
    group by bd.avis.numero_avis
    order by nbUp desc
    limit 1`;
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getCommentsAppreciators = (req: Request, res: Response) => {
    let sql = "select * from bd.joueur " +
        "inner join bd.appreciation on bd.appreciation.numero_personne=bd.joueur.numero_personne " +
        "inner join bd.avis on bd.avis.numero_avis=bd.appreciation.numero_avis " +
        "where bd.avis.numero_avis=(?);"
    let values = [
        req.params.commentID,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMainGameFromComment = (req: Request, res: Response) => {
    let sql = `SELECT * FROM jeu as J
    INNER JOIN configuration as C using(numero_jeu)
    INNER JOIN avis as A using(numero_configuration)
    WHERE A.numero_avis = ?;`;
    let values = [
        req.params.commentID,
    ]
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const addCommentOnConfig = (req: Request, res: Response) => {
    let sql = "INSERT INTO bd.avis(date_avis,note,commentaire,numero_configuration,numero_personne) VALUES (?,?,?,?,?);";
    let values = [
        req.body.date_avis,
        req.body.note,
        req.body.commentaire,
        req.body.numero_configuration,
        req.body.numero_personne
    ];
    console.log(values);
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}