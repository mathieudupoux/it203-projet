import express from 'express';
import { execute } from 'utils/mariadb.connector'

const router = express.Router();

/* GET player listing. */
router.post('/list', function (req, res, _next) {
  let sql = 'SELECT * FROM jeu NATURAL JOIN mecanique NATURAL JOIN theme WHERE theme.theme=(?)';
  let values = [
    req.body.thema_filter,
  ];
  console.log(values);
  execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
});

export default router;
