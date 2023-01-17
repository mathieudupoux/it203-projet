import express from 'express';
import { execute } from '../utils/mariadb.connector';

const router = express.Router();

/* GET home page. */
router.get('/', function (_req, res, _next) {
  res.redirect("/admin/admin.html");
});

/* POST database creation */
router.post('/createdb', function (_req, res, _next) {
  const createScript = 'source "../../sql/create.sql"';
  execute(createScript, []).then(data => res.redirect("admin.html")).catch(err => res.status(200).json(err));
  console.log("Database creation try");
})

export default router;
