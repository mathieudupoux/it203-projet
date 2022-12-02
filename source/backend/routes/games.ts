import express from 'express';
import { getAllGames, getGamesByMechanics, getThemeNames, addGame  } from '../models/gameModels';
const router = express.Router();

/* GET all games */
router.get('/list/', getAllGames);

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET games filtered by mechanics */
router.get('/list/:mechanic', getGamesByMechanics);

/* POST new game */
router.post('/add', addGame);

export default router;