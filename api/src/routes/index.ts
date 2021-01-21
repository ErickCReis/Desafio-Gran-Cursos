import { Router } from 'express';

import ensureAuthenticated from '../middlewares/ensureAuthenticated';
import eventsRouter from './events.routes';
import newsRouter from './news.routes';

const routes = Router();

routes.use('/news', newsRouter);

routes.use('/events', ensureAuthenticated, eventsRouter);

export default routes;
