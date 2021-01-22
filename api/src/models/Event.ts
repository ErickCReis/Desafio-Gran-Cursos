import { firestore } from 'firebase-admin';

class Event {
  id: number;

  title: string;

  local: string;

  date: Date | firestore.Timestamp;

  image_url: string;
}

export default Event;
