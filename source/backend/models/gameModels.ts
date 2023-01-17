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
    let values = [req.query.nom_jeu, req.query.editeur, req.query.date_de_parution, req.query.type_de_jeu, req.query.duree];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkGameTheme = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.utilsation_theme (numero_jeu, numero_theme)
    select bd.jeu.numero_jeu, bd.theme.numero_theme
    from bd.jeu, bd.theme
    where bd.jeu.nom=?
    and bd.theme.theme=?`;
    let values = [req.query.nom_jeu, req.query.theme];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const linkGameMecanisme = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.utilsation_mecanique (numero_jeu, numero_mecanique)
    select bd.jeu.numero_jeu, bd.mecanique.numero_mecanique
    from bd.jeu, bd.mecanique
    where bd.jeu.nom=?
    and bd.mecanique.mecanisme=?`;
    let values = [req.query.nom_jeu, req.query.mecanisme];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const removeGame = (req: Request, res: Response) => {
    let sql = "DELETE FROM bd.jeu WHERE numero_jeu = ?";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const updateGame = (req: Request, res: Response) => {
    let sql = "UPDATE bd.jeu SET nom = ?, editeur = ?, date_de_parution = ?, type_de_jeu = ?, duree = ? WHERE numero_jeu = ?";;
    let values = [req.body.nom, req.body.editeur, req.body.date_de_parution, req.body.type_de_jeu, req.body.duree, req.body.numero_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const AddConfig = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.configuration (nb_joueurs, numero_jeu)
    select ? , bd.jeu.numero_jeu
    from bd.jeu
    where bd.jeu.nom=?`;
    let values = [req.query.nb_joueur, req.query.nom_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const AddExtension = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.extension (nom, date_parution, numero_jeu)
    select ? , ?, bd.jeu.numero_jeu
    from bd.jeu
    where bd.jeu.nom=?`;
    let values = [req.query.nom_extension, req.query.date_de_parution, req.query.nom_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const LinkExtension = (req: Request, res: Response) => {
    let sql = `INSERT INTO bd.extension_configuration (numero_configuration, numero_extension)
    select ?, bd.extension.numero_extension
    from bd.extension
    where bd.extension.nom=?`;
    let values = [req.query.num_config,req.query.nom_extension];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const GetConfigByGameName = (req: Request, res: Response) => {
    let sql = `select bd.configuration.*
    from bd.configuration, bd.jeu
    where  bd.configuration.numero_jeu = bd.jeu.numero_jeu and bd.jeu.nom = ?`;
    let values = [req.query.nom_jeu];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getMecanicsFromIdGame = (req: Request, res: Response) => {
    let sql = "SELECT bd.mecanique.mecanisme FROM bd.jeu NATURAL JOIN bd.utilsation_mecanique NATURAL JOIN bd.mecanique WHERE bd.jeu.numero_jeu = ?;";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getThemesFromIdGame = (req: Request, res: Response) => {
    let sql = "SELECT bd.theme.theme FROM bd.jeu NATURAL JOIN bd.utilsation_theme NATURAL JOIN bd.theme WHERE bd.jeu.numero_jeu = ?;";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}