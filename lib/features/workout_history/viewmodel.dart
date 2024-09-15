import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weight_list/domain/models/workout.dart';
import 'package:weight_list/domain/models/workout_set.dart';
import 'package:weight_list/features/workout_history/service.dart';

part 'viewmodel.g.dart';

/// Presentation layer:
/// The viewmodel is responsible only for the state of our view and relies
/// on the service to make changes to our workout data
@riverpod
class WorkoutHistoryViewmodel extends _$WorkoutHistoryViewmodel {
  final WorkoutHistoryServiceProtocol _workoutHistoryProvider =
      WorkoutHistoryService();

  @override
  Future<List<Workout>> build() async {
    return _workoutHistoryProvider.getWorkouts().then((workouts) {
      final list = List<Workout>.from(workouts);
      list.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      return list;
    });
  }

  Future<bool> deleteWorkout(String id) async {
    final success = await _workoutHistoryProvider.deleteWorkout(id);
    if (success) {
      final current = state.value ?? [];
      state = AsyncData(current.where((w) => w.id != id).toList());
    }
    return success;
  }

  Future<bool> saveWorkout(List<WorkoutSet> sets) async {
    state = const AsyncValue.loading();
    final now = DateTime.now();
    // could add an AsyncGuard here to validate the success of the operation
    final workout = await _workoutHistoryProvider.saveWorkout(Workout(
      id: now.millisecondsSinceEpoch.toString(),
      createdAt: now.millisecondsSinceEpoch,
      name: 'New workout', // TODO: Add name field to creation
      sets: sets,
    ));
    state = AsyncData([workout, ...state.value ?? []]);

    return true;
  }

  Future<bool> updateWorkout(String id, List<WorkoutSet> sets) async {
    final list = state.value ?? [];
    final index = list.indexWhere((workout) => workout.id == id);
    final updated = list[index].copyWith(sets: sets);
    list[index] = updated;
    state = AsyncData(list);

    return true;
  }
}

class WorkoutHistoryViewmodelMock extends _$WorkoutHistoryViewmodel
    with Mock
    implements WorkoutHistoryViewmodel {
  @override
  Future<List<Workout>> build() {
    return Future.value([
      Workout(
        id: '1',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        name: 'New Workout',
      )
    ]);
  }

  @override
  Future<bool> deleteWorkout(String id) {
    return Future.value(true);
  }
}

// Alternate approach could be to use a StateNotifier, however the preference
// is to gain access to AsyncValue and its convenience methods via the recommended
// @riverpod notation above...

// class WorkoutHistoryViewmodel extends StateNotifier<List<Workout>> {
//   WorkoutHistoryViewmodel() : super([]) {
//     _workoutHistoryProvider.getWorkouts().then((workouts) {
//       state = workouts;
//     });
//   }
//   final WorkoutHistoryServiceProtocol _workoutHistoryProvider =
//       WorkoutHistoryService();

//   List<Workout> get workouts => state;

//   Future<void> deleteWorkout(String id) async {
//     final success = await _workoutHistoryProvider.deleteWorkout(id);
//     if (success) {
//       state.removeWhere((w) => w.id == id);
//     }
//     return Future.value();
//   }
// }
