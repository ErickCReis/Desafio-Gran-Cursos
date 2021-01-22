import { firestore } from 'firebase-admin';

import News from '../models/News';
import Event from '../models/Event';

const converter = <T>() => ({
  toFirestore: (data: Partial<T>) => data,
  fromFirestore: (snap: FirebaseFirestore.QueryDocumentSnapshot) =>
    snap.data() as T,
});

const dataPoint = <T>(collectionPath: string) =>
  firestore().collection(collectionPath).withConverter(converter<T>());

const db = {
  news: dataPoint<News>('news'),
  events: dataPoint<Event>('events'),
};

export { db };
export default db;
