import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_list/domain/models/exercises.dart';

part 'workout_set.freezed.dart';
part 'workout_set.g.dart';

@freezed
class WorkoutSet with _$WorkoutSet {
  const factory WorkoutSet({
    required Exercise exercise,
    required int weightInKg,
    required int repetitions,
  }) = _WorkoutSet;

  factory WorkoutSet.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSetFromJson(json);
}
