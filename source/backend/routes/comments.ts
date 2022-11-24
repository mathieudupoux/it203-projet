import express from 'express';
import { getCommentsAppreciators } from '../models/commentModels';
const router = express.Router();

/* GET theme names */
router.get('/:commentID/Appreciators', getCommentsAppreciators);

export default router;
