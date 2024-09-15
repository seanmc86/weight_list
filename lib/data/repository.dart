import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_list/domain/models/workout.dart';

final localRepositoryProvider = Provider<LocalRepository>((ref) {
  return LocalRepository(ref);
});

/// The point of interaction with any local data storage on the device.
/// We would have an equivalent remote repository to fetch from a server/API
/// and then create a protocol/abstraction for both repositories to extend from.
class LocalRepository {
  LocalRepository(this.ref);

  final Ref ref;

  Future<List<Workout>> getWorkouts() async {
    final response = await rootBundle.loadString('assets/sample_data.json');
    final jsonMap = await json.decode(response) as Map<String, dynamic>;
    return WorkoutList.fromJson(jsonMap).data;
  }
}
