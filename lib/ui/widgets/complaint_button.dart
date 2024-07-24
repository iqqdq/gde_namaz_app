import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/components/hex_colors.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class ComplaintButton extends StatelessWidget {
  final VoidCallback onTap;

  const ComplaintButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleGestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        height: 34.0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset('assets/icons/ic_alert.svg'),
          const SizedBox(width: 6.0),
          Text(
            LocaleKeys.noPrayerRoom.tr(),
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: HexColors.red),
          ),
        ]),
      ),
    );
  }
}
