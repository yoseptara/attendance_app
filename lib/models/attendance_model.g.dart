// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendanceModel _$$_AttendanceModelFromJson(Map<String, dynamic> json) =>
    _$_AttendanceModel(
      coordinates:
          ThisLatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      attendAt: DateTime.parse(json['attendAt'] as String),
    );

Map<String, dynamic> _$$_AttendanceModelToJson(_$_AttendanceModel instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'location': instance.location,
      'attendAt': instance.attendAt.toIso8601String(),
    };
