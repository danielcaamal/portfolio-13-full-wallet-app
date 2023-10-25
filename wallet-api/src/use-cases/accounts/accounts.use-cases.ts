// Domain
import { Account, User } from 'src/domain';

export abstract class IAccountUseCases {
  abstract findAll(): Promise<Account[]>;
  abstract findAllByUser(user: string): Promise<Account[]>;
  abstract createFromUser(account: Account, user: User): Promise<Account>;
  abstract getTotalBalanceByUser(user: User): Promise<number>;
}
