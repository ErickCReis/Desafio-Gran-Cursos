import db from '../utils/db';

class ListEventsService {
  public async execute(): Promise<Event[]> {
    const eventsDocs = await db.events.get();

    const events = eventsDocs.docs.map(doc => doc.data());
    return events;
  }
}

export default ListEventsService;
