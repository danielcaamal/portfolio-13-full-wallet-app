import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _AccountsContent extends ConsumerStatefulWidget {
  const _AccountsContent({super.key});

  @override
  ConsumerState<_AccountsContent> createState() => _AccountsContentState();
}

class _AccountsContentState extends ConsumerState<_AccountsContent> {
  @override
  void initState() {
    super.initState();
    ref.read(accountsProvider.notifier).loadAccounts();
  }

  @override
  Widget build(BuildContext context) {
    final accounts = ref.watch(accountsProvider);

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
