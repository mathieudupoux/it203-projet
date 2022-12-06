import express from 'express';
import { updateComment, addCommentOnConfig, getAllComments, getCommentsAppreciators, getMainGameFromComment, getMostDebatedComment, getMostRecentComments, getMostReliableComments, removeComment, getCommentFromPlayerPreferences } from '../models/commentModels';
const router = express.Router();

/* GET appreciators by comment id */
router.get('/:commentID/Appreciators', getCommentsAppreciators);

/* GET all comments*/
router.get('/', getAllComments);

/* GET most recent comments*/
router.get('/all/mostRecent/:count', getMostRecentComments);

/* GET most recent comments*/
router.get('/all/mostReliable', getMostReliableComments);

/* GET most debated comment*/
router.get('/mostDebated', getMostDebatedComment);

/* GET Main Game from a given comment*/
router.get('/:commentID/game', getMainGameFromComment)

/* GET Comments from player preferences */
router.get('/player/OnlyPrefered/:numero_joueur', getCommentFromPlayerPreferences);

/* GET removeComment */
router.get('/remove/:id', removeComment);

/* GET removeComment */
// example of url
// http://localhost:3000/comments/update?date_avis=2020-01-01&note=18&commentaire=Test&numero_configuration=3&numero_personne=3&numero_avis=1
router.post('/update', updateComment);


export default router;
