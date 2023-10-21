import 'package:flutter/material.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/presentation.dart';
import 'package:wallet_app/src/presentation/utils/utils.dart';
import 'package:go_router/go_router.dart';

class AccountsListView extends StatelessWidget {
  final List<Account> accounts;

  AccountsListView({super.key, this.accounts = const []});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: accounts.length,
        itemBuilder: (BuildContext context, int index) {
          // Your item builder logic here
          return Card(
            color: Theme.of(context).colorScheme.surface,
            child: ListTile(
                onTap: () {
                  context.push('/${AccountsScreen.route}/${AccountScreen.route}/${accounts[index].id}');
                },
                iconColor: Theme.of(context).colorScheme.primary,
                leading: _Leading(account: accounts[index]),
                title: _Title(account: accounts[index]),
                subtitle: _Subtitle(account: accounts[index]),
                trailing: _Trailing(account: accounts[index])),
          );
        },
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading({
    required this.account,
  });
  final Account account;

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
        child: Icon(
          size: 25,
          iconsEnum[account.icon] ?? Icons.monetization_on_outlined,
          color: HumanFormats.hexToColor(account.color),
        ));
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Text(account.description);
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(HumanFormats.dateToLocal(account.updatedAt)),
      ],
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing({
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Text(
      HumanFormats.numberToCurrency(account.amount),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: account.amount >= 0
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.error),
    );
  }
}
