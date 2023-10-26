import 'package:flutter/material.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home';
  static const route = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppLayout(
        appBar: const CustomSilverAppBar(),
        child: _HomeContent(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  _HomeContent({
    super.key,
  });

  final totalBalance = MockValues.getTotalBalance();
  final upcomingPayments = MockValues.getMockTransactions();
  final lastPayments = MockValues.getMockTransactions();
  final lastMovements = MockValues.getLastTransfers();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TotalBalanceCardItem(),
        const CardItem(
          title: 'Portfolio',
          child: PortfolioCharts(),
        ),
        CardItem(
            title: 'Upcoming Payments',
            child: TransactionsListView(
              transactions: upcomingPayments,
            )),
        CardItem(
            title: 'Last Payments',
            child: TransactionsListView(
              transactions: lastPayments,
            )),
        CardItem(
            title: 'Last Movements',
            child: TransfersSlideShow(
              transfers: lastMovements,
            )),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
