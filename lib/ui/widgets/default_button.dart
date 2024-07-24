import 'package:flutter/material.dart';
import 'package:gde_namaz/ui/ui.dart';

class DefaultButton extends StatelessWidget {
  final bool? isDisabled;
  final String title;
  final Color? titleColor;
  final Color backgroundColor;

  final VoidCallback onTap;

  const DefaultButton({
    super.key,
    this.isDisabled,
    required this.title,
    this.titleColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled ?? false;
    final button = Container(
      width: double.infinity,
      height: 44.0,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(disabled ? 0.5 : 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: titleColor ?? Theme.of(context).scaffoldBackgroundColor),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    return disabled
        ? button
        : ScaleGestureDetector(
            onTap: () => onTap(),
            child: button,
          );
  }
}
