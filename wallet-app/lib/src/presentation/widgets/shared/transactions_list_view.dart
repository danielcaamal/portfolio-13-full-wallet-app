import 'package:flutter/material.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/utils/utils.dart';

class TransactionsListView extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsListView({super.key, this.transactions = const []});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          // Your item builder logic here
          return TransactionListViewItem(transaction: transactions[index]);
        },
      ),
    );
  }
}

class TransactionListViewItem extends StatelessWidget {
  const TransactionListViewItem({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: ListTile(
          iconColor: Theme.of(context).colorScheme.primary,
          leading: _Leading(transaction: transaction),
          title: _Title(transaction: transaction),
          subtitle: _Subtitle(transaction: transaction),
          trailing: _Trailing(transaction: transaction)),
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading({
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 0.5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Positioned(
            top: -2,
            left: -2,
            child: Icon(
              size: 25,
              iconsEnum[transaction.category?.icon] ??
                  Icons.monetization_on_outlined,
              color: HumanFormats.hexToColor(transaction.category?.color),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Icon(
              size: 25,
              iconsEnum[transaction.account?.icon] ??
                  Icons.monetization_on_outlined,
              color: HumanFormats.hexToColor(transaction.account?.color),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Text(transaction.description);
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(HumanFormats.dateToLocal(transaction.movementDate)),
      ],
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing({
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Text(
      HumanFormats.numberToCurrency(transaction.amount),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: transaction.operationType == OperationTypeEnum.expenses
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary),
    );
  }
}
