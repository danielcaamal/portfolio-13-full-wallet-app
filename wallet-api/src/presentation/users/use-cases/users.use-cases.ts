// Framework
import { Injectable } from '@nestjs/common';

// Domain
import { IDataServices, IUserRepository, User } from 'src/domain';

// Use-cases
import { IUsersUseCases } from 'src/use-cases';

@Injectable()
export class UsersUseCases implements IUsersUseCases {
  constructor(private readonly userRepository: IUserRepository) {}

  async findAll(): Promise<User[]> {
    return await this.userRepository.findAll();
  }
}
