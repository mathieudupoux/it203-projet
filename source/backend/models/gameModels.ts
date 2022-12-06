import { Request } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";

export const getAllGames = (req: Request, res: Response) => {
    let sql = `SELECT * FROM jeu as J`
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getGames = (req: Request, res: Response) => {
    let sql = "SELECT * FROM bd.jeu ";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getThemeNames = (req: Request, res: Response) => {
    let sql = "SELECT numero_theme, theme FROM theme";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getMechanicNames = (req: Request, res: Response) => {
    let sql = "SELECT numero_mecanique, mecanisme FROM mecanique";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getPlayers = (req: Request, res: Response) => {
    let sql = "SELECT numero_personne,pseudo,mail FROM joueur";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(499).json(err));
}

export const getConfigFromID = (req: Request, res: Response) => {
    let sql = `SELECT * from vue_config WHERE numero_configuration = (?)`
    let values = [
        req.params.numero_configuration,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}
export const getConfigFromMainGame = (req: Request, res: Response) => {
    let sql = `SELECT * from vue_config WHERE numero_jeu = (?)`
    let values = [
        req.params.numero_jeu,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getGamesByTheme = (req: Request, res: Response) => {
    let sql = `SELECT * FROM bd.jeu
        INNER JOIN utilsation_theme USING(numero_jeu)
        INNER JOIN theme USING(numero_theme)
        LEFT OUTER JOIN (
        SELECT numero_mecanique, numero_jeu, MAX(mecanisme) as mecanisme FROM mecanique
        INNER JOIN utilsation_mecanique USING(numero_mecanique)
        GROUP BY mecanisme
        ) AS UM ON UM.numero_jeu=jeu.numero_jeu
        WHERE numero_theme=(?)
        ORDER BY mecanisme DESC
;`
    let values = [
        req.params.numero_theme,
    ];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}
export const addGame = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.jeu (nom, editeur, date_de_parution, type_de_jeu, duree) VALUES (?,?,?,?,?)`;
    let values = [req.query.nom_jeu, req.query.editeur, req.query.date_de_parution, req.query.type_de_jeu, req.query.duree_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkGameTheme = (req: Request, res: Response) => {
    let sql = ` insert into bd.utilsation_theme
    select bd.jeu.numero_jeu, bd.theme.numero_theme
    from bd.jeu, bd.theme
    where bd.jeu.nom=(?)
    and bd.theme.theme=(?);`;
    let values = [req.query.nom_jeu, req.query.theme];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkGameMecanisme = (req: Request, res: Response) => {
    let sql = `insert into bd.utilsation_mecanique 
    select bd.jeu.numero_jeu, bd.mecanique.numero_mecanique
    from bd.jeu, bd.mecanique
    where bd.jeu.nom=(?)
    and bd.mecanique.mecanisme=(?);`;
    let values = [req.query.nom_jeu, req.query.mecanisme];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const removeGame = (req: Request, res: Response) => {
    let sql = "DELETE FROM bd.jeu WHERE numero_jeu = ?";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}