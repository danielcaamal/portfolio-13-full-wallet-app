// Framework
import { ConflictException, Injectable } from '@nestjs/common';

// Use-cases
import { AuthUseCases, UsersUseCases } from './use-cases';

// Presentation
import { UserPresenter } from './presenters';
import { CreateUserDto } from './dtos';

@Injectable()
export class UsersService {
  constructor(private readonly usersUseCases: UsersUseCases) {}

  findAll = async (): Promise<UserPresenter[]> => {
    return (await this.usersUseCases.findAll()).map(
      (user) => new UserPresenter(user),
    );
  };

  create = async (createUser: CreateUserDto): Promise<UserPresenter> => {
    return new UserPresenter(
      await this.usersUseCases.create(
        CreateUserDto.createUserDtoToUser(createUser),
      ),
    );
  };
}
