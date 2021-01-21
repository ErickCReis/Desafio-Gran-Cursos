import { Router } from 'express';
import ListEventsService from '../services/ListEventsService';

const eventsRouter = Router();

eventsRouter.get('/', async (request, response) => {
  const listEvents = new ListEventsService();

  const events = await listEvents.execute();

  return response.json(events);
});

export default eventsRouter;
