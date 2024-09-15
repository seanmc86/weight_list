import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weight_list/features/workout_history/viewmodel.dart';
import 'package:weight_list/features/workout_history/workout_history.dart';
import 'package:weight_list/main.dart';

import 'unit_test.dart';

void main() {
  testWidgets('Home screen with tap on add new workout button',
      (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    createContainer();

    await tester.pumpWidget(const MyApp());

    expect(
        find.widgetWithIcon(FloatingActionButton, Icons.add), findsOneWidget);
    expect(find.text('Weight List'), findsOne);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // wait our arbitrary load time for navigation (TODO: add navigation mocking)
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Weight List'), findsNothing);
  });

  testWidgets('Dismiss a workout', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          workoutHistoryViewmodelProvider.overrideWith(
            () => WorkoutHistoryViewmodelMock(),
          )
        ],
        child: const MyApp(),
      ),
    );

    final element = tester.element(find.byType(WorkoutHistory));
    final container = ProviderScope.containerOf(element);

    await container.pump();

    // loading state
    expect(find.byType(ListView), findsOne);
    expect(find.byType(Shimmer), findsAtLeast(1));

    // wait our arbitrary load time included in the model/service
    await tester.pump(const Duration(seconds: 1));

    // no data without the provider setup
    expect(find.byType(Dismissible), findsOne);

    // Swipe the item to dismiss it.
    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    // Build the widget until the dismiss animation ends.
    await tester.pumpAndSettle();

    // Ensure that the item is no longer on screen.
    expect(find.text('Workout -'), findsNothing);
  });
}
