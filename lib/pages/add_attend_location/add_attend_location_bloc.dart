import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/models/post_location_model.dart';
import 'package:hash_micro_test/models/this_lat_lng.dart';
import 'package:hash_micro_test/services/firebase_service.dart';
import 'package:latlong2/latlong.dart';

part 'add_attend_location_event.dart';

part 'add_attend_location_state.dart';

class AddAttendLocationBloc extends Bloc<AddAttendLocationEvent, AddAttendLocationState> {
  // final Position currentPosition;

  AddAttendLocationBloc(// this.currentPosition,
      )
      : super(
          AddAttendLocationState(
            // currentPosition: currentPosition,
          ),
        ) {
    on<AddAttendLocation>(_onAddAttendLocation);
    on<UpdateAddAttendLocationState>(_onUpdateAddAttendLocationState);
    on<GetLocationPermission>(
      _onGetLocationPermission,
      transformer: concurrent(),
    );
    on<RecheckLocationPermission>(_onRecheckLocationPermission, transformer: concurrent());
    on<GetCurrentLocation>(_onGetCurrentLocation, transformer: concurrent());
  }

  Future<void> _onGetCurrentLocation(
      GetCurrentLocation event,
      Emitter<AddAttendLocationState> emit,
      ) async {
    try {
      emit(
        state.update(
          isLoadingCurrentLocation: true,
        ),
      );
      final _currentLocation = await Geolocator.getCurrentPosition();
      emit(
        state.update(
          currentLocation: _currentLocation,
          selectedPosition: LatLng(_currentLocation.latitude, _currentLocation.longitude),
        ),
      );
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(
          isLoadingCurrentLocation: false,
        ),
      );
    }
  }

  Future<void> _onRecheckLocationPermission(
      RecheckLocationPermission event,
      Emitter<AddAttendLocationState> emit,
      ) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return emit(
        state.update(
          backToPreviousPage: true,
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied &&
        state.permissionStatus == LocationPermission.deniedForever) {
      return emit(
        state.update(
          backToPreviousPage: true,
        ),
      );
    }

    emit(
      state.update(
        permissionStatus: permission,
      ),
    );
  }

  Future<void> _onGetLocationPermission(
      GetLocationPermission event,
      Emitter<AddAttendLocationState> emit,
      ) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return emit(
        state.update(
          backToPreviousPage: true,
        ),
      );
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // if (state.permissionStatus == LocationPermission.deniedForever) {
      //   print('current permission status is denied forever');
      //   return emit(
      //     state.update(
      //       backToPreviousPage: true,
      //     ),
      //   );
      // }

      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return emit(
          state.update(
            backToPreviousPage: true,
          ),
        );
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        Geolocator.openAppSettings();
        // return;
      }
    }

    emit(
      state.update(
        permissionStatus: permission,
      ),
    );
    add(GetCurrentLocation());
  }

  Future<void> _onUpdateAddAttendLocationState(
    UpdateAddAttendLocationState event,
    Emitter<AddAttendLocationState> emit,
  ) async {
    emit(
      state.update(
        selectedPosition: event.selectedPosition,
        isLoadingCurrentLocation: event.isLoading,
        showProgressLoader: event.showProgressLoader,
        dismissProgressLoader: event.dismissProgressLoader,
        currentLocation: event.currentPosition,
        inputtedName: event.inputtedName,
        inputtedLabel: event.inputtedLabel,
      ),
    );
  }

  Future<void> _onAddAttendLocation(
    AddAttendLocation event,
    Emitter<AddAttendLocationState> emit,
  ) async {
    try {
      emit(
        state.update(
          showProgressLoader: true,
        ),
      );
      final _lat = state.selectedPosition!.latitude;
      final _lng = state.selectedPosition!.longitude;
      await FirebaseService.addAttendLocation(
        PostLocationModel(
          name: state.inputtedName ?? '',
          label: state.inputtedLabel ?? '',
          coordinates: ThisLatLng(
            latitude: _lat,
            longitude: _lng,
          ),
        ),
      );
      emit(
        state.update(
          backToPreviousPage: true,
          dismissProgressLoader: true,
        ),
      );
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(
          dismissProgressLoader: true,
        ),
      );
    }
  }
}
