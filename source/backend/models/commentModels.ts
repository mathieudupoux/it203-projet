
import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllComments = (req: Request, res: Response) => {
    let sql = "select * from avis";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostRecentComments = (req: Request, res: Response) => {
    let sql = `select * from vue_avis
    order by date_avis DESC
    limit ${req.params.count};`;
    let values = [
        req.params.count
    ]
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostReliableComments = (req: Request, res: Response) => {
    let sql = `select * from vue_avis 
    order by indice DESC`;
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMostDebatedComment = (req: Request, res: Response) => {
    let sql = `select * from vue_avis order by nb_appreciations DESC limit 1;`
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
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getCommentFromPlayerPreferences = (req: Request, res: Response) => {
    let sql = `select avis.*, jeu.*
        from bd.avis
        inner join bd.configuration on bd.configuration.numero_configuration=bd.avis.numero_configuration
        inner join bd.jeu on bd.jeu.numero_jeu=bd.configuration.numero_jeu
        inner join bd.utilsation_mecanique on bd.utilsation_mecanique.numero_jeu=bd.jeu.numero_jeu
        inner join bd.preference_mecanique on bd.preference_mecanique.numero_mecanique=bd.utilsation_mecanique.numero_mecanique
        inner join bd.joueur on bd.preference_mecanique.numero_personne=bd.joueur.numero_personne
        where bd.joueur.numero_personne=(?);`
    let values = req.params.numero_joueur;
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));

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

export const removeComment = (req: Request, res: Response) => {
    let sql = "DELETE FROM bd.avis WHERE numero_avis = ?";
    let values = [req.params.id];
    // console.log(values);
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const updateComment = (req: Request, res: Response) => {
    let sql = "UPDATE bd.avis SET date_avis = ?, note = ?, commentaire = ?, numero_configuration = ?, numero_personne = ? WHERE numero_avis = ?";;
    let values = [req.query.date_avis, req.query.note, req.query.commentaire, req.query.numero_configuration, req.query.numero_personne, req.query.numero_avis];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}