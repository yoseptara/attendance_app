part of 'add_attendance_bloc.dart';

abstract class AddAttendanceEvent {}

class AddAttendance extends AddAttendanceEvent {
  final LocationModel attendLocation;

  AddAttendance(this.attendLocation);
}

class GetCurrentLocation extends AddAttendanceEvent {
}

class GetLocationPermission extends AddAttendanceEvent {
}
class RecheckLocationPermission extends AddAttendanceEvent {
}

class GetAttendLocations extends AddAttendanceEvent {}

class UpdateAddAttendanceState extends AddAttendanceEvent {
  final bool? isLoadingAttendLocations;
  final bool? showProgressLoader;
  final bool? dismissProgressLoader;
  final LocationPermission? permissionStatus;
  final List<LocationModel>? attendLocations;
  final LocationModel? selectedAttendLocation;

  UpdateAddAttendanceState({
    this.isLoadingAttendLocations,
    this.showProgressLoader,
    this.dismissProgressLoader,
    this.permissionStatus,
    this.attendLocations,
    this.selectedAttendLocation,
  });
}
