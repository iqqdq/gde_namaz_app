import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurOverlay extends StatelessWidget {
  final Widget child;
  final Widget overlay;

  const BlurOverlay({
    super.key,
    required this.child,
    required this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Blur(
        blur: 10.0,
        colorOpacity: 0.05,
        blurColor: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(16.0),
        overlay: overlay,
        child: child,
      ),
    );
  }
}
