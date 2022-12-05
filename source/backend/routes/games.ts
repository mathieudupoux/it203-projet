import express from 'express';
import { getAllGames, getGamesByMechanics, getThemeNames, addGame, getConfigFromMainGame, removeGame, getGames } from '../models/gameModels';
const router = express.Router();

/* GET all games with mecanics and themes*/
router.get('/list/', getAllGames);

/* GET all games*/
router.get('/', getGames);

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET games filtered by mechanics */
router.get('/list/:mechanic', getGamesByMechanics);

/* POST new game */
router.post('/add', addGame);

/* Get Configurations from a main game */
router.get('/config/:numero_jeu', getConfigFromMainGame);

/* Delete games from id */
router.get('/remove/:id', removeGame);

export default router;