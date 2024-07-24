import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/ui/ui.dart';

class TitleCheckbox extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TitleCheckbox({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleGestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: 50.0,
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
              style: Theme.of(context).textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8.0),

          isSelected
              ? SvgPicture.asset('assets/icons/ic_checkbox_selected.svg')
              : SvgPicture.asset('assets/icons/ic_checkbox.svg')
        ]),
      ),
      onTap: () => onTap(),
    );
  }
}
