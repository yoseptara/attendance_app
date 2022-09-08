import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hash_micro_test/models/this_lat_lng.dart';
import 'package:hash_micro_test/utils/json_converter.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String id,
    required String name,
    required String label,
    required ThisLatLng coordinates,
}) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
 // Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}