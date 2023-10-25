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

  @PresenterSwagger({ required: true, description: 'Account color' })
  color: string;

  @PresenterSwagger({ required: true, description: 'Account icon' })
  icon: string;

  @PresenterSwagger({ required: true, description: 'Account user' })
  user: string;

  @PresenterSwagger({ required: true, description: 'Account is active' })
  isActive: boolean;

  @PresenterSwagger({ required: true, description: 'Account created at' })
  createdAt: Date;

  @PresenterSwagger({ required: true, description: 'Account updated at' })
  updatedAt: Date;

  @PresenterSwagger({
    required: true,
    description: 'Account include in balance',
  })
  includeInBalance: boolean;

  constructor(account: Account) {
    this._id = account._id;
    this.description = account.description;
    this.amount = account.amount;
    this.color = account.color;
    this.icon = account.icon;
    this.user = account.user._id;
    this.isActive = account.isActive;
    this.createdAt = account.createdAt;
    this.updatedAt = account.updatedAt;
    this.includeInBalance = account.includeInBalance;
  }
}
