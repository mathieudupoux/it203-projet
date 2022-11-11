import express from 'express';
import { getLogger } from '@/utils/loggers';
import { execute } from '@/utils/mariadb.connector'

const router = express.Router();
const logger = getLogger('USER_ROUTE');

/* GET users listing. */
router.get('/', function (_req, res, _next) {
  logger.info('respond with a resource');
  res.send('respond with a resource');
});

router.get('/list', function (req, res) {
  let sql = `SELECT * FROM users`;
  execute(sql, []).then(data => res.json(data)).catch(err => res.status(500).json(err));
});

// create new user
router.post('/new', function (req, res) {
  let sql = `INSERT INTO users(name, gender) VALUES (?)`;
  let values = [
    req.body.name,
    req.body.gender
  ];
  execute(sql, [values]).then(data => res.json(data)).catch(err => res.status(200).json(err));
});

export default router;
