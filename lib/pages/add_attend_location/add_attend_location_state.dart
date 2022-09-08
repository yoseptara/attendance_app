part of 'add_attend_location_bloc.dart';

class AddAttendLocationState {
  final bool isLoadingCurrentLocation;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final bool backToPreviousPage;
  final Position? currentLocation;
  final LatLng? selectedPosition;
  final LocationPermission? permissionStatus;
  final String? inputtedName;
  final String? inputtedLabel;


  AddAttendLocationState({
    this.isLoadingCurrentLocation = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.backToPreviousPage = false,
    this.currentLocation,
    this.selectedPosition,
    this.permissionStatus,
    this.inputtedName,
    this.inputtedLabel,
  });

  // factory AddAttendLocationState.initial() {
  //   return AddAttendLocationState(
  //   );
  // }

  AddAttendLocationState update({
    bool? isLoadingCurrentLocation,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    bool? backToPreviousPage,
    Position? currentLocation,
    LatLng? selectedPosition,
    LocationPermission? permissionStatus,
    String? inputtedName,
    String? inputtedLabel,

  }) {
    return AddAttendLocationState(
      isLoadingCurrentLocation: isLoadingCurrentLocation ?? this.isLoadingCurrentLocation,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      backToPreviousPage: backToPreviousPage ?? false,
      currentLocation: currentLocation ?? this.currentLocation,
      selectedPosition: selectedPosition ?? this.selectedPosition,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      inputtedName: inputtedName ?? this.inputtedName,
      inputtedLabel: inputtedLabel ?? this.inputtedLabel,

    );
  }
}