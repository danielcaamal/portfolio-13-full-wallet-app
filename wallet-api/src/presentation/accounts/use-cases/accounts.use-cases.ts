// Framework
import { Injectable, InternalServerErrorException } from '@nestjs/common';

// Domain
import { IAccountRepository, Account, User } from 'src/domain';

// Use-cases
import { IAccountUseCases } from 'src/use-cases';

@Injectable()
export class AccountsUseCases implements IAccountUseCases {
  constructor(private readonly accountRepository: IAccountRepository) {}

  async findAll(): Promise<Account[]> {
    return await this.accountRepository.findAll();
  }

  async findAllByUser(user: string): Promise<Account[]> {
    return await this.accountRepository.findAllByUser(user);
  }

  async createFromUser(account: Account, user: User): Promise<Account> {
    if (!user) {
      throw new InternalServerErrorException('createFromUser - User not found');
    }
    account.user = user;
    return await this.accountRepository.create(account);
  }
}
