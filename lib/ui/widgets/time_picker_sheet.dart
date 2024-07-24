import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class TimePickerSheet extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  final Function(DateTime) onTap;

  const TimePickerSheet({
    super.key,
    required this.title,
    required this.onTap,
    required this.dateTime,
  });

  @override
  State<TimePickerSheet> createState() => _TimePickerSheetState();
}

class _TimePickerSheetState extends State<TimePickerSheet> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    _dateTime = widget.dateTime;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomPadding(
      child: ListView(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16.0,
            right: 16.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            /// TITLE
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ]),
            const SizedBox(height: 16.0),

            Container(
              margin: const EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,
                right: 24.0,
              ),
              child:

                  /// TIME PICKER
                  TimePickerSpinner(
                time: _dateTime,
                is24HourMode: true,
                normalTextStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                        color: Theme.of(context)
                            .iconTheme
                            .color
                            ?.withOpacity(0.5)),
                highlightedTextStyle: Theme.of(context).textTheme.titleMedium,
                spacing: 12.0,
                itemHeight: 40.0,
                isForce2Digits: true,
                onTimeChange: (time) => _dateTime = time,
              ),
            ),
            // CHOOSE BUTTON
            DefaultButton(
              title: LocaleKeys.choose.tr(),
              backgroundColor: Theme.of(context).primaryColor,
              onTap: () => {
                widget.onTap(_dateTime),
                context.router.maybePop(),
              },
            ),
          ]),
    );
  }
}
