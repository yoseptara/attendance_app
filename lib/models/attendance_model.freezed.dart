// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) {
  return _AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceModel {
  ThisLatLng get coordinates => throw _privateConstructorUsedError;
  LocationModel get location => throw _privateConstructorUsedError;
  DateTime get attendAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) then) =
      _$AttendanceModelCopyWithImpl<$Res>;
  $Res call(
      {ThisLatLng coordinates, LocationModel location, DateTime attendAt});

  $ThisLatLngCopyWith<$Res> get coordinates;
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._value, this._then);

  final AttendanceModel _value;
  // ignore: unused_field
  final $Res Function(AttendanceModel) _then;

  @override
  $Res call({
    Object? coordinates = freezed,
    Object? location = freezed,
    Object? attendAt = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as ThisLatLng,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      attendAt: attendAt == freezed
          ? _value.attendAt
          : attendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $ThisLatLngCopyWith<$Res> get coordinates {
    return $ThisLatLngCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value));
    });
  }

  @override
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_AttendanceModelCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$$_AttendanceModelCopyWith(
          _$_AttendanceModel value, $Res Function(_$_AttendanceModel) then) =
      __$$_AttendanceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {ThisLatLng coordinates, LocationModel location, DateTime attendAt});

  @override
  $ThisLatLngCopyWith<$Res> get coordinates;
  @override
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class __$$_AttendanceModelCopyWithImpl<$Res>
    extends _$AttendanceModelCopyWithImpl<$Res>
    implements _$$_AttendanceModelCopyWith<$Res> {
  __$$_AttendanceModelCopyWithImpl(
      _$_AttendanceModel _value, $Res Function(_$_AttendanceModel) _then)
      : super(_value, (v) => _then(v as _$_AttendanceModel));

  @override
  _$_AttendanceModel get _value => super._value as _$_AttendanceModel;

  @override
  $Res call({
    Object? coordinates = freezed,
    Object? location = freezed,
    Object? attendAt = freezed,
  }) {
    return _then(_$_AttendanceModel(
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as ThisLatLng,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
      attendAt: attendAt == freezed
          ? _value.attendAt
          : attendAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttendanceModel implements _AttendanceModel {
  const _$_AttendanceModel(
      {required this.coordinates,
      required this.location,
      required this.attendAt});

  factory _$_AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceModelFromJson(json);

  @override
  final ThisLatLng coordinates;
  @override
  final LocationModel location;
  @override
  final DateTime attendAt;

  @override
  String toString() {
    return 'AttendanceModel(coordinates: $coordinates, location: $location, attendAt: $attendAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttendanceModel &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.attendAt, attendAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(coordinates),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(attendAt));

  @JsonKey(ignore: true)
  @override
  _$$_AttendanceModelCopyWith<_$_AttendanceModel> get copyWith =>
      __$$_AttendanceModelCopyWithImpl<_$_AttendanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceModelToJson(
      this,
    );
  }
}

abstract class _AttendanceModel implements AttendanceModel {
  const factory _AttendanceModel(
      {required final ThisLatLng coordinates,
      required final LocationModel location,
      required final DateTime attendAt}) = _$_AttendanceModel;

  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$_AttendanceModel.fromJson;

  @override
  ThisLatLng get coordinates;
  @override
  LocationModel get location;
  @override
  DateTime get attendAt;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceModelCopyWith<_$_AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
