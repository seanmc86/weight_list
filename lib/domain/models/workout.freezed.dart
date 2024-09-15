// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutList _$WorkoutListFromJson(Map<String, dynamic> json) {
  return _WorkoutList.fromJson(json);
}

/// @nodoc
mixin _$WorkoutList {
  List<Workout> get data => throw _privateConstructorUsedError;

  /// Serializes this WorkoutList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutListCopyWith<WorkoutList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutListCopyWith<$Res> {
  factory $WorkoutListCopyWith(
          WorkoutList value, $Res Function(WorkoutList) then) =
      _$WorkoutListCopyWithImpl<$Res, WorkoutList>;
  @useResult
  $Res call({List<Workout> data});
}

/// @nodoc
class _$WorkoutListCopyWithImpl<$Res, $Val extends WorkoutList>
    implements $WorkoutListCopyWith<$Res> {
  _$WorkoutListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutListImplCopyWith<$Res>
    implements $WorkoutListCopyWith<$Res> {
  factory _$$WorkoutListImplCopyWith(
          _$WorkoutListImpl value, $Res Function(_$WorkoutListImpl) then) =
      __$$WorkoutListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Workout> data});
}

/// @nodoc
class __$$WorkoutListImplCopyWithImpl<$Res>
    extends _$WorkoutListCopyWithImpl<$Res, _$WorkoutListImpl>
    implements _$$WorkoutListImplCopyWith<$Res> {
  __$$WorkoutListImplCopyWithImpl(
      _$WorkoutListImpl _value, $Res Function(_$WorkoutListImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$WorkoutListImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Workout>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutListImpl implements _WorkoutList {
  _$WorkoutListImpl(final List<Workout> data) : _data = data;

  factory _$WorkoutListImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutListImplFromJson(json);

  final List<Workout> _data;
  @override
  List<Workout> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'WorkoutList(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutListImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of WorkoutList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutListImplCopyWith<_$WorkoutListImpl> get copyWith =>
      __$$WorkoutListImplCopyWithImpl<_$WorkoutListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutListImplToJson(
      this,
    );
  }
}

abstract class _WorkoutList implements WorkoutList {
  factory _WorkoutList(final List<Workout> data) = _$WorkoutListImpl;

  factory _WorkoutList.fromJson(Map<String, dynamic> json) =
      _$WorkoutListImpl.fromJson;

  @override
  List<Workout> get data;

  /// Create a copy of WorkoutList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutListImplCopyWith<_$WorkoutListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  String get id => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;

  /// Serializes this Workout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call({String id, int createdAt, String name, List<WorkoutSet> sets});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutImplCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$WorkoutImplCopyWith(
          _$WorkoutImpl value, $Res Function(_$WorkoutImpl) then) =
      __$$WorkoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int createdAt, String name, List<WorkoutSet> sets});
}

/// @nodoc
class __$$WorkoutImplCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$WorkoutImpl>
    implements _$$WorkoutImplCopyWith<$Res> {
  __$$WorkoutImplCopyWithImpl(
      _$WorkoutImpl _value, $Res Function(_$WorkoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? name = null,
    Object? sets = null,
  }) {
    return _then(_$WorkoutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutImpl implements _Workout {
  const _$WorkoutImpl(
      {required this.id,
      required this.createdAt,
      required this.name,
      final List<WorkoutSet> sets = const []})
      : _sets = sets;

  factory _$WorkoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutImplFromJson(json);

  @override
  final String id;
  @override
  final int createdAt;
  @override
  final String name;
  final List<WorkoutSet> _sets;
  @override
  @JsonKey()
  List<WorkoutSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'Workout(id: $id, createdAt: $createdAt, name: $name, sets: $sets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, name,
      const DeepCollectionEquality().hash(_sets));

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      __$$WorkoutImplCopyWithImpl<_$WorkoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutImplToJson(
      this,
    );
  }
}

abstract class _Workout implements Workout {
  const factory _Workout(
      {required final String id,
      required final int createdAt,
      required final String name,
      final List<WorkoutSet> sets}) = _$WorkoutImpl;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$WorkoutImpl.fromJson;

  @override
  String get id;
  @override
  int get createdAt;
  @override
  String get name;
  @override
  List<WorkoutSet> get sets;

  /// Create a copy of Workout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutImplCopyWith<_$WorkoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
