import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/components/components.dart';
import 'package:gde_namaz/ui/ui.dart';

class MapFloatingButton extends StatelessWidget {
  final VoidCallback onTap;

  const MapFloatingButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const height = 64.0;

    return ScaleGestureDetector(
      child: Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark
                ]),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 1.0),
                blurRadius: 3.0,
                color: Theme.of(context).iconTheme.color?.withOpacity(0.1) ??
                    HexColors.black.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0.0, 4.0),
                blurRadius: 30.0,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              )
            ]),
        child: Center(child: SvgPicture.asset('assets/icons/ic_add.svg')),
      ),
      onTap: () => onTap(),
    );
  }
}
