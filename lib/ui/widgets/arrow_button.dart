import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/ui/ui.dart';

class ArrowButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ArrowButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleGestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            /// TITLE
            Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color:
                            Theme.of(context).iconTheme.color?.withOpacity(0.9),
                      )),
            ),
            const SizedBox(width: 4.0),

            /// ARROW ICON
            SvgPicture.asset(
              'assets/icons/ic_right_arrow.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            )
          ],
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
