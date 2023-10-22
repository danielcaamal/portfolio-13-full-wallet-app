// Domain
import { Account } from 'src/domain';

// Infrastructure
import { PresenterSwagger } from 'src/infrastructure';

export class AccountPresenter {
  @PresenterSwagger({ required: true, description: 'Account id' })
  _id: string;

  @PresenterSwagger({ required: true, description: 'Account description' })
  description: string;

  @PresenterSwagger({ required: true, description: 'Account amount' })
  amount: number;

  constructor(account: Account) {
    this._id = account._id;
    this.description = account.description;
    this.amount = account.amount;
  }
}
