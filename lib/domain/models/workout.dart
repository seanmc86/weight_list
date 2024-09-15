import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weight_list/domain/models/workout_set.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
abstract class WorkoutList with _$WorkoutList {
  factory WorkoutList(List<Workout> data) = _WorkoutList;

  factory WorkoutList.fromJson(Map<String, dynamic> json) =>
      _$WorkoutListFromJson(json);
}

@freezed
class Workout with _$Workout {
  const factory Workout({
    required final String id,
    required final int createdAt,
    required final String name,
    @Default([]) List<WorkoutSet> sets,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
}

extension WorkoutExtensions on Workout {
  String get date {
    return dayAndMonth(DateTime.fromMillisecondsSinceEpoch(createdAt));
  }
}

String dayAndMonth(DateTime datetime) {
  return '${datetime.day}/${datetime.month}';
}
