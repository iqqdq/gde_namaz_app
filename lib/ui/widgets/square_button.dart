import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/components/components.dart';
import 'package:gde_namaz/ui/ui.dart';

class SqareButton extends StatelessWidget {
  final String assetName;
  final VoidCallback onTap;

  const SqareButton({
    super.key,
    required this.assetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleGestureDetector(
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 4.0),
                blurRadius: 30.0,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.1) ??
                    HexColors.black.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0.0, 1.0),
                blurRadius: 3.0,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.05) ??
                    HexColors.black.withOpacity(0.1),
              )
            ]),
        child: Center(
            child: SvgPicture.asset(
          assetName,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color ?? HexColors.black,
            BlendMode.srcIn,
          ),
        )),
      ),
      onTap: () => onTap(),
    );
  }
}
