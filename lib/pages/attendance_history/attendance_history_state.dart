part of 'attendance_history_bloc.dart';

class AttendanceHistoryState {
  final bool isLoadingAttendanceHistory;

  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<AttendanceModel> attendanceHistory;

  AttendanceHistoryState({
    this.isLoadingAttendanceHistory = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.attendanceHistory = const [],
  });

  // factory AttendanceHistoryState.initial() {
  //   return AttendanceHistoryState(
  //   );
  // }

  AttendanceHistoryState update({
    bool? isLoadingAttendanceHistory,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<AttendanceModel>? attendanceHistory,
  }) {
    return AttendanceHistoryState(
      isLoadingAttendanceHistory:
          isLoadingAttendanceHistory ?? this.isLoadingAttendanceHistory,
      showProgressLoader: showProgressLoader ?? false,
      dismissProgressLoader: dismissProgressLoader ?? false,
      attendanceHistory: attendanceHistory ?? this.attendanceHistory,
    );
  }
}
