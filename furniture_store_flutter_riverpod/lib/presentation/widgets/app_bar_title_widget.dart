import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarTitleWidget extends ConsumerWidget {
  const AppBarTitleWidget({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
              flex: 3,
              child: Placeholder()),
          Expanded(
              flex: 2,
              child: Center(child: Text(_title,))
          ),
        ],
      ),
    );
  }
}