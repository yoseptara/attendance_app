import 'package:freezed_annotation/freezed_annotation.dart';

part 'this_lat_lng.freezed.dart';
part 'this_lat_lng.g.dart';

@freezed
class ThisLatLng with _$ThisLatLng {
  const factory ThisLatLng({
    required double latitude,
    required double longitude,
}) = _ThisLatLng;

  factory ThisLatLng.fromJson(Map<String, dynamic> json) => _$ThisLatLngFromJson(json);
 // Map<String, dynamic> toJson() => _$ThisLatLngToJson(this);
}