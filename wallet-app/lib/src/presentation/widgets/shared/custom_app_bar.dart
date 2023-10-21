import 'package:flutter/material.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        titlePadding: EdgeInsets.only(
          left: 10,
          top: 10,
        ),
        centerTitle: false,
        title: CustomAppBar(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Text('Wallet App',
                      style: titleStyle?.copyWith(
                        color: colors.primary,
                      )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.account_circle))
                ],
              ),
            )));
  }
}
