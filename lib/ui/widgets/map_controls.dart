import 'package:flutter/material.dart';
import 'package:gde_namaz/ui/ui.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onSettingsTap;
  final VoidCallback onFilterTap;
  final VoidCallback onZoomInTap;
  final VoidCallback onZoomOutTap;
  final VoidCallback onUserLocationTap;
  final VoidCallback onAddTap;

  const MapControls({
    super.key,
    required this.onSettingsTap,
    required this.onFilterTap,
    required this.onZoomInTap,
    required this.onZoomOutTap,
    required this.onUserLocationTap,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// SETTINGS BUTTON
              SqareButton(
                assetName: 'assets/icons/ic_settings.svg',
                onTap: () => onSettingsTap(),
              ),

              Column(
                children: [
                  /// FILTER BUTTON
                  SqareButton(
                    assetName: 'assets/icons/ic_filter.svg',
                    onTap: () => onFilterTap(),
                  ),
                  const SizedBox(height: 16.0),

                  /// ZOOM IN BUTTON
                  SqareButton(
                    assetName: 'assets/icons/ic_plus.svg',
                    onTap: () => onZoomInTap(),
                  ),
                  const SizedBox(height: 8.0),

                  /// ZOOM OUT BUTTON
                  SqareButton(
                    assetName: 'assets/icons/ic_minus.svg',
                    onTap: () => onZoomOutTap(),
                  ),
                  const SizedBox(height: 16.0),

                  /// MY LOCATION BUTTON
                  SqareButton(
                    assetName: 'assets/icons/ic_my_location.svg',
                    onTap: () => onUserLocationTap(),
                  ),
                ],
              ),

              /// FLOATING BUTTON
              MapFloatingButton(onTap: () => onAddTap()),
            ]),
      ),
    );
  }
}
