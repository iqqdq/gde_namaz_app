import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/constants/panel_height_constants.dart';
import 'package:gde_namaz/extensions/time_formatter.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/generated/locale_keys.g.dart';
import 'package:gde_namaz/ui/ui.dart';

class CreateVenueScreen extends StatefulWidget {
  final Future Function() hidePanel;

  const CreateVenueScreen({
    super.key,
    required this.hidePanel,
  });

  @override
  State<CreateVenueScreen> createState() => _CreateVenueScreenState();
}

class _CreateVenueScreenState extends State<CreateVenueScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final DateTime _openingDateTime = DateTime.now().copyWith(
    hour: 6,
    minute: 0,
  );
  final DateTime _closingDateTime = DateTime.now().copyWith(
    hour: 23,
    minute: 0,
  );

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.unfocus();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: kCreateVenueScreenHeight,
      child: BlocConsumer<CreateVenueBloc, CreateVenueState>(
          listener: (context, state) async {
        if (state is CreateVenueSuccessState) {
          await widget.hidePanel().whenComplete(() {
            if (context.mounted) {
              BlocProvider.of<MapBloc>(context).add(MapPointEvent(
                  message: state.message,
                  point: MapPoint(
                    id: state.venue.id,
                    type: state.venue.venueType,
                    lat: state.venue.coordinates.lat,
                    lng: state.venue.coordinates.lng,
                  )));
            }
          });
        }

        if (state is CreateVenueFailureState) {
          widget.hidePanel().whenComplete(() {
            if (context.mounted) {
              BlocProvider.of<MapBloc>(context).add(MapMessageEvent(
                isFaulire: true,
                message: state.message,
              ));
            }
          });
        }
      }, builder: (context, state) {
        /// LOADING INDICATOR
        if (state is CreateVenueLoadingState) {
          return const SizedBox.expand(
            child: Center(child: LoadingIndicator()),
          );
        }

        /// CREATE VENUE LIST VIEW

        return ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              /// TITLE
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  LocaleKeys.addPrayerRoom.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ]),

              const SizedBox(height: 16.0),

              /// ADDRESS INDICATOR

              AddressIndicator(
                title: state.locality,
                subtitle: state.address,
              ),

              const SizedBox(height: 8.0),

              /// NAME INPUT
              SheetInput(
                textEditingController: _textEditingController,
                focusNode: _focusNode,
                hintText: LocaleKeys.enterTheName.tr(),
              ),
              const SizedBox(height: 8.0),

              /// TIME INDICATOR'S
              Row(children: [
                state.isAroundTheClock == true
                    ? Container()
                    : Expanded(
                        child: Row(
                        children: [
                          /// OPEN TIME PICKER
                          Expanded(
                            child: TimeIndicator(
                              title: LocaleKeys.opening.tr(),
                              dateTime:
                                  state.openingDateTime ?? _openingDateTime,
                              onTap: () => _showTimePicker(
                                state: state,
                                isOpening: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),

                          /// CLOSE TIME PICKER
                          Expanded(
                            child: TimeIndicator(
                              title: LocaleKeys.closing.tr(),
                              dateTime:
                                  state.closingDateTime ?? _closingDateTime,
                              onTap: () => _showTimePicker(
                                state: state,
                                isOpening: false,
                              ),
                            ),
                          ),
                        ],
                      )),
                SizedBox(width: state.isAroundTheClock ? 0.0 : 8.0),

                /// 24 HOURS SWITCH
                Expanded(
                  child: TitleSwitch(
                    title: LocaleKeys.twentyFourHours.tr(),
                    value: state.isAroundTheClock,
                    onChanged: (value) =>
                        BlocProvider.of<CreateVenueBloc>(context).add(
                            CreateVenueAroundTheClockEvent(
                                isAroundTheClock: value)),
                  ),
                )
              ]),
              const SizedBox(height: 8.0),

              /// ABLUTION / TOILET
              Row(children: [
                /// ABLUTION SWITCH
                Expanded(
                  child: TitleSwitch(
                    title: LocaleKeys.ablution.tr(),
                    value: state.hasWashroom,
                    onChanged: (value) =>
                        BlocProvider.of<CreateVenueBloc>(context).add(
                            CreateVenueHasWashroomEvent(hasWashroom: value)),
                  ),
                ),
                const SizedBox(width: 8.0),

                /// TOILET SWITCH
                Expanded(
                  child: TitleSwitch(
                    title: LocaleKeys.toilet.tr(),
                    value: state.hasToilet,
                    onChanged: (value) =>
                        BlocProvider.of<CreateVenueBloc>(context)
                            .add(CreateVenueHasToiletEvent(hasToilet: value)),
                  ),
                )
              ]),

              const SizedBox(height: 16.0),

              /// ADD BUTTON
              DefaultButton(
                  isDisabled: _textEditingController.text.isEmpty,
                  title: LocaleKeys.add.tr(),
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: () => {
                        BlocProvider.of<CreateVenueBloc>(context)
                            .add(CreateVenueAddEvent(
                          venueRequest: VenueRequest(
                            venueType: 'prayer_room',
                            caption: _textEditingController.text,
                            comment: 'no comment',
                            description: 'no description',
                            coordinates: state.coordinates ??
                                Coordinates(
                                  lat: 0.0,
                                  lng: 0.0,
                                ),
                            address: '${state.address}, ${state.locality}',
                            hasToilet: state.hasToilet,
                            hasWashroom: state.hasWashroom,
                            openingTime:
                                (state.openingDateTime ?? _openingDateTime)
                                    .toTime(),
                            closingTime:
                                (state.closingDateTime ?? _closingDateTime)
                                    .toTime(),
                          ),
                        )),
                      }),
              const SizedBox(height: 8.0),

              /// CANCEL BUTTON
              DefaultButton(
                title: LocaleKeys.cancel.tr(),
                titleColor: Theme.of(context).disabledColor,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                onTap: () => widget.hidePanel(),
              ),
            ]);
      }),
    );
  }

  // MARK: - FUNCTION'S

  void _showTimePicker({
    required CreateVenueState state,
    required bool isOpening,
  }) =>
      {
        _focusNode.unfocus(),
        showModalBottomSheet(
            context: context,
            backgroundColor: Theme.of(context).cardColor,
            builder: (context) => TimePickerSheet(
                title: isOpening
                    ? LocaleKeys.opening.tr()
                    : LocaleKeys.closing.tr(),
                dateTime: isOpening
                    ? (state.openingDateTime ?? _openingDateTime)
                    : (state.closingDateTime ?? _closingDateTime),
                onTap: (dateTime) => isOpening
                    ? BlocProvider.of<CreateVenueBloc>(context).add(
                        CreateVenueOpeningTimeEvent(openingDateTime: dateTime))
                    : BlocProvider.of<CreateVenueBloc>(context).add(
                        CreateVenueClosingTimeEvent(
                            closingDateTime: dateTime))))
      };
}
