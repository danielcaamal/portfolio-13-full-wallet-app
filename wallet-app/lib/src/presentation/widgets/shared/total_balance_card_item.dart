import 'package:flutter/material.dart';
import 'package:wallet_app/src/presentation/utils/human_formats.dart';

class TotalBalanceCardItem extends StatelessWidget {
  final double total;
  const TotalBalanceCardItem({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: ListTile(
          leading: const Icon(Icons.account_balance_wallet_sharp),
          title: const Text('Total Balance'),
          subtitle: Text(HumanFormats.numberToCurrency(total)),
        ),
      ),
    );
  }
}
