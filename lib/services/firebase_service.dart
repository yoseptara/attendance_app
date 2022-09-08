import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hash_micro_test/models/attendance_model.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/models/post_location_model.dart';
import 'package:hash_micro_test/models/this_lat_lng.dart';

class FirebaseService {
  FirebaseService._();

  static final _attendanceHistoryCollectionRef = FirebaseFirestore.instance
      .collection('attendance_history')
      .withConverter<AttendanceModel>(
          fromFirestore: (snapshot, _) => AttendanceModel.fromJson(snapshot.data()!),
          // toFirestore: (model, _) => model.toJson());
          toFirestore: (model, _) => jsonDecode(jsonEncode(model.toJson())));
  static final _locationsCollectionRef =
      FirebaseFirestore.instance.collection('locations').withConverter<dynamic>(
            fromFirestore: (snapshot, _) {
              final _location =
                  LocationModel.fromJson({...snapshot.data()!, 'id': snapshot.id});
              return _location;
            },
            // toFirestore: (model, _) => model.toJson());
            toFirestore: (model, _) => jsonDecode(
              jsonEncode(
                PostLocationModel(
                        name: model.name, label: model.label, coordinates: model.coordinates)
                    .toJson(),
              ),
            ),
          );

  static Future<void> addAttendance(
    LocationModel attendLocation,
    Position currentLocation,
  ) async {
    final _attendance = AttendanceModel(
      attendAt: DateTime.now().toUtc(),
      location: attendLocation,
      coordinates: ThisLatLng(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
      ),
    );
    // log('cek _attendance : ${}');
    await _attendanceHistoryCollectionRef.add(_attendance);
  }

  static Future<void> addAttendLocation(
    PostLocationModel attendLocation,
  ) async {
    // log('cek _attendance : ${}');
    await _locationsCollectionRef.add(attendLocation);
  }

  static Future<List<AttendanceModel>> getAttendanceHistory() async {
    final _querySnapshot = await _attendanceHistoryCollectionRef.get();

    final _attendanceHistory = _querySnapshot.docs.map((e) => e.data()).toList();
    return _attendanceHistory;
  }

  static Future<List<LocationModel>> getAttendLocations() async {
    final _querySnapshot = await _locationsCollectionRef.get();

    final _attendLocations = _querySnapshot.docs.map((e) => e.data() as LocationModel).toList();
    return _attendLocations;
  }
}
