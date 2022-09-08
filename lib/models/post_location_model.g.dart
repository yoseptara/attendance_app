// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostLocationModel _$$_PostLocationModelFromJson(Map<String, dynamic> json) =>
    _$_PostLocationModel(
      name: json['name'] as String,
      label: json['label'] as String,
      coordinates:
          ThisLatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostLocationModelToJson(
        _$_PostLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'coordinates': instance.coordinates,
    };
