import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_micro_test/models/attendance_model.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/services/firebase_service.dart';

part 'attendance_history_event.dart';

part 'attendance_history_state.dart';

class AttendanceHistoryBloc extends Bloc<AttendanceHistoryEvent, AttendanceHistoryState> {
  AttendanceHistoryBloc()
      : super(
          AttendanceHistoryState(),
        ) {
    on<GetAttendanceHistory>(_onGetAttendanceHistory);

  }



  Future<void> _onGetAttendanceHistory(
    GetAttendanceHistory event,
    Emitter<AttendanceHistoryState> emit,
  ) async {
    try {
      emit(
        state.update(
          isLoadingAttendanceHistory: true,
        ),
      );
      final _result = await FirebaseService.getAttendanceHistory();
      emit(
        state.update(attendanceHistory: _result),
      );
    } catch (exception, stackTrace) {
      debugPrint(exception.toString());
      debugPrintStack(stackTrace: stackTrace);
      // handleError(exception, stackTrace);
    } finally {
      // await Future.delayed(Duration(milliseconds: 100,),);
      emit(
        state.update(
          isLoadingAttendanceHistory: false,
        ),
      );
    }
  }
}
