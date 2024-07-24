import 'package:flutter/material.dart';

class AddressIndicator extends StatelessWidget {
  final String title;
  final String subtitle;

  const AddressIndicator({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      width: double.infinity,
      height: 48.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).cardColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// CITY / COUNTRY
          Text(
            title.isEmpty ? '-' : title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 10.0,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),

          /// ADDRESS
          Text(
            subtitle.isEmpty ? '-' : subtitle,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
