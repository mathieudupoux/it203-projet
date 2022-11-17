import express from 'express';
import { getLogger } from '@/utils/loggers';
import { execute } from '@/utils/mariadb.connector'

const router = express.Router();
const logger = getLogger('PLAYER_ROUTE');

/* GET player listing. */
router.get('/', function (_req, res, _next) {
  logger.info('respond with a resource');
  res.send('respond with a resource');
});

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

export default router;
