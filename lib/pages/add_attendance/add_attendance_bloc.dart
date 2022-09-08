import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/services/firebase_service.dart';

part 'add_attendance_event.dart';

part 'add_attendance_state.dart';

class AddAttendanceBloc extends Bloc<AddAttendanceEvent, AddAttendanceState> {
  AddAttendanceBloc()
      : super(
          AddAttendanceState(),
        ) {
    on<AddAttendance>(_onAddAttendance);
    on<GetAttendLocations>(_onGetAttendLocations);
    on<UpdateAddAttendanceState>(_onUpdateAddAttendanceState);
    on<GetLocationPermission>(
      _onGetLocationPermission,
      transformer: concurrent(),
    );
    on<RecheckLocationPermission>(_onRecheckLocationPermission, transformer: concurrent());
    on<GetCurrentLocation>(_onGetCurrentLocation, transformer: concurrent());
  }

  Future<void> _onGetCurrentLocation(
    GetCurrentLocation event,
    Emitter<AddAttendanceState> emit,
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
    Emitter<AddAttendanceState> emit,
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
          backToAttendanceHistoryPage: true,
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied &&
        state.permissionStatus == LocationPermission.deniedForever) {
      return emit(
        state.update(
          backToAttendanceHistoryPage: true,
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
    Emitter<AddAttendanceState> emit,
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
          backToAttendanceHistoryPage: true,
        ),
      );
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // if (state.permissionStatus == LocationPermission.deniedForever) {
      //   print('current permission status is denied forever');
      //   return emit(
      //     state.update(
      //       backToAttendanceHistoryPage: true,
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
            backToAttendanceHistoryPage: true,
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

  Future<void> _onUpdateAddAttendanceState(
    UpdateAddAttendanceState event,
    Emitter<AddAttendanceState> emit,
  ) async {
    emit(
      state.update(
        permissionStatus: event.permissionStatus,
        isLoadingAttendLocations: event.isLoadingAttendLocations,
        showProgressLoader: event.showProgressLoader,
        dismissProgressLoader: event.dismissProgressLoader,
        attendLocations: event.attendLocations,
        selectedAttendLocation: event.selectedAttendLocation,
      ),
    );
  }

  Future<void> _onGetAttendLocations(
    GetAttendLocations event,
    Emitter<AddAttendanceState> emit,
  ) async {
    try {
      emit(
        state.update(
          isLoadingAttendLocations: true,
        ),
      );
      final _result = await FirebaseService.getAttendLocations();
      emit(
        state.update(
          attendLocations: _result,
        ),
      );
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(
          isLoadingAttendLocations: false,
        ),
      );
    }
  }

  Future<void> _onAddAttendance(
    AddAttendance event,
    Emitter<AddAttendanceState> emit,
  ) async {
    try {
      emit(
        state.update(
          showProgressLoader: true,
        ),
      );
      final _attendLocation = event.attendLocation;
      final _currentLocation = await Geolocator.getCurrentPosition();
      log('cek _currentLocation : ${_currentLocation.toJson()}');
      final _distance = Geolocator.distanceBetween(
        _attendLocation.coordinates.latitude,
        _attendLocation.coordinates.longitude,
        _currentLocation.latitude,
        _currentLocation.longitude,
      );
      if (_distance > 50) {
        emit(
          state.update(
            showOutsideRadiusWarnDialog: true,
          ),
        );
      } else {
        await FirebaseService.addAttendance(_attendLocation, _currentLocation);
        emit(
          state.update(
            backToAttendanceHistoryPage: true,
          ),
        );
      }
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
