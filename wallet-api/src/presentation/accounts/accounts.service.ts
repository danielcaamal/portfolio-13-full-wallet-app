// Framework
import { Injectable } from '@nestjs/common';

// Use-cases
import { AccountsUseCases } from './use-cases/accounts.use-cases';

// Presentation
import { AccountPresenter } from './presenters';

@Injectable()
export class AccountsService {
  constructor(private readonly accountsUseCases: AccountsUseCases) {}

  findAll = async (): Promise<AccountPresenter[]> => {
    return (await this.accountsUseCases.findAll()).map(
      (Account) => new AccountPresenter(Account),
    );
  };
}
