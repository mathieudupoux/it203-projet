import express from 'express';
import { execute } from '../utils/mariadb.connector'
import { getPlayerById, getPlayerCommentsOnPreferedGames, getPlayerGamesByPreferences } from '../models/playerModels';

const router = express.Router();

/* GET player by id. */
router.get('/:id', getPlayerById);

router.get('/list', function (req, res) {
  let sql = `SELECT * FROM joueur`;
  execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
});

// create new player
router.post('/new', function (req, res) {
  let sql = `INSERT INTO joueur(pseudo, mail) VALUES (?)`;
  let values = [
    req.body.user_name,
    req.body.user_gender
  ];
  console.log(values);
  execute(sql, [values]).then(data => res.json(data)).catch(err => res.status(200).json(err));
});

router.get('/games/:id/preferedOnly', getPlayerGamesByPreferences);

router.get('/comments/:id/preferedOnly', getPlayerCommentsOnPreferedGames);

export default router;
