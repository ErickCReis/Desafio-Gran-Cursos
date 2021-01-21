import { Router } from 'express';

import ListNewsService from '../services/ListNewsService';

const newsRouter = Router();

newsRouter.get('/', async (request, response) => {
  const listNews = new ListNewsService();

  const news = await listNews.execute();

  return response.json(news);
});

export default newsRouter;
