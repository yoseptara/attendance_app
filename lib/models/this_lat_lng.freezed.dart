// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'this_lat_lng.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThisLatLng _$ThisLatLngFromJson(Map<String, dynamic> json) {
  return _ThisLatLng.fromJson(json);
}

/// @nodoc
mixin _$ThisLatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThisLatLngCopyWith<ThisLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThisLatLngCopyWith<$Res> {
  factory $ThisLatLngCopyWith(
          ThisLatLng value, $Res Function(ThisLatLng) then) =
      _$ThisLatLngCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$ThisLatLngCopyWithImpl<$Res> implements $ThisLatLngCopyWith<$Res> {
  _$ThisLatLngCopyWithImpl(this._value, this._then);

  final ThisLatLng _value;
  // ignore: unused_field
  final $Res Function(ThisLatLng) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ThisLatLngCopyWith<$Res>
    implements $ThisLatLngCopyWith<$Res> {
  factory _$$_ThisLatLngCopyWith(
          _$_ThisLatLng value, $Res Function(_$_ThisLatLng) then) =
      __$$_ThisLatLngCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$_ThisLatLngCopyWithImpl<$Res> extends _$ThisLatLngCopyWithImpl<$Res>
    implements _$$_ThisLatLngCopyWith<$Res> {
  __$$_ThisLatLngCopyWithImpl(
      _$_ThisLatLng _value, $Res Function(_$_ThisLatLng) _then)
      : super(_value, (v) => _then(v as _$_ThisLatLng));

  @override
  _$_ThisLatLng get _value => super._value as _$_ThisLatLng;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_ThisLatLng(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThisLatLng implements _ThisLatLng {
  const _$_ThisLatLng({required this.latitude, required this.longitude});

  factory _$_ThisLatLng.fromJson(Map<String, dynamic> json) =>
      _$$_ThisLatLngFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'ThisLatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThisLatLng &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_ThisLatLngCopyWith<_$_ThisLatLng> get copyWith =>
      __$$_ThisLatLngCopyWithImpl<_$_ThisLatLng>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThisLatLngToJson(
      this,
    );
  }
}

abstract class _ThisLatLng implements ThisLatLng {
  const factory _ThisLatLng(
      {required final double latitude,
      required final double longitude}) = _$_ThisLatLng;

  factory _ThisLatLng.fromJson(Map<String, dynamic> json) =
      _$_ThisLatLng.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_ThisLatLngCopyWith<_$_ThisLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}
