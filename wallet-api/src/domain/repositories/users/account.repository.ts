import { Account } from '../../models';
import { IGenericRepository } from '../generic.repository';

export abstract class IAccountRepository extends IGenericRepository<Account> {}
