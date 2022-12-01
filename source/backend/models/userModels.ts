import { Request, RequestHandler } from "express";
import { Response } from "express-serve-static-core";
import { execute } from "../utils/mariadb.connector";
import { BodyParser } from "body-parser";

export const getAllUsers = (req: Request, res: Response) => {
    let sql = "select * from personne";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const addNewUser = (req: Request, res: Response) => {
    console.log("Test Please");
    let sql = `insert into bd.personne(nom, prenom) VALUES (?,?);`;
    execute(sql, [req.params.nom, req.params.prenom]).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const getUserById = (req: Request, res: Response) => {
    let sql = "select * from bd.personne where numero_personne = (?);";
    let values = [req.params.id];
    execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
}

export const removeUser = (req: Request, res: Response) => {
    let sql = "select * from personne";
    execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
}