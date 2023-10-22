// final String userId;
//   final String netIncomeId;
//   final String description;
//   final double amount;
//   final String icon;
//   final String color;
//   final bool includeInBalance;
//   final String? lastTransactionId;
//   final Transaction? lastTransaction;

import { Base } from '../base/base.model';
import { User } from '../users';

export class Account extends Base {
  static modelName = 'account';
  _id?: string;
  description: string;
  amount: number;
  icon: string;
  color: string;
  includeInBalance: boolean;
  createdAt: Date;
  updatedAt: Date;
  user: User;
  // lastTransactionId?: string;
  // netIncomeId: string;
}
