import express from 'express';
import { getAllComments, getCommentsAppreciators, getMainGameFromComment, getMostDebatedComment, getMostRecentComments } from '../models/commentModels';
const router = express.Router();

/* GET appreciators by comment id */
router.get('/:commentID/Appreciators', getCommentsAppreciators);

/* GET all comments*/
router.get('/', getAllComments);

/* GET most recent comments*/
router.get('/all/:count', getMostRecentComments);

/* GET most debated comment*/
router.get('/mostDebated', getMostDebatedComment);

/* GET Main Game from a given comment*/
router.get('/:commentID/game', getMainGameFromComment)
export default router;
