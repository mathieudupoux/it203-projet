import express from 'express';
import { getAllGames, getGamesByMechanics, getThemeNames } from '../models/gameModels';
const router = express.Router();

/* GET all games */
router.get('/list/', getAllGames);

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET games filtered by mechanics */
router.get('/list/:mechanic', getGamesByMechanics);

export default router;