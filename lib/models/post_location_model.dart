import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hash_micro_test/models/this_lat_lng.dart';

part 'post_location_model.freezed.dart';
part 'post_location_model.g.dart';

@freezed
class PostLocationModel with _$PostLocationModel {
  const factory PostLocationModel({
    required String name,
    required String label,
    required ThisLatLng coordinates,
}) = _PostLocationModel;

  factory PostLocationModel.fromJson(Map<String, dynamic> json) => _$PostLocationModelFromJson(json);
 // Map<String, dynamic> toJson() => _$PostLocationModelToJson(this);
}