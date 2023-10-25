import { Account } from '../../models';
import { IGenericRepository } from '../generic.repository';

export abstract class IAccountRepository extends IGenericRepository<Account> {
  abstract findAllByUser(user: string): Promise<Account[]>;
  abstract getTotalBalanceByUser(user: string): Promise<number>;
}
