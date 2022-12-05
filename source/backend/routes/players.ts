import express from 'express';
import { addNewPlayer,getPlayerById, getAllPlayers,getPlayerCommentsOnPreferedGames, getPlayerGamesByPreferences, removePlayer } from '../models/playerModels';
const router = express.Router();

router.get('/', getAllPlayers);

/* GET player by id. */
router.get('/:id', getPlayerById);

// create new player
router.post('/new', addNewPlayer);

router.get('/games/:id/preferedOnly', getPlayerGamesByPreferences);

router.get('/comments/:id/preferedOnly', getPlayerCommentsOnPreferedGames);

router.get('/remove/:id', removePlayer);
export default router;
