import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/constants/panel_height_constants.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/venue/venue.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class VenueScreen extends StatefulWidget {
  final MapPoint point;
  final Future Function() hidePanel;

  const VenueScreen({
    super.key,
    required this.point,
    required this.hidePanel,
  });

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<VenueBloc>(context)
          .add(VenueLoadEvent(id: widget.point.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: kVenueScreenHeight,
      child: BlocConsumer<VenueBloc, VenueState>(listener: (context, state) {
        if (state is VenueSuccessState) {
          widget.hidePanel().whenComplete(() {
            if (context.mounted) {
              BlocProvider.of<MapBloc>(context).add(MapMessageEvent(
                isFaulire: false,
                message: state.message,
              ));
            }
          });
        }

        if (state is VenueFailureState) {
          widget.hidePanel().whenComplete(() {
            if (context.mounted) {
              BlocProvider.of<MapBloc>(context).add(MapMessageEvent(
                isFaulire: true,
                message: state.message,
              ));
            }
          });
        }

        if (state is VenueComplaintTypesState) {
          BlocProvider.of<VenueBloc>(context).add(VenueComplaintEvent(
            id: widget.point.id,
            coordinates: Coordinates(
              lat: widget.point.lat,
              lng: widget.point.lng,
            ),
            types: state.types,
          ));
        }
      }, builder: (context, state) {
        /// LOADING INDICATOR
        if (state is VenueLoadingState) {
          return const SizedBox.expand(
            child: Center(child: LoadingIndicator()),
          );
        }

        /// VENUE INFO LIST VIEW
        if (state is VenueLoadedState) {
          return ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                /// NAME
                Text(
                  state.venue.caption,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                const SizedBox(height: 8.0),

                /// ADDRESS
                Text(
                  state.venue.address,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                const SizedBox(height: 16.0),

                /// OPENING HOURS
                Row(children: [
                  SvgPicture.asset('assets/icons/ic_clock.svg'),
                  const SizedBox(width: 6.0),
                  Text(
                    state.venue.openingTime == null
                        ? '${LocaleKeys.openAt.tr()}: ${LocaleKeys.unknown.tr()}'
                        : '${LocaleKeys.openAt.tr()} ${state.venue.openingTime} - ${state.venue.closingTime}',
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 1,
                  ),
                ]),
                const SizedBox(height: 8.0),

                /// ABLUTION / TOILET
                Row(children: [
                  /// ABLUTION
                  SvgPicture.asset((state.venue.hasWashroom ?? false)
                      ? 'assets/icons/ic_checkmark.svg'
                      : 'assets/icons/ic_x_mark.svg'),
                  const SizedBox(width: 6.0),
                  Text(
                    LocaleKeys.ablution.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 20.0),

                  /// TOILET
                  SvgPicture.asset((state.venue.hasToilet ?? false)
                      ? 'assets/icons/ic_checkmark.svg'
                      : 'assets/icons/ic_x_mark.svg'),
                  const SizedBox(width: 6.0),
                  Text(
                    LocaleKeys.toilet.tr(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ]),

                const SizedBox(height: 16.0),

                /// PRAY AMOUNT / PRAY BUTTON
                PrayButton(
                  prayAmount: state.venue.meta?.approvementsCount ?? 0,
                  onTap: () => BlocProvider.of<VenueBloc>(context)
                      .add(VenueApprovementEvent(
                    id: widget.point.id,
                    approvementRequest: ApprovementRequest(
                        coordinates: Coordinates(
                      lat: widget.point.lat,
                      lng: widget.point.lng,
                    )),
                  )),
                ),
                const SizedBox(height: 16.0),

                /// COMPLAINT BUTTON
                ComplaintButton(onTap: () => _showComplaintAlert()),
                const SizedBox(height: 16.0),
              ]);
        }

        return Container();
      }),
    );
  }

  // MARK: - FUNCTION'S

  void _complaint() =>
      BlocProvider.of<VenueBloc>(context).add(const VenueComplaintTypesEvent());

  // MARK: - PUSH

  void _showComplaintAlert() => showDialog(
      context: context,
      builder: (sheetContext) => OverlayAlert(
            title: LocaleKeys.noPrayerRoom.tr(),
            actionTitle: LocaleKeys.no.tr(),
            isDestructive: true,
            onTap: () => _complaint(),
          ));
}
