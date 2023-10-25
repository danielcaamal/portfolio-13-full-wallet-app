// Domain
import { Account } from 'src/domain';

// Infrastructure
import { PresenterSwagger } from 'src/infrastructure';

export class AccountTotalBalancePresenter {
  @PresenterSwagger({ required: true, description: 'Account total balance' })
  total: string;

  constructor(total: number) {
    this.total = total.toString();
  }
}
