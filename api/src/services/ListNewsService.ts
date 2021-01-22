import News from '../models/News';
import db from '../utils/db';

class ListNewsService {
  public async execute(): Promise<News[]> {
    const newsDocs = await db.news.get();

    const news = newsDocs.docs.map(doc => doc.data());
    return news;
  }
}

export default ListNewsService;
