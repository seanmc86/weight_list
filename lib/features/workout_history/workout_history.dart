import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weight_list/domain/models/workout.dart';
import 'package:weight_list/features/workout/workout.dart';
import 'package:weight_list/features/workout_history/viewmodel.dart';

class WorkoutHistory extends ConsumerStatefulWidget {
  const WorkoutHistory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WorkoutHistoryState();
}

class _WorkoutHistoryState extends ConsumerState<WorkoutHistory> {
  @override
  void initState() {
    super.initState();

    // Listener for async actions such as snackbars/dialogs
    ref.listenManual(workoutHistoryViewmodelProvider, (previous, next) {});
  }

  @override
  Widget build(BuildContext context) {
    // We can use "ref.watch" inside the build of a ConsumerStatefulWidget the
    // same way ref is accessed in the build args of a stateless widget
    final workouts = ref.watch(workoutHistoryViewmodelProvider);

    return ListView(
        // using AsyncValue.when lets us conveniently map all 3 states of our data:
        // loaded (data), error, loading
        children: workouts.when(
      data: (data) => data
          .map(
            (w) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetails(workout: w),
                  ),
                );
              },
              child: Dismissible(
                key: Key(w.id),
                onDismissed: (_) {
                  // Attempt to delete from state then show snackbar on success
                  ref
                      .read(workoutHistoryViewmodelProvider.notifier)
                      .deleteWorkout(w.id)
                      .then((deleted) => {
                            if (deleted && context.mounted)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Workout deleted!')),
                                )
                              }
                          });
                },
                dismissThresholds: const {DismissDirection.horizontal: 0.5},
                background: const ColoredBox(
                  color: Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Icon(
                          Ionicons.trash,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                child: WorkoutTile(
                  title: 'Workout - ${w.name}',
                  subtitle: 'Sets in this workout: ${w.sets.length}',
                  date: w.date,
                ),
              ),
            ),
          )
          .toList(),
      error: (error, stackTrace) {
        return [ErrorWidget(error)];
      },
      loading: () => List.generate(10, (index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade200,
          enabled: true,
          child: const WorkoutTile(
            title: 'Workout',
            subtitle: 'Sets in this workout',
          ),
        );
      }),
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
    ));
  }
}

class WorkoutTile extends StatelessWidget {
  const WorkoutTile({
    required this.title,
    required this.subtitle,
    this.date = '',
    super.key,
  });

  final String title;
  final String subtitle;
  final String date;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Ionicons.barbell),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        date,
        style: const TextStyle(color: Colors.black45),
      ),
      subtitle: Text(subtitle),
    );
  }
}
