import 'package:wallet_app/src/domain/domain.dart';

class MockValues {
  static double getTotalBalance() {
    return 15000;
  }

  static Account GetMockAccountDetailById(String id) {
    return Account(
      id: '0001',
      color: '#FFFFFF',
      description: 'Account 1',
      isActive: true,
      createdAt: DateTime.now(),
      icon: 'account_balance',
      updatedAt: DateTime.now(),
      userId: '0001',
      lastTransactionId: '0001',
      lastTransaction: getMockTransactions().first,
      amount: 10000.0,
      netIncomeId: '0001',
      includeInBalance: true,
    );
  }

  static List<Account> getMockAccounts() {
    return [
      Account(
        id: '0001',
        color: '#FFFFFF',
        description: 'Account 1',
        isActive: true,
        createdAt: DateTime.now(),
        icon: 'account_balance',
        updatedAt: DateTime.now(),
        userId: '0001',
        lastTransactionId: '0001',
        amount: 10000.0,
        netIncomeId: '0001',
        includeInBalance: true,
      ),
      Account(
        id: '0001',
        color: '#FFFFFF',
        description: 'Account 2',
        isActive: true,
        createdAt: DateTime.now(),
        icon: 'account_balance_2',
        updatedAt: DateTime.now(),
        userId: '0001',
        lastTransactionId: '0001',
        amount: -10000.0,
        netIncomeId: '0001',
        includeInBalance: true,
      )
    ];
  }

  static List<Transaction> getMockTransactions() {
    return [
      Transaction(
          id: '00001',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isActive: true,
          userId: '00001',
          netIncomeId: '0001',
          accountId: '0001',
          account: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 1',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            netIncomeId: '0001',
            includeInBalance: true,
          ),
          categoryId: '0001',
          category: Category(
            color: '#FFFFFF',
            description: 'Category 1',
            id: '0001',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance_wallet',
            updatedAt: DateTime.now(),
            userId: '0001',
            netIncomeId: '0001',
            operationType: OperationTypeEnum.expenses,
            plannedExpensePerMonth: 10000.0,
            lastMovementId: '0001',
          ),
          description: 'Movement 1',
          operationType: OperationTypeEnum.expenses,
          amount: -10000.0,
          movementDate: DateTime.now(),
          totalMovements: 1,
          movementNumber: 1),
      Transaction(
          id: '00001',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isActive: true,
          userId: '00001',
          netIncomeId: '0001',
          accountId: '0001',
          account: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 2',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance_2',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            netIncomeId: '0001',
            includeInBalance: true,
          ),
          categoryId: '0001',
          category: Category(
            color: '#FFFFFF',
            description: 'Category 2',
            id: '0001',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance_wallet_2',
            updatedAt: DateTime.now(),
            userId: '0001',
            netIncomeId: '0001',
            operationType: OperationTypeEnum.expenses,
            plannedExpensePerMonth: 10000.0,
            lastMovementId: '0001',
          ),
          description: 'Movement 2',
          operationType: OperationTypeEnum.incomes,
          amount: 10000.0,
          movementDate: DateTime.now(),
          movementNumber: 1,
          totalMovements: 1),
    ];
  }

  static List<Transfer> getLastTransfers() {
    return [
      Transfer(
          id: "00001",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isActive: true,
          userId: "001",
          netIncomeId: "0001",
          accountDestinationId: "0001",
          accountSource: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 1',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            netIncomeId: '0001',
            includeInBalance: true,
          ),
          accountDestination: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 2',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance_2',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            includeInBalance: true,
            netIncomeId: '0001',
          ),
          accountSourceId: "0001",
          description: "Transfer 1",
          amount: 10000,
          movementDate: DateTime.now()),
      Transfer(
          id: "00001",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isActive: true,
          userId: "001",
          netIncomeId: "0001",
          accountDestinationId: "0001",
          accountDestination: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 1',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            netIncomeId: '0001',
            includeInBalance: true,
          ),
          accountSource: Account(
            id: '0001',
            color: '#FFFFFF',
            description: 'Account 2',
            isActive: true,
            createdAt: DateTime.now(),
            icon: 'account_balance_2',
            updatedAt: DateTime.now(),
            userId: '0001',
            lastTransactionId: '0001',
            amount: 10000.0,
            netIncomeId: '0001',
            includeInBalance: true,
          ),
          accountSourceId: "0001",
          description: "Transfer 2",
          amount: 10000,
          movementDate: DateTime.now())
    ];
  }
}
