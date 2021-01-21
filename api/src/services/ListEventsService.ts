import User from '../models/User';

class ListEventsService {
  public async execute(): Promise<User> {
    const user = new User();
    return user;
  }
}

export default ListEventsService;
