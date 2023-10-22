// Framework
import { Body, Controller, Get, Post } from '@nestjs/common';

// Domain
import { User } from 'src/domain';

// Infrastructure
import { ControllerSwagger, ServiceSwagger } from 'src/infrastructure';

// Presentation
import { UsersService } from './users.service';
import { UserPresenter } from './presenters';
import { CreateUserDto } from './dtos';

@Controller(User.route.toLowerCase())
@ControllerSwagger(User.route)
export class UsersController {
  constructor(private readonly usersService: UsersService) {
    //
  }

  @Get('')
  @ServiceSwagger([UserPresenter], {
    description: 'Find all users',
    summary: 'Find all users',
  })
  async findAllUsers(): Promise<UserPresenter[]> {
    const users = await this.usersService.findAll();
    return users;
  }

  @Post('')
  @ServiceSwagger([UserPresenter], {
    description: 'Create a new user',
    summary: 'Create a new user',
  })
  async createUser(@Body() createUser: CreateUserDto): Promise<UserPresenter> {
    const user = await this.usersService.create(createUser);
    return user;
  }
}
