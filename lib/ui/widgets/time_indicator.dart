import 'package:flutter/material.dart';
import 'package:gde_namaz/extensions/time_formatter.dart';
import 'package:gde_namaz/ui/ui.dart';

class TimeIndicator extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final VoidCallback onTap;

  const TimeIndicator({
    super.key,
    required this.title,
    required this.dateTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleGestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Theme.of(context).dividerColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// TITLE
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 10.0,
                      color:
                          Theme.of(context).iconTheme.color?.withOpacity(0.5),
                    ),
                overflow: TextOverflow.ellipsis,
              ),

              /// TIME VALUE
              Text(
                dateTime.toTime(),
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onTap: () => onTap());
  }
}
