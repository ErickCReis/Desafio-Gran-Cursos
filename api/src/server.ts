import 'reflect-metadata';
import 'express-async-errors';
import 'dotenv/config';

import express from 'express';
import cors from 'cors';

import './config/firebase';

import routes from './routes';
import ErrorHandler from './errors/ErrorHandler';

const app = express();
const port = process.env.PORT || 3333;

app.use(cors());
app.use(express.json());
app.use(routes);

app.use(ErrorHandler);

app.listen(port, () => {
  console.log(`🚀 Server started on port ${port}`);
});
