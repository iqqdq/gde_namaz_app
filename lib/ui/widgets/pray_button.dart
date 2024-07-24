import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/widgets/default_button.dart';

class PrayButton extends StatelessWidget {
  final int prayAmount;
  final VoidCallback onTap;

  const PrayButton({
    super.key,
    required this.prayAmount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 3.0,
        top: 4.0,
        bottom: 4.0,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
            width: 0.5,
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          /// PRAY AMOUNT
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_avatar.svg'),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          '$prayAmount ${LocaleKeys.peoplePrayed.tr()}',
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ))),
          Expanded(
              child: DefaultButton(
            title: LocaleKeys.iPrayed.tr(),
            backgroundColor: Theme.of(context).primaryColor,
            onTap: () => onTap(),
          ))
        ],
      ),
    );
  }
}
