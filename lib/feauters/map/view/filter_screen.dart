import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gde_namaz/api/models/entities/venue_filter.dart';
import 'package:gde_namaz/constants/panel_height_constants.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class FilterScreen extends StatefulWidget {
  final VenueFilter venueFilter;
  final Function(VenueFilter) onFilterTap;
  final VoidCallback onResetTap;

  const FilterScreen({
    super.key,
    required this.venueFilter,
    required this.onFilterTap,
    required this.onResetTap,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late VenueFilter _venueFilter;

  @override
  void initState() {
    _venueFilter = widget.venueFilter;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: kFilterScreenHeight,
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            /// TITLE
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                LocaleKeys.filters.tr(),
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ]),

            const SizedBox(height: 16.0),

            /// OPEN CHECKBOX
            TitleCheckbox(
              title: LocaleKeys.open.tr(),
              isSelected: true,
              onTap: () => {},
            ),

            const SizedBox(height: 8.0),

            /// ABLUTION CHECKBOX
            TitleCheckbox(
              title: LocaleKeys.ablution.tr(),
              isSelected: _venueFilter.hasWashroom,
              onTap: () => setState(
                  () => _venueFilter.hasWashroom = !_venueFilter.hasWashroom),
            ),
            const SizedBox(height: 8.0),

            /// TOILET CHECKBOX
            TitleCheckbox(
              title: LocaleKeys.toilet.tr(),
              isSelected: _venueFilter.hasToilet,
              onTap: () => setState(
                  () => _venueFilter.hasToilet = !_venueFilter.hasToilet),
            ),
            const SizedBox(height: 16.0),

            /// APPLY BUTTON
            DefaultButton(
              title: LocaleKeys.apply.tr(),
              backgroundColor: Theme.of(context).primaryColor,
              onTap: () => widget.onFilterTap(_venueFilter),
            ),
            const SizedBox(height: 8.0),

            /// RESET BUTTON
            DefaultButton(
              title: LocaleKeys.resetFilters.tr(),
              titleColor: Theme.of(context).disabledColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onTap: () => widget.onResetTap(),
            ),
          ]),
    );
  }
}
