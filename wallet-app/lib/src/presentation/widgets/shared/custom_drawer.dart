import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Text(
              'Wallet App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
              ),
            ),
          ),
          const _DrawerListItem(
              title: 'Home', icon: Icons.home, route: HomeScreen.route),
          const _DrawerListItem(
              title: 'Accounts',
              icon: Icons.account_balance_wallet_sharp,
              route: AccountsScreen.route),
          const _DrawerListItem(
              title: 'Categories',
              icon: Icons.category_outlined,
              route: HomeScreen.route),
          const _DrawerListItem(
              title: 'Movements',
              icon: Icons.list_alt_outlined,
              route: HomeScreen.route),
          const _DrawerListItem(
              title: 'Profiler',
              icon: Icons.monitor_heart_outlined,
              route: HomeScreen.route),
          const _DrawerListItem(
              title: 'Reminders',
              icon: Icons.alarm_sharp,
              route: HomeScreen.route),
          const _DrawerListItem(
              title: 'Scheduled payments',
              icon: Icons.schedule_outlined,
              route: HomeScreen.route),
        ],
      ),
    );
  }
}

class _DrawerListItem extends StatelessWidget {
  const _DrawerListItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (route == HomeScreen.route) {
          Navigator.of(context).pop();
        }
        context.pushReplacement('/$route');
      },
    );
  }
}
