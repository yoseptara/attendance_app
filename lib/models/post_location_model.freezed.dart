// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostLocationModel _$PostLocationModelFromJson(Map<String, dynamic> json) {
  return _PostLocationModel.fromJson(json);
}

/// @nodoc
mixin _$PostLocationModel {
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  ThisLatLng get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLocationModelCopyWith<PostLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLocationModelCopyWith<$Res> {
  factory $PostLocationModelCopyWith(
          PostLocationModel value, $Res Function(PostLocationModel) then) =
      _$PostLocationModelCopyWithImpl<$Res>;
  $Res call({String name, String label, ThisLatLng coordinates});

  $ThisLatLngCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$PostLocationModelCopyWithImpl<$Res>
    implements $PostLocationModelCopyWith<$Res> {
  _$PostLocationModelCopyWithImpl(this._value, this._then);

  final PostLocationModel _value;
  // ignore: unused_field
  final $Res Function(PostLocationModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? label = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as ThisLatLng,
    ));
  }

  @override
  $ThisLatLngCopyWith<$Res> get coordinates {
    return $ThisLatLngCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value));
    });
  }
}

/// @nodoc
abstract class _$$_PostLocationModelCopyWith<$Res>
    implements $PostLocationModelCopyWith<$Res> {
  factory _$$_PostLocationModelCopyWith(_$_PostLocationModel value,
          $Res Function(_$_PostLocationModel) then) =
      __$$_PostLocationModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String label, ThisLatLng coordinates});

  @override
  $ThisLatLngCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$_PostLocationModelCopyWithImpl<$Res>
    extends _$PostLocationModelCopyWithImpl<$Res>
    implements _$$_PostLocationModelCopyWith<$Res> {
  __$$_PostLocationModelCopyWithImpl(
      _$_PostLocationModel _value, $Res Function(_$_PostLocationModel) _then)
      : super(_value, (v) => _then(v as _$_PostLocationModel));

  @override
  _$_PostLocationModel get _value => super._value as _$_PostLocationModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? label = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$_PostLocationModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as ThisLatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostLocationModel implements _PostLocationModel {
  const _$_PostLocationModel(
      {required this.name, required this.label, required this.coordinates});

  factory _$_PostLocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostLocationModelFromJson(json);

  @override
  final String name;
  @override
  final String label;
  @override
  final ThisLatLng coordinates;

  @override
  String toString() {
    return 'PostLocationModel(name: $name, label: $label, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostLocationModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(coordinates));

  @JsonKey(ignore: true)
  @override
  _$$_PostLocationModelCopyWith<_$_PostLocationModel> get copyWith =>
      __$$_PostLocationModelCopyWithImpl<_$_PostLocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostLocationModelToJson(
      this,
    );
  }
}

abstract class _PostLocationModel implements PostLocationModel {
  const factory _PostLocationModel(
      {required final String name,
      required final String label,
      required final ThisLatLng coordinates}) = _$_PostLocationModel;

  factory _PostLocationModel.fromJson(Map<String, dynamic> json) =
      _$_PostLocationModel.fromJson;

  @override
  String get name;
  @override
  String get label;
  @override
  ThisLatLng get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$_PostLocationModelCopyWith<_$_PostLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
