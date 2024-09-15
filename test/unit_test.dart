import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';
import 'package:weight_list/domain/models/workout.dart';
import 'package:weight_list/features/workout_history/viewmodel.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

void main() {
  test('Workout history viewmodel - initial load', () async {
    ft.TestWidgetsFlutterBinding.ensureInitialized();

    // Create a ProviderContainer for this test.
    final container = createContainer();

    expect(
      container.read(workoutHistoryViewmodelProvider),
      equals(const AsyncLoading<List<Workout>>()),
    );

    await expectLater(container.read(workoutHistoryViewmodelProvider.future),
        completion(hasLength(2)));
  });

  test('Workout history viewmodel - deletion', () async {
    ft.TestWidgetsFlutterBinding.ensureInitialized();

    // Create a ProviderContainer for this test.
    final container = createContainer();

    await expectLater(
      container
          .read(workoutHistoryViewmodelProvider.notifier)
          .deleteWorkout('1'),
      completion(true),
    );

    container.listen(
      workoutHistoryViewmodelProvider,
      (previous, next) {
        expect(container.read(workoutHistoryViewmodelProvider).value,
            hasLength(1));
      },
    );
  });
}
