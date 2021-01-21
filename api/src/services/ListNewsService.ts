import User from '../models/User';

class ListNewsService {
  public async execute(): Promise<User> {
    const user = new User();
    return user;
  }
}

export default ListNewsService;
