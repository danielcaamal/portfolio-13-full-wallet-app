// Framework
import { Controller, Get } from '@nestjs/common';

// Domain
import { Account } from 'src/domain';

// Infrastructure
import { ControllerSwagger, ServiceSwagger } from 'src/infrastructure';

// Presentation
import { AccountsService } from './accounts.service';
import { AccountPresenter } from './presenters';

@Controller(Account.name.toLowerCase())
@ControllerSwagger(Account.name)
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
    const Accounts = await this.accountsService.findAll();
    return Accounts;
  }
}
