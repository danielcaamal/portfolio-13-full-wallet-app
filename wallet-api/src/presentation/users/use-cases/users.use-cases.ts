// Framework
import { Injectable } from '@nestjs/common';

// Domain
import { IUserRepository, User } from 'src/domain';

// Use-cases
import { IUsersUseCases } from 'src/use-cases';

@Injectable()
export class UsersUseCases implements IUsersUseCases {
  constructor(private readonly userRepository: IUserRepository) {}
  async create(user: User): Promise<User> {
    return await this.userRepository.create(user);
  }

  async findAll(): Promise<User[]> {
    return await this.userRepository.findAll();
  }

  async findByEmail(email: string): Promise<User> {
    return await this.userRepository.findByEmail(email);
  }
}
