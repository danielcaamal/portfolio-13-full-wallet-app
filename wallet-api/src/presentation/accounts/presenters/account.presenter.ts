// Domain
import { Account, User } from 'src/domain';

// Infrastructure
import { PresenterSwagger } from 'src/infrastructure';

export class AccountPresenter {
  @PresenterSwagger({ required: true, description: 'Account id' })
  _id: string;

  @PresenterSwagger({ required: true, description: 'Account description' })
  description: string;

  @PresenterSwagger({ required: true, description: 'Account amount' })
  amount: number;

  @PresenterSwagger({ required: true, description: 'Account color' })
  color: string;

  @PresenterSwagger({ required: true, description: 'Account icon' })
  icon: string;

  @PresenterSwagger({ required: true, description: 'Account user' })
  user: string;

  constructor(account: Account) {
    this._id = account._id;
    this.description = account.description;
    this.amount = account.amount;
    this.color = account.color;
    this.icon = account.icon;
    this.user = account.user._id;
  }
}
