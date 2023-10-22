// Framework
import { ConflictException, Injectable } from '@nestjs/common';

// Use-cases
import { AuthUseCases, UsersUseCases } from './use-cases';

// Presentation
import { UserPresenter } from './presenters';
import { CreateUserDto } from './dtos';

@Injectable()
export class UsersService {
  constructor(
    private readonly usersUseCases: UsersUseCases,
    private readonly authUseCases: AuthUseCases,
  ) {}

  findAll = async (): Promise<UserPresenter[]> => {
    return (await this.usersUseCases.findAll()).map(
      (user) => new UserPresenter(user),
    );
  };

  create = async (createUser: CreateUserDto): Promise<UserPresenter> => {
    const userExists = await this.usersUseCases.findByEmail(createUser.email);
    if (userExists) {
      throw new ConflictException('User already exists');
    }
    const hashedPassword = await this.authUseCases.hashPassword(
      createUser.password,
    );
    delete createUser.password;
    const newUser = CreateUserDto.createUserDtoToUser(createUser);
    newUser.password = hashedPassword;
    return new UserPresenter(await this.usersUseCases.create(newUser));
  };
}
