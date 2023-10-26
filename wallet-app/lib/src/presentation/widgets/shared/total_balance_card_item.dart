import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

class TotalBalanceCardItem extends ConsumerStatefulWidget {
  const TotalBalanceCardItem({super.key});

  @override
  ConsumerState<TotalBalanceCardItem> createState() =>
      _TotalBalanceCardItemState();
}

class _TotalBalanceCardItemState extends ConsumerState<TotalBalanceCardItem> {
  @override
  void initState() {
    super.initState();
    ref.read(accountTotalBalanceProvider.notifier).loadTotalBalance();
  }

  @override
  Widget build(BuildContext context) {
    final totalBalance = ref.watch(accountTotalBalanceProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: ListTile(
          leading: const Icon(Icons.account_balance_wallet_sharp),
          title: const Text('Total Balance'),
          subtitle: Text(HumanFormats.numberToCurrency(totalBalance),
              style: TextStyle(
                color: totalBalance >= 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.error,
              )),
        ),
      ),
    );
  }
}
