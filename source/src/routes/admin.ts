import express from 'express';
import { getLogger } from '../utils/loggers';
import { execute } from '../utils/mariadb.connector';

const router = express.Router();
const logger = getLogger('INDEX_ROUTE');

/* GET home page. */
router.get('/', function (_req, res, _next) {
  logger.info('Admin page opened');
  res.redirect("admin.html");
});

/* POST database creation */
router.post('/createdb', function (_req, res, _next) {
  logger.info('Database generation requested');
  const createScript = `../../sql/create.sql`;
  execute(createScript, []).then(data => res.redirect("admin.html")).catch(err => res.status(200).json(err));
})

export default router;
