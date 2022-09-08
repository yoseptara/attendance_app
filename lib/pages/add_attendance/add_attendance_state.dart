part of 'add_attendance_bloc.dart';

class AddAttendanceState {
  final bool isLoadingAttendLocations;
  final bool isLoadingCurrentLocation;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final bool showOutsideRadiusWarnDialog;
  final bool backToAttendanceHistoryPage;
  final LocationPermission? permissionStatus;
  final List<LocationModel> attendLocations;
  final LocationModel? selectedAttendLocation;
  final Position? currentLocation;


  AddAttendanceState({
    this.isLoadingAttendLocations = false,
    this.isLoadingCurrentLocation = true,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.showOutsideRadiusWarnDialog = false,
    this.backToAttendanceHistoryPage = false,
    this.permissionStatus,
    this.attendLocations = const [],
    this.selectedAttendLocation,
    this.currentLocation,
  });

  // factory AddAttendanceState.initial() {
  //   return AddAttendanceState(
  //   );
  // }

  AddAttendanceState update({
    bool? isLoadingAttendLocations,
    bool? isLoadingCurrentLocation,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    bool? showOutsideRadiusWarnDialog,
    bool? backToAttendanceHistoryPage,
    LocationPermission? permissionStatus,
    List<LocationModel>? attendLocations,
    LocationModel? selectedAttendLocation,
    Position? currentLocation,

  }) {
    return AddAttendanceState(
      isLoadingAttendLocations: isLoadingAttendLocations ?? this.isLoadingAttendLocations,
      isLoadingCurrentLocation: isLoadingCurrentLocation ?? this.isLoadingCurrentLocation,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      showOutsideRadiusWarnDialog: showOutsideRadiusWarnDialog ?? false,
      backToAttendanceHistoryPage: backToAttendanceHistoryPage ?? false,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      attendLocations: attendLocations ?? this.attendLocations,
      selectedAttendLocation: selectedAttendLocation ?? this.selectedAttendLocation,
      currentLocation: currentLocation ?? this.currentLocation,

    );
  }
}