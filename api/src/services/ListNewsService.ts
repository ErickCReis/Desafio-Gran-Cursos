import db from '../utils/db';

import News from '../models/News';

class ListNewsService {
  public async execute(): Promise<News[]> {
    const newsDocs = await db.news.get();

    const news = newsDocs.docs.map(doc => doc.data());
    return news;
  }
}

export default ListNewsService;
