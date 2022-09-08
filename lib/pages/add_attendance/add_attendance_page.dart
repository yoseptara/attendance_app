import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:hash_micro_test/components/shimmer_widget.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/pages/add_attend_location/add_attend_location_page.dart';
import 'package:hash_micro_test/pages/attendance_history/attendance_history_page.dart';
import 'package:hash_micro_test/utils/progress_loader.dart';
import 'package:hash_micro_test/utils/this_dialog.dart';
import 'package:latlong2/latlong.dart';
import 'package:hash_micro_test/pages/add_attendance/add_attendance_bloc.dart';

class AddAttendancePage extends StatelessWidget {
  static const route = '/add_attendance_page';

  const AddAttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Attendance',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider<AddAttendanceBloc>(
        create: (_) => AddAttendanceBloc()
          ..add(GetLocationPermission())
          ..add(GetAttendLocations()),
        child: const _AddAttendanceView(),
      ),
    );
  }
}

class _AddAttendanceView extends StatefulWidget {
  const _AddAttendanceView({Key? key}) : super(key: key);

  @override
  State<_AddAttendanceView> createState() => _AddAttendanceViewState();
}

class _AddAttendanceViewState extends State<_AddAttendanceView> with WidgetsBindingObserver {
  // List<Marker> allMarkers= [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && mounted) {
      // final _bloc
      // print('run applifecyclestate resumed');
      context.read<AddAttendanceBloc>().add(RecheckLocationPermission());
      // _mapsBloc?.ad(CheckAndUpdateLocationServiceAndPermissionEvent(),);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: BlocProvider.value(
          value: context.read<AddAttendanceBloc>(),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: _SelectAttendLocationDialogContent(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final mapState = MapState.maybeOf(context)!;
    // final mapController = MapController();

    return BlocConsumer<AddAttendanceBloc, AddAttendanceState>(
      listener: (context, state) {
        if (state.showProgressLoader) {
          PLoader.show(context);
        }
        if (state.dismissProgressLoader) {
          PLoader.dismiss();
        }
        if (state.backToAttendanceHistoryPage) {
          Navigator.pushNamedAndRemoveUntil(
              context, AttendanceHistoryPage.route, (route) => false);
        }
        if (state.showOutsideRadiusWarnDialog) {
          ADialog.showErrorDialog(context,
              descText: 'Your current location is outside attend location');
        }
      },
      buildWhen: (previous, current) =>
          previous.isLoadingCurrentLocation != current.isLoadingCurrentLocation ||
          previous.currentLocation != current.currentLocation,
      builder: (context, state) {
        final _currentLocation = state.currentLocation;
        if (state.isLoadingCurrentLocation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (_currentLocation == null) {
          return Center(
            child: Text('cannot get current location'),
          );
        } else {
          return ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Current Location :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(_currentLocation.latitude, _currentLocation.longitude),
                    zoom: 17,
                    // controller: mapController
                  ),
                  // nonRotatedChildren: [
                  //   AttributionWidget.defaultWidget(
                  //     source: 'OpenStreetMap contributors',
                  //     onSourceTapped: null,
                  //   ),
                  // ],

                  children: [
                    TileLayer(
                      // mapState: mapState,
                      // options: TileLayerOptions(),
                      // stream: Stream,
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                          point:
                              LatLng(_currentLocation.latitude, _currentLocation.longitude),
                          width: 80,
                          height: 80,
                          builder: (context) => Icon(
                                Icons.pin_drop,
                                size: 60,
                                color: Colors.blue,
                              ))
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      _showDialog(context);
                    },
                    child: const Text(
                      'Attend',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),

            ],
          );
        }
      },
    );
  }
}

class _SelectAttendLocationDialogContent extends StatelessWidget {
  const _SelectAttendLocationDialogContent({Key? key}) : super(key: key);

  Widget _attendLocationsShimmer() {
    return ListView.separated(
      itemBuilder: (context, i) => const ShimmerWidget(),
      separatorBuilder: (context, i) => const SizedBox(
        height: 12,
        child: Divider(),
      ),
      itemCount: 3,
      shrinkWrap: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAttendanceBloc, AddAttendanceState>(
      buildWhen: (previous, current) =>
          previous.isLoadingAttendLocations != current.isLoadingAttendLocations ||
          previous.attendLocations != current.attendLocations,
      builder: (context, state) {
        if (state.isLoadingAttendLocations) {
          return Center(
            child: _attendLocationsShimmer(),
          );
        } else if (state.attendLocations.isEmpty) {
          return const Center(
            child: Text(
              'location is empty, please add it on firestore',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select location to attend',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ListView.separated(
                itemBuilder: (context, i) => _AttendLocationItem(
                  location: state.attendLocations[i],
                ),
                separatorBuilder: (context, i) => const SizedBox(
                  height: 12,
                  child: Divider(),
                ),
                itemCount: state.attendLocations.length,
                shrinkWrap: true,
              ),
            ],
          );
        }
      },
    );
  }
}

class _AttendLocationItem extends StatelessWidget {
  final LocationModel location;

  const _AttendLocationItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        context.read<AddAttendanceBloc>().add(
              AddAttendance(location),
            );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.label,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              location.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
