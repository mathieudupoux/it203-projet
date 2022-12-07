import express from 'express';
import { updateGame, getAllGames, getGamesByTheme, getThemeNames, addGame, getConfigFromMainGame, getConfigFromID, removeGame, getGames, getMechanicNames, linkGameMecanisme, linkGameTheme, AddConfig, AddExtension, LinkExtension, GetConfigByGameName} from '../models/gameModels';
const router = express.Router();

/* GET all games with mecanics and themes*/
router.get('/list/', getAllGames);

/* GET all games*/
router.get('/', getGames);

/* GET theme names */
router.get('/themeNames', getThemeNames);

/* GET mechanic names */
router.get('/mechanicNames', getMechanicNames);

/* GET games filtered by mechanics */
router.get('/list/:numero_theme', getGamesByTheme);

/* POST new game */
router.post('/add', addGame);

/* POST link between a game and a theme */
router.post('/link/GameTheme', linkGameTheme);

/* POST link between a game and a Mecanisme */
router.post('/link/GameMecanisme', linkGameMecanisme);

/* Get Configurations from a main game */
router.get('/config/FromID/:numero_configuration', getConfigFromID);

/* Get Configurations from a main game */
router.get('/config/byMainGame/:numero_jeu', getConfigFromMainGame);

/* Delete games from id */
router.get('/remove/:id', removeGame);

/* Update gamesfrom */
router.post('/update', updateGame);

router.post('/AddConfig', AddConfig);

router.post('/extensions/add', AddExtension);

router.post('/extensions/link', LinkExtension);

router.get('/configByGameName', GetConfigByGameName);

export default router;