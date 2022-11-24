import express from 'express';
import { getGamesByMechanics, getThemeNames, getPlayers } from '../models/gameModels';
const router = express.Router();

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET games filtered by mechanics */
router.get('/list/:mechanic', getGamesByMechanics);

export default router;