import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class OverlayAlert extends StatelessWidget {
  final String title;
  final String actionTitle;
  final bool isDestructive;
  final VoidCallback onTap;

  const OverlayAlert({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.isDestructive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: double.infinity,
        height: 116.0,
        margin: const EdgeInsets.symmetric(horizontal: 32.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).dialogBackgroundColor,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(children: [
                /// CANCEL BUTTON
                Expanded(
                  child: DefaultButton(
                    title: LocaleKeys.cancel.tr(),
                    titleColor: Theme.of(context).iconTheme.color,
                    backgroundColor: Theme.of(context).cardColor,
                    onTap: () => context.router.maybePop(),
                  ),
                ),
                const SizedBox(width: 8.0),

                /// ACTION BUTTON
                Expanded(
                  child: DefaultButton(
                    title: actionTitle,
                    backgroundColor: isDestructive
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).primaryColor,
                    onTap: () => {
                      onTap(),
                      context.router.maybePop(),
                    },
                  ),
                ),
              ]),
            ]),
      ),
    ]);
  }
}
