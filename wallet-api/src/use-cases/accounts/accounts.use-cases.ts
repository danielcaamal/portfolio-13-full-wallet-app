// Domain
import { Account } from 'src/domain';

export abstract class IAccountUseCases {
  abstract findAll(): Promise<Account[]>;
}
