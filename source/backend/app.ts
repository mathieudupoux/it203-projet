
import express from 'express';
import path from 'path';
import bodyParser from 'body-parser';
import cors from 'cors';
import logger from 'morgan';
import { init } from "./utils/mariadb.connector";

import indexRouter from './routes/index';
import playersRouter from './routes/players';
import commentsRouter from './routes/comments';
import adminRouter from './routes/admin';
import gamesRouter from './routes/games';
import usersRouter from './routes/users';


// init express
const app = express();

// Express configuration
app.use(logger('dev'));
app.use(express.json());
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }))
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
init();

// Router setup

app.use('/', indexRouter);
app.use('/players', playersRouter);
app.use('/comments', commentsRouter);
app.use('/admin', adminRouter);
app.use('/games', gamesRouter)
app.use('/users', usersRouter)


app.listen(3000, () => console.log('Server running at http://localhost:3000'));