import 'package:go_router/go_router.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
      path: HomeScreen.route,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: AccountsScreen.route,
            name: AccountsScreen.name,
            builder: (context, state) => const AccountsScreen(),
            routes: [
              GoRoute(
                path: '${AccountScreen.route}/:id',
                name: AccountScreen.name,
                builder: (context, state) => AccountScreen(
                  id: state.pathParameters['id'] ?? '',
                ),
              ),
            ]),
      ]),
]);
