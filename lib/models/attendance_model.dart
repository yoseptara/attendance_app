import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hash_micro_test/models/location_model.dart';
import 'package:hash_micro_test/models/this_lat_lng.dart';
import 'package:hash_micro_test/utils/json_converter.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    required ThisLatLng coordinates,
    required LocationModel location,
    required DateTime attendAt,
}) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);
 // Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
}