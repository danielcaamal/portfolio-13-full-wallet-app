// Framework
import { Injectable } from '@nestjs/common';

// Domain
import { IAccountRepository, Account } from 'src/domain';

// Use-cases
import { IAccountUseCases } from 'src/use-cases';

@Injectable()
export class AccountsUseCases implements IAccountUseCases {
  constructor(private readonly accountRepository: IAccountRepository) {}

  async findAll(): Promise<Account[]> {
    return await this.accountRepository.findAll();
  }
}
