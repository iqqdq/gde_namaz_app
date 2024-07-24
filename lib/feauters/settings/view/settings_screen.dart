import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/constants/constants.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';
import 'package:gde_namaz/ui/widgets/arrow_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 16.0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          /// BACK BUTTON
          ScaleGestureDetector(
            child: SvgPicture.asset(
              'assets/icons/ic_left_arrow.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
            onTap: () => context.router.maybePop(),
          ),

          /// LOGO
          Image.asset(
            'assets/images/img_logo.png',
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(width: 26.0)
        ]),
      ),
      body: SafeArea(
        child: BottomPadding(
          child: Stack(children: [
            ListView(padding: const EdgeInsets.all(16.0), children: [
              /// DESCRIPTION
              Text(
                'Описание проекта. Рыба-текст - информатика в 1-11 классах в школах Белгородской области. Региональная онлайн-платформа, где учащиеся 1-11 классов белгородских школ изучают навыки будущего в интерактивной форме',
                style: Theme.of(context).textTheme.labelSmall,
              ),

              const SizedBox(height: 24.0),

              /// SHARE BUTTON
              ArrowButton(
                title: LocaleKeys.tellYourFriends.tr(),
                onTap: () => _share(),
              ),
              const SizedBox(height: 16.0),

              /// INSTAGRAM BUTTON
              ArrowButton(
                title: LocaleKeys.weAreOnInstagram.tr(),
                onTap: () => _openUrl(url: kInstagramUrl),
              ),
              const SizedBox(height: 16.0),

              /// PRIVACY POLICY BUTTON
              ArrowButton(
                  title: LocaleKeys.privacyPoilcy.tr(),
                  onTap: () => {
                        // TODO OPEN PRIVACY POLICY
                      }),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child:

                  /// APP VERSION
                  Text('${LocaleKeys.version.tr()} 1.0',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .iconTheme
                                .color
                                ?.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                          )),
            )
          ]),
        ),
      ),
    );
  }

  // MARK: - FUNCTION'S

  void _share() => Share.share(Platform.isIOS ? kAppStoreUrl : kGooglePlayUrl);

  Future _openUrl({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url.replaceAll(' ', '')))) {
      launchUrl(Uri.parse(url.replaceAll(' ', '')));
    } else if (await canLaunchUrl(
        Uri.parse('https://${url.replaceAll(' ', '')}'))) {
      launchUrl(Uri.parse('https://${url.replaceAll(' ', '')}'));
    }
  }
}
