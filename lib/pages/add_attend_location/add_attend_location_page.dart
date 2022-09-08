import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hash_micro_test/pages/add_attend_location/add_attend_location_bloc.dart';
import 'package:hash_micro_test/utils/progress_loader.dart';
import 'package:hash_micro_test/utils/this_dialog.dart';
import 'package:latlong2/latlong.dart';

class AddAttendLocationPage extends StatelessWidget {
  static const route = '/add_attend_location_page';

  // final Position currentPosition;

  const AddAttendLocationPage({
    Key? key,
    // required this.currentPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Attend Location',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider<AddAttendLocationBloc>(
        create: (_) =>
        AddAttendLocationBloc()
          ..add(GetLocationPermission()),
        child: _AddAttendLocationView(),
      ),
    );
  }
}

class _AddAttendLocationView extends StatefulWidget {
  const _AddAttendLocationView({Key? key}) : super(key: key);

  @override
  State<_AddAttendLocationView> createState() => _AddAttendLocationViewState();
}

class _AddAttendLocationViewState extends State<_AddAttendLocationView>
    with WidgetsBindingObserver {
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
      context.read<AddAttendLocationBloc>().add(RecheckLocationPermission());
      // _mapsBloc?.ad(CheckAndUpdateLocationServiceAndPermissionEvent(),);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocConsumer<AddAttendLocationBloc, AddAttendLocationState>(
      listener: (context, state) {
        if (state.showProgressLoader) {
          PLoader.show(context);
        }
        if (state.dismissProgressLoader) {
          PLoader.dismiss();
        }
        if (state.backToPreviousPage) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) =>
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                _MapAndLatLngBuilder(),

                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name (Example: Jakarta)'),
                  validator: (String? inputVal) {
                    if (inputVal == null || inputVal.isEmpty) {
                      return 'Please fill this form';
                    }
                  },
                  onChanged: (String inputVal) {
                    context.read<AddAttendLocationBloc>().add(
                      UpdateAddAttendLocationState(
                        inputtedName: inputVal,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Label (Example: Home)'),
                  validator: (String? inputVal) {
                    if (inputVal == null || inputVal.isEmpty) {
                      return 'Please fill this form';
                    }
                  },
                  onChanged: (String inputVal) {
                    context.read<AddAttendLocationBloc>().add(
                      UpdateAddAttendLocationState(
                        inputtedLabel: inputVal,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      final _currentState = context
                          .read<AddAttendLocationBloc>()
                          .state;
                      if (_formKey.currentState?.validate() == true) {
                        context.read<AddAttendLocationBloc>().add(AddAttendLocation());
                      } else if (state.selectedPosition == null) {
                        ADialog.showErrorDialog(context,
                          descText: 'Please wait or select location coordinates first',
            );
                      }
                    },
                    child: const Text(
                      'Add Attend Location',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
    );
  }
}

class _MapAndLatLngBuilder extends StatelessWidget {
  const _MapAndLatLngBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAttendLocationBloc, AddAttendLocationState>(
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: FlutterMap(
                      options: MapOptions(
                          center: LatLng(
                              _currentLocation.latitude, _currentLocation.longitude),
                          zoom: 17,
                          onPositionChanged: (position, bool) {
                            // print('onPositionChanged triggered');
                            context.read<AddAttendLocationBloc>().add(
                              UpdateAddAttendLocationState(
                                  selectedPosition: position.center),
                            );
                          }
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
                        // MarkerLayer(
                        //   markers: [
                        //     Marker(
                        //       point: LatLng(
                        //           state.currentPosition.latitude, state.currentPosition.longitude),
                        //       width: 80,
                        //       height: 80,
                        //       builder: (context) => Icon(
                        //         Icons.pin_drop,
                        //         size: 60,
                        //         color: Colors.blue,
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.pin_drop,
                    size: 60,
                    color: Colors.blue,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              _SelectedLatLngBuilder(),
            ],
          );
        }
      },
    );
  }
}


class _SelectedLatLngBuilder extends StatelessWidget {
  const _SelectedLatLngBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAttendLocationBloc, AddAttendLocationState>(
        buildWhen: (previous, current) =>
        previous.selectedPosition != current.selectedPosition,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected latitude : ${state.selectedPosition?.latitude ??
                    'Not selected yet'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Selected longitude : ${state.selectedPosition?.longitude ??
                    'Not selected yet'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        });
  }
}
