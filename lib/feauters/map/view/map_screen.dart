import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/ui/ui.dart';
import 'package:gde_namaz/constants/constants.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/venue/venue.dart';
import 'package:gde_namaz/feauters/create_venue/view/view.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  final _panelController = PanelController();

  VenueFilter _venueFilter = VenueFilter(
    caption: '',
    hasToilet: false,
    hasWashroom: false,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(listener: (context, state) {
      if (state is MapInitialState) {
        _hidePanel();
      }

      if (state is MapVenueState ||
          state is MapFilterState ||
          state is MapCreateVenueState) {
        _panelController.animatePanelToPosition(1.0);
      }

      if (state is MapSuccessState) {
        Toast().show(
          context: context,
          isFailure: false,
          message: state.message,
        );
      }

      if (state is MapFailureState) {
        Toast().show(
          context: context,
          isFailure: true,
          message: state.message,
        );
      }
    }, builder: (context, state) {
      return Material(
        child: Scaffold(
          body: SlidingUpPanel(
              controller: _panelController,
              parallaxEnabled: true,
              parallaxOffset: .5,
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              minHeight: 0.0,
              maxHeight: _panelHeight(state: state),
              body: _body(),
              onPanelClosed: () => _hidePanel(),
              panelBuilder: (scrollController) => _panel(state: state)),
        ),
      );
    });
  }

  // MARK: - WIDGET'S

  Widget _body() => Stack(children: [
        /// MAP
        MapBody(hidePanel: _hidePanel),

        /// PIN
        BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          if (state is MapCreateVenueState) {
            return Center(child: SvgPicture.asset('assets/icons/ic_pin.svg'));
          }
          return Container();
        }),
      ]);

  Widget _panel({required MapState state}) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: state is MapVenueState
          ? _venueScreen(point: state.point)
          : state is MapFilterState
              ? _filterScreen()
              : state is MapCreateVenueState
                  ? _createVenueScreen()
                  : Container(),
    );
  }

  Widget _filterScreen() => FilterScreen(
        venueFilter: _venueFilter,
        onFilterTap: (venueFilter) => {
          _venueFilter = venueFilter,
          BlocProvider.of<MapBloc>(context)
              .add(MapPointsEvent(venueFilter: _venueFilter)),
        },
        onResetTap: () => {
          _hidePanel(),
          _resetFilter(),
        },
      );

  Widget _venueScreen({required MapPoint point}) => VenueScreen(
        point: point,
        hidePanel: _hidePanel,
      );

  Widget _createVenueScreen() => CreateVenueScreen(hidePanel: _hidePanel);

  // MARK: - FUCNTION'S

  double _panelHeight({required MapState state}) => state is MapVenueState
      ? kVenueScreenHeight
      : state is MapFilterState
          ? kFilterScreenHeight
          : state is MapCreateVenueState
              ? kCreateVenueScreenHeight
              : 0.0;

  Future _hidePanel() async => await _panelController.close().whenComplete(() {
        if (!mounted) return;
        FocusScope.of(context).unfocus();
        BlocProvider.of<MapBloc>(context).add(const MapHidePanelEvent());
      });

  void _resetFilter() {
    _venueFilter = VenueFilter(
      caption: '',
      hasToilet: false,
      hasWashroom: false,
    );
  }
}
