// Framework
import { Body, Controller, Get, Post } from '@nestjs/common';

// Domain
import { Account } from 'src/domain';

// Infrastructure
import { ControllerSwagger, ServiceSwagger } from 'src/infrastructure';

// Presentation
import { AccountsService } from './accounts.service';
import { AccountPresenter } from './presenters';
import { CreateAccountDto } from './dtos';

@Controller(Account.route.toLowerCase())
@ControllerSwagger(Account.route)
export class AccountsController {
  constructor(private readonly accountsService: AccountsService) {
    //
  }

  @Get('')
  @ServiceSwagger([AccountPresenter], {
    description: 'Find all accounts',
    summary: 'Find all accounts',
  })
  async findAllAccounts(): Promise<AccountPresenter[]> {
    const accounts = await this.accountsService.findAll();
    return accounts;
  }

  @Get('by-user')
  @ServiceSwagger([AccountPresenter], {
    description: 'Find all accounts',
    summary: 'Find all accounts',
  })
  // TODO: Add get the user id from token
  async findAllAccountsByUser(): Promise<AccountPresenter[]> {
    const accounts = await this.accountsService.findAllByUser(
      'f36b2e0b-5802-413d-9548-7d8afa20e932',
    );
    return accounts;
  }

  @Post('')
  @ServiceSwagger([AccountPresenter], {
    description: 'Create account',
    summary: 'Create account',
  })
  async createAccountByUser(
    @Body() createAccountDto: CreateAccountDto,
    // TODO: @GetUser() userFromToken: User,
  ): Promise<AccountPresenter> {
    const accounts = await this.accountsService.create(createAccountDto, {
      _id: 'f36b2e0b-5802-413d-9548-7d8afa20e932',
    } as any);
    return accounts;
  }
}
