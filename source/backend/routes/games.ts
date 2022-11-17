import express from 'express';
import { getGamesByMechanics, getThemeNames } from '../models/gameModels';
const router = express.Router();

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET games filtered by mechanics */
router.post('/list', getGamesByMechanics);

export default router;
