import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_micro_test/components/shimmer_widget.dart';
import 'package:hash_micro_test/models/attendance_model.dart';
import 'package:hash_micro_test/pages/add_attend_location/add_attend_location_page.dart';
import 'package:hash_micro_test/pages/add_attendance/add_attendance_page.dart';
import 'package:hash_micro_test/pages/attendance_history/attendance_history_bloc.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryPage extends StatelessWidget {
  static const route = '/attendance_history_page';

  const AttendanceHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance History',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, AddAttendancePage.route);
                },
                child: const Text(
                  'Add Attendance',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            SizedBox(
              width: double.maxFinite,
              child: MaterialButton(
                padding: const EdgeInsets.all(12),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, AddAttendLocationPage.route);
                  // final _isLocationUpdated = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AddAttendLocationPage(
                  //       currentPosition: state.currentLocation!,
                  //     ),
                  //     settings: RouteSettings(
                  //       name: AddAttendLocationPage.route,
                  //     ),
                  //   ),
                  // );
                  //
                  // if(_isLocationUpdated != null && _isLocationUpdated is bool && _isLocationUpdated) {
                  //   context.read<AddAttendanceBloc>().add(GetAttendLocations());
                  // }
                },
                child: const Text(
                  'Add Attendance Location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => AttendanceHistoryBloc()..add(GetAttendanceHistory()),
        child: const _AttendanceHistoryView(),
      ),
    );
  }
}


class _AttendanceHistoryView extends StatelessWidget {
  const _AttendanceHistoryView({Key? key}) : super(key: key);

  Widget _attendanceShimmer(bool isLoading) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) => ShimmerWidget(
        width: double.maxFinite,
        height: 80,
        enabled: isLoading,
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 24,
        child: Divider(),
      ),
      itemCount: 8,
    );
  }

  Widget _attendanceHistoryBuilder(List<AttendanceModel> _data) {
    return ListView.separated(
      itemBuilder: (context, i) => _AttendanceHistoryItem(
        attendance: _data[i],
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 24,
        child: Divider(),
      ),
      itemCount: _data.length,
    );
  }

  Widget _emptyBuilder() {
    return const Center(
      child: Text(
        'You haven\'t add any attendance yet.',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceHistoryBloc, AttendanceHistoryState>(
      builder: (context, state) {
        if (state.isLoadingAttendanceHistory) {
        // if (true) {
          return _attendanceShimmer(state.isLoadingAttendanceHistory);
        } else if (state.attendanceHistory.isEmpty) {
          return _emptyBuilder();
        } else {
          return _attendanceHistoryBuilder(state.attendanceHistory);
        }
      },
    );
  }
}

class _AttendanceHistoryItem extends StatelessWidget {
  final AttendanceModel attendance;

  const _AttendanceHistoryItem({
    Key? key,
    required this.attendance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _location = attendance.location;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _location.label,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                _location.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Text(
            DateFormat.yMMMd().add_jm().format(attendance.attendAt.toLocal()),
          ),
        ],
      ),
    );
  }
}
