// Framework
import { Injectable } from '@nestjs/common';

// Use-cases
import { AccountsUseCases } from './use-cases';

// Presentation
import { AccountPresenter } from './presenters';
import { CreateAccountDto } from './dtos';
import { User } from 'src/domain';

@Injectable()
export class AccountsService {
  constructor(private readonly accountsUseCases: AccountsUseCases) {}

  findAll = async (): Promise<AccountPresenter[]> => {
    return (await this.accountsUseCases.findAll()).map(
      (account) => new AccountPresenter(account),
    );
  };

  findAllByUser = async (user: string): Promise<AccountPresenter[]> => {
    return (await this.accountsUseCases.findAllByUser(user)).map(
      (account) => new AccountPresenter(account),
    );
  };

  create = async (
    account: CreateAccountDto,
    userFromToken?: User,
  ): Promise<AccountPresenter> => {
    return new AccountPresenter(
      await this.accountsUseCases.createFromUser(
        CreateAccountDto.createAccountDtoToAccount(account),
        userFromToken,
      ),
    );
  };
}
