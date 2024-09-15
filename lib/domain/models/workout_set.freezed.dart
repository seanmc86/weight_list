// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return _WorkoutSet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSet {
  Exercise get exercise => throw _privateConstructorUsedError;
  int get weightInKg => throw _privateConstructorUsedError;
  int get repetitions => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
          WorkoutSet value, $Res Function(WorkoutSet) then) =
      _$WorkoutSetCopyWithImpl<$Res, WorkoutSet>;
  @useResult
  $Res call({Exercise exercise, int weightInKg, int repetitions});
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res, $Val extends WorkoutSet>
    implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? weightInKg = null,
    Object? repetitions = null,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
      weightInKg: null == weightInKg
          ? _value.weightInKg
          : weightInKg // ignore: cast_nullable_to_non_nullable
              as int,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetImplCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$WorkoutSetImplCopyWith(
          _$WorkoutSetImpl value, $Res Function(_$WorkoutSetImpl) then) =
      __$$WorkoutSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Exercise exercise, int weightInKg, int repetitions});
}

/// @nodoc
class __$$WorkoutSetImplCopyWithImpl<$Res>
    extends _$WorkoutSetCopyWithImpl<$Res, _$WorkoutSetImpl>
    implements _$$WorkoutSetImplCopyWith<$Res> {
  __$$WorkoutSetImplCopyWithImpl(
      _$WorkoutSetImpl _value, $Res Function(_$WorkoutSetImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? weightInKg = null,
    Object? repetitions = null,
  }) {
    return _then(_$WorkoutSetImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as Exercise,
      weightInKg: null == weightInKg
          ? _value.weightInKg
          : weightInKg // ignore: cast_nullable_to_non_nullable
              as int,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetImpl implements _WorkoutSet {
  const _$WorkoutSetImpl(
      {required this.exercise,
      required this.weightInKg,
      required this.repetitions});

  factory _$WorkoutSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetImplFromJson(json);

  @override
  final Exercise exercise;
  @override
  final int weightInKg;
  @override
  final int repetitions;

  @override
  String toString() {
    return 'WorkoutSet(exercise: $exercise, weightInKg: $weightInKg, repetitions: $repetitions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.weightInKg, weightInKg) ||
                other.weightInKg == weightInKg) &&
            (identical(other.repetitions, repetitions) ||
                other.repetitions == repetitions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, exercise, weightInKg, repetitions);

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      __$$WorkoutSetImplCopyWithImpl<_$WorkoutSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSet implements WorkoutSet {
  const factory _WorkoutSet(
      {required final Exercise exercise,
      required final int weightInKg,
      required final int repetitions}) = _$WorkoutSetImpl;

  factory _WorkoutSet.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetImpl.fromJson;

  @override
  Exercise get exercise;
  @override
  int get weightInKg;
  @override
  int get repetitions;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
