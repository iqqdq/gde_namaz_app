import 'package:flutter/material.dart';

class ScaleGestureDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const ScaleGestureDetector({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<ScaleGestureDetector> createState() => _ScaleGestureDetectorState();
}

class _ScaleGestureDetectorState extends State<ScaleGestureDetector>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _scaleValue = 1.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 1.0,
      lowerBound: 0.9,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 100),
    );

    _animationController.addListener(
        () => setState(() => _scaleValue = _animationController.value));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        _animationController
            .reverse()
            .whenComplete(() => _animationController.forward(from: 0.0)),
        widget.onTap(),
      },
      child: Transform.scale(
        scale: _scaleValue,
        child: widget.child,
      ),
    );
  }
}
