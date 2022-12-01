import express from 'express';
import { getAllUsers,addNewUser,getUserById, removeUser} from '../models/userModels';
const router = express.Router();

// GET all user in the database
router.get('/', getAllUsers);

// POST (create) new user
router.post('/new/', addNewUser);

// GET player by id
router.get('/get/:id', getUserById);

export default router;
