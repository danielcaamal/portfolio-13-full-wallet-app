import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppLayout extends ConsumerStatefulWidget {
  const CustomAppLayout({
    super.key,
    required this.child,
    this.appBar,
    this.title = '',
  });

  final Widget child;
  final Widget? appBar;
  final String title;

  @override
  _CustomAppLayoutState createState() => _CustomAppLayoutState();
}

class _CustomAppLayoutState extends ConsumerState<CustomAppLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      widget.appBar ??
          SliverAppBar(
            title: Text(widget.title),
          ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return widget.child;
        },
        childCount: 1,
      )),
    ]);
  }
}
