// Framework
import { ConflictException, Injectable } from '@nestjs/common';

// Domain
import { IUserRepository, User } from 'src/domain';

// Use-cases
import { IUsersUseCases } from 'src/use-cases';
import { AuthUseCases } from './auth.use-cases';

@Injectable()
export class UsersUseCases implements IUsersUseCases {
  constructor(
    private readonly userRepository: IUserRepository,
    private readonly authUseCases: AuthUseCases,
  ) {}
  async create(user: User): Promise<User> {
    const userExists = await this.findByEmail(user.email);
    if (userExists) {
      throw new ConflictException('User already exists');
    }
    const hashedPassword = await this.authUseCases.hashPassword(user.password);
    user.password = hashedPassword;
    return await this.userRepository.create(user);
  }

  async findAll(): Promise<User[]> {
    return await this.userRepository.findAll();
  }

  async findByEmail(email: string): Promise<User> {
    return await this.userRepository.findByEmail(email);
  }
}
