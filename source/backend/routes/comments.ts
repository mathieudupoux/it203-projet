import express from 'express';
import { getAllComments, getCommentsAppreciators, getMostDebatedComment } from '../models/commentModels';
const router = express.Router();

/* GET appreciators by comment id */
router.get('/:commentID/Appreciators', getCommentsAppreciators);

/* GET all comments*/
router.get('/', getAllComments);

/* GET most debated comment*/
router.get('/mostDebated', getMostDebatedComment);

export default router;
