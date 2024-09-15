// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetImpl _$$WorkoutSetImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSetImpl(
      exercise: $enumDecode(_$ExerciseEnumMap, json['exercise']),
      weightInKg: (json['weightInKg'] as num).toInt(),
      repetitions: (json['repetitions'] as num).toInt(),
    );

Map<String, dynamic> _$$WorkoutSetImplToJson(_$WorkoutSetImpl instance) =>
    <String, dynamic>{
      'exercise': _$ExerciseEnumMap[instance.exercise]!,
      'weightInKg': instance.weightInKg,
      'repetitions': instance.repetitions,
    };

const _$ExerciseEnumMap = {
  Exercise.barbellRow: 'barbellRow',
  Exercise.benchPress: 'benchPress',
  Exercise.shoulderPress: 'shoulderPress',
  Exercise.deadlift: 'deadlift',
  Exercise.squat: 'squat',
};
