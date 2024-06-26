// Framework
import {
  Body,
  Controller,
  Get,
  Param,
  ParseUUIDPipe,
  Post,
} from '@nestjs/common';

// Domain
import { Account, User } from 'src/domain';

// Infrastructure
import { ControllerSwagger, ServiceSwagger } from 'src/infrastructure';

// Presentation
import { AccountsService } from './accounts.service';
import { AccountPresenter, AccountTotalBalancePresenter } from './presenters';
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
      'b364f159-6f35-438d-8fec-6d70ab3500fd',
    );
    return accounts;
  }

  @Get('by-user/:id')
  @ServiceSwagger([AccountPresenter], {
    description: 'Find one account',
    summary: 'Find one account',
  })
  // TODO: Add get the user id from token
  async findOneAccount(
    @Param('id', ParseUUIDPipe) id: string,
  ): Promise<AccountPresenter> {
    const accounts = await this.accountsService.findOneByUser(
      id,
      'b364f159-6f35-438d-8fec-6d70ab3500fd',
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
      _id: 'b364f159-6f35-438d-8fec-6d70ab3500fd',
    } as User);
    return accounts;
  }

  @Get('total-balance/by-user')
  @ServiceSwagger([AccountPresenter], {
    description: 'Get total balance by user',
    summary: 'Get total balance by user',
  })
  // TODO: @GetUser() userFromToken: User,
  async getTotalBalanceByUser(): Promise<AccountTotalBalancePresenter> {
    const totalBalance = await this.accountsService.getTotalBalanceByUser({
      _id: 'b364f159-6f35-438d-8fec-6d70ab3500fd',
    } as User);
    return totalBalance;
  }
}
