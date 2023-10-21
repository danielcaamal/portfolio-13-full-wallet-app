import 'package:flutter/material.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/presentation.dart';
import 'package:wallet_app/src/presentation/utils/utils.dart';

class AccountsScreen extends StatelessWidget {
  static const name = 'accounts';
  static const route = 'accounts';
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAppLayout(
        title: 'Accounts',
        child: _AccountsContent(),
      ),
      drawer: CustomDrawer(),
    );
  }
}

class _AccountsContent extends StatelessWidget {
  const _AccountsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Account> accounts = MockValues.getMockAccounts();

    return Column(
      children: [
        const TotalBalanceCardItem(total: 15000),
        CardItem(
          child: AccountsListView(
            accounts: accounts,
          ),
        )
      ],
    );
  }
}
