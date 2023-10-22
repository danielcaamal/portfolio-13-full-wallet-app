// Domain
import { Account } from 'src/domain';

export abstract class IAccountUseCases {
  public abstract findAll(): Promise<Account[]>;
}
