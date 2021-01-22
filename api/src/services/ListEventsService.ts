import { firestore } from 'firebase-admin';
import db from '../utils/db';

import Event from '../models/Event';

class ListEventsService {
  public async execute(): Promise<Event[]> {
    const eventsDocs = await db.events.get();

    const events = eventsDocs.docs.map(doc => {
      return {
        ...doc.data(),
        date: (doc.data().date as firestore.Timestamp).toDate(),
      };
    });
    return events;
  }
}

export default ListEventsService;
