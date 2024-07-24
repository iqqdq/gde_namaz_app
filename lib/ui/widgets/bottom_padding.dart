import 'package:flutter/material.dart';

class BottomPadding extends StatelessWidget {
  final Widget child;

  const BottomPadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding:
          EdgeInsets.only(bottom: bottomPadding == 0.0 ? 16.0 : bottomPadding),
      child: child,
    );
  }
}
