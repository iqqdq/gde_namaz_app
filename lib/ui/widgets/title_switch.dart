import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const TitleSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0),
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
      child: Row(children: [
        /// TITLE
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 12.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        /// SWITCH
        Transform.scale(
          scale: 0.75,
          child: CupertinoSwitch(
            activeColor: Theme.of(context).primaryColor,
            value: value,
            onChanged: (value) => {
              onChanged(value),
            },
          ),
        ),
      ]),
    );
  }
}
