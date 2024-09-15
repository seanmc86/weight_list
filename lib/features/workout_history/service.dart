import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_list/data/repository.dart';
import 'package:weight_list/domain/models/workout.dart';

abstract class WorkoutHistoryServiceProtocol {
  Future<List<Workout>> getWorkouts();
  Future<Workout> saveWorkout(Workout workout);
  Future<bool> deleteWorkout(String id);
  Future<Workout> updateWorkout(Workout workout);
}

/// Application layer:
/// Our service sits between our viewmodel and repository and would typically
/// be constructed with dependencies on various repositories, so that it can
/// internally decided on a caching approach, like pulling from a local cache
/// before a remote one.
class WorkoutHistoryService extends WorkoutHistoryServiceProtocol {
  WorkoutHistoryService();

  List<Workout> _workouts = [];

  @override
  Future<List<Workout>> getWorkouts() async {
    // we could perform this in a dedicated repository, see the example using
    // localRepository below - in order to do so, we'd need to either transform
    // this class into a provider itself, or pass the repository provider from our viewmodel
    final response = await rootBundle.loadString('assets/sample_data.json');
    final jsonMap = await json.decode(response) as Map<String, dynamic>;
    _workouts = WorkoutList.fromJson(jsonMap).data;

    await Future<void>.delayed(const Duration(milliseconds: 1000));
    return _workouts;
  }

  @override
  Future<Workout> saveWorkout(Workout workout) async {
    return workout;
  }

  @override
  Future<bool> deleteWorkout(String id) async {
    _workouts = _workouts.where((w) => w.id != id).toList();
    return true;
  }

  @override
  Future<Workout> updateWorkout(Workout workout) {
    // perform any other required mutations here
    return Future.value(workout);
  }
}

// Alternate structure we could use, making everything a provider:

final workoutServiceProvider = Provider<WorkoutHistoryServiceAlternate>((ref) {
  return WorkoutHistoryServiceAlternate(
      ref, ref.watch(localRepositoryProvider));
});

class WorkoutHistoryServiceAlternate {
  WorkoutHistoryServiceAlternate(
    this.ref,
    this.localRepository,
  );

  final Ref ref;
  final LocalRepository localRepository;
}
