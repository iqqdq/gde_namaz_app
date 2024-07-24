import 'package:flutter/material.dart';
import 'package:gde_namaz/ui/ui.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onTap;

  const SettingsButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0),
            child: SqareButton(
              assetName: 'assets/icons/ic_settings.svg',
              onTap: () => onTap(),
            ),
          )),
    );
  }
}
