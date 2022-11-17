import express from 'express';
import { getLogger } from '@/utils/loggers';
import { execute } from '@/utils/mariadb.connector'

const router = express.Router();
const logger = getLogger('GAMES_ROUTE');

/* GET player listing. */
router.post('/list', function (req, res, _next) {
  logger.info('Game page opened');

  let sql =
    'SELECT * FROM jeu NATURAL JOIN mecanique NATURAL JOIN theme WHERE theme.theme=(?)';
  let values = [
    req.body.thema_filter,
  ];
  console.log(values);
  execute(sql, values).then(data => res.json(data)).catch(err => res.status(500).json(err));
});

export default router;
