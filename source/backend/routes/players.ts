import express from 'express';
import { addNewPlayer,getPlayerById, getAllPlayers,getPlayerCommentsOnPreferedGames, getPlayerGamesByPreferences, removePlayer, updatePlayer } from '../models/playerModels';
const router = express.Router();

router.get('/', getAllPlayers);

/* GET player by id. */
router.get('/:id', getPlayerById);

// create new player
router.post('/new', addNewPlayer);

router.get('/games/:id/preferedOnly', getPlayerGamesByPreferences);

router.get('/comments/:id/preferedOnly', getPlayerCommentsOnPreferedGames);

router.get('/remove/:id', removePlayer);

// Example of url 
// http://localhost:3000/players/update?id=new_id&pseudo=new_pseudo&mail=new_mail
router.post('/update', updatePlayer);

export default router;
