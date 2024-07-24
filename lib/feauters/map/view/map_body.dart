import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gde_namaz/app/app.dart';
import 'package:gde_namaz/constants/map_style_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:gde_namaz/components/components.dart';
import 'package:gde_namaz/api/models/models.dart';
import 'package:gde_namaz/router/router.dart';
import 'package:gde_namaz/ui/ui.dart';
// import 'package:gde_namaz/app/app.dart';
import 'package:gde_namaz/feauters/map/map.dart';
import 'package:gde_namaz/feauters/create_venue/create_venue.dart';

class MapBody extends StatefulWidget {
  final Future Function() hidePanel;

  const MapBody({
    super.key,
    required this.hidePanel,
  });

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  late GoogleMapController _googleMapController;
  final Set<Marker> _markers = {};
  bool _isLocationPermissionEnabled = false;
  LatLng _latLng = const LatLng(
    55.755708897251594,
    37.61743281355969,
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(listener: (context, state) {
      if (state is MapLoadedState) {
        _updateMarkers(points: state.points);
      }

      if (state is MapCreatedState) {
        _updateMarkers(points: state.points);
      }
    }, builder: (context, state) {
      return SizedBox.expand(
        child: Stack(children: [
          /// GOOGLE MAP
          GoogleMap(
            style: context.watch<ThemeBloc>().state.isDark
                ? jsonEncode(aubergineStyle)
                : jsonEncode(standartStyle),
            compassEnabled: false,
            tiltGesturesEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: false,
            myLocationEnabled: _isLocationPermissionEnabled,
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: 12.0,
            ),
            markers: Set<Marker>.of(_markers),
            onMapCreated: (controller) async => {
              _googleMapController = controller,
              await _initTimer(),
              await _handlePermission().whenComplete(() {
                if (context.mounted) {
                  BlocProvider.of<MapBloc>(context).add(MapPointsEvent(
                      venueFilter: VenueFilter(
                    caption: '',
                    hasToilet: false,
                    hasWashroom: false,
                  )));
                }
              })
            },
            onCameraMove: (position) => _onCameraMove(position: position),
            onCameraIdle: () => _setCreateVenueScreenAddress(),
          ),

          /// MAP CONTROLS
          Align(
            alignment: Alignment.centerRight,
            child: MapControls(
              onSettingsTap: () => _showSettingsScreen(),
              onZoomInTap: () => _zoomIn(),
              onZoomOutTap: () => _zoomOut(),
              onUserLocationTap: () => _getUserLocation(),
              onFilterTap: () => _showFilterScreen(),
              onAddTap: () => _showCreateVenueScreen(),
            ),
          ),

          /// PLUG CONTAINER
          // AnimatedOpacity(
          //   opacity: _isPlugHidden ? 0.0 : 1.0,
          //   duration: const Duration(seconds: 1),
          //   child: SizedBox.expand(
          //     child: Container(
          //       color: Theme.of(context).scaffoldBackgroundColor,
          //     ),
          //   ),
          // )
        ]),
      );
    });
  }

  // MARK: - FUCNTION'S

  Future _initTimer() async =>
      Timer.periodic(const Duration(seconds: 3), (timer) async {
        BlocProvider.of<ThemeBloc>(context).add(const ThemeEvent());
      });

  // MARK: - MAP FUCNTION'S

  Future _handlePermission() async {
    final geolocatorPlatform = GeolocatorPlatform.instance;
    final isServicesEnabled =
        await geolocatorPlatform.isLocationServiceEnabled();

    if (isServicesEnabled) {
      var permission = await geolocatorPlatform.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await geolocatorPlatform.requestPermission();

        if (permission == LocationPermission.denied) {
          _isLocationPermissionEnabled = false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _isLocationPermissionEnabled = false;
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        _isLocationPermissionEnabled = true;
      }
    }

    _getUserLocation();
  }

  Future _getUserLocation() async {
    if (_isLocationPermissionEnabled == false) return;

    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((value) => {
              _latLng = LatLng(
                value.latitude,
                value.longitude,
              ),
              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(
                  target: _latLng,
                  zoom: 16.0,
                )),
              )
            });
  }

  Future<void> _onCameraMove({required CameraPosition position}) async {
    _latLng = LatLng(
      position.target.latitude,
      position.target.longitude,
    );
  }

  Future _updateMarkers({required List<MapPoint> points}) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);

    AssetMapBitmap mosqueAssetMapBitmap = await AssetMapBitmap.create(
      imageConfiguration,
      'assets/icons/ic_mosque_marker_android.png',
      width: 42.0,
      height: 53.0,
    );

    AssetMapBitmap prayerRoomAssetMapBitmap = await AssetMapBitmap.create(
      imageConfiguration,
      'assets/icons/ic_prayer_room_marker_android.png',
      width: 42.0,
      height: 53.0,
    );

    for (var element in points) {
      _markers.add(Marker(
        markerId: MarkerId(element.id),
        position: LatLng(
          element.lat,
          element.lng,
        ),
        icon: element.type == 'mosque'
            ? mosqueAssetMapBitmap
            : prayerRoomAssetMapBitmap,
        onTap: () => {_showVenue(point: element)},
      ));
    }
  }

  Future<String> _getAddress() async {
    GoogleGeocodingResponse googleGeocodingResponse = await GoogleGeocodingApi(
      googleApiKey,
      isLogged: false,
    ).reverse(
      '${_latLng.latitude}, ${_latLng.longitude}',
      language: Platform.localeName,
    );

    String? streetName;
    String? streetNumber;

    Iterable<GoogleGeocodingAddressComponent> addressComponents =
        googleGeocodingResponse.results.first.addressComponents;

    for (var component in addressComponents) {
      if (component.types.contains('route')) {
        streetName = component.shortName;
      }

      if (component.types.contains('street_number')) {
        streetNumber = component.longName;
      }
    }

    return (streetNumber == null ? streetName : '$streetName, $streetNumber') ??
        '';
  }

  Future<String> _getLocality() async {
    GoogleGeocodingResponse googleGeocodingResponse = await GoogleGeocodingApi(
      googleApiKey,
      isLogged: false,
    ).reverse(
      '${_latLng.latitude}, ${_latLng.longitude}',
      language: Platform.localeName,
    );

    String? country;
    String? city;

    Iterable<GoogleGeocodingAddressComponent> addressComponents =
        googleGeocodingResponse.results.first.addressComponents;

    for (var component in addressComponents) {
      if (component.types.contains('country')) {
        country = component.longName;
      }

      if (component.types.contains('locality')) {
        city = component.longName;
      }
    }

    return (city == null ? country : '$city, $country') ?? '';
  }

  void _setCreateVenueScreenAddress() async {
    BlocProvider.of<CreateVenueBloc>(context).add(CreateVenueAddressEvent(
        locality: await _getLocality(),
        address: await _getAddress(),
        coordinates: Coordinates(
          lat: _latLng.latitude,
          lng: _latLng.longitude,
        )));
  }

  // MARK: - ACTION'S

  Future _zoomIn() async =>
      _googleMapController.getZoomLevel().then((value) => _googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: _latLng,
            zoom: value + 1.0,
          ))));

  Future _zoomOut() async =>
      _googleMapController.getZoomLevel().then((value) => _googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: _latLng,
            zoom: value - 1.0,
          ))));

  // MARK: - PUSH

  Future _showVenue({required MapPoint point}) async {
    await widget.hidePanel();

    await _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        point.lat,
        point.lng,
      ),
      zoom: 20.0,
    )));

    if (mounted) {
      BlocProvider.of<MapBloc>(context).add(MapVenuePanelEvent(point: point));
    }
  }

  Future _showFilterScreen() async => await widget.hidePanel().whenComplete(() {
        if (mounted) {
          BlocProvider.of<MapBloc>(context).add(const MapFilterPanelEvent());
        }
      });

  Future _showCreateVenueScreen() async =>
      await widget.hidePanel().whenComplete(() async {
        await _googleMapController
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: _latLng,
          zoom: 16.0,
        )));

        if (mounted) {
          BlocProvider.of<MapBloc>(context).add(MapCreateVenuePanelEvent(
            locality: await _getLocality(),
            address: await _getAddress(),
            coordinates: Coordinates(
              lat: _latLng.latitude,
              lng: _latLng.longitude,
            ),
          ));
        }
      });

  void _showSettingsScreen() => context.router.push(const SettingRoute());
}
