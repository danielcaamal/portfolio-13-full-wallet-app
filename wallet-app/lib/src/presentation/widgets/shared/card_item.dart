import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? color;
  const CardItem({super.key, required this.child, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(5),
        color: color ?? Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
        elevation: 30,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null
                  ? Text(
                      title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
              const SizedBox(
                height: 10,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
