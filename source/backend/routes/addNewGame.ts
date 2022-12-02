import express from 'express';
import { addGame } from '../models/gameModels';
const router = express.Router();

/* Add new game */
router.get('games/add/', addGame);

export default router;