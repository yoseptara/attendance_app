part of 'add_attend_location_bloc.dart';

abstract class AddAttendLocationEvent {}

class AddAttendLocation extends AddAttendLocationEvent {}

class GetCurrentLocation extends AddAttendLocationEvent {
}

class GetLocationPermission extends AddAttendLocationEvent {
}
class RecheckLocationPermission extends AddAttendLocationEvent {
}

class UpdateAddAttendLocationState extends AddAttendLocationEvent {
  final bool? isLoading;
  final bool? showProgressLoader;
  final bool? dismissProgressLoader;
  final Position? currentPosition;
  final LatLng? selectedPosition;
  final String? inputtedName;
  final String? inputtedLabel;

  UpdateAddAttendLocationState({
    this.isLoading,
    this.showProgressLoader,
    this.dismissProgressLoader,
    this.currentPosition,
    this.selectedPosition,
    this.inputtedName,
    this.inputtedLabel,
  });
}
