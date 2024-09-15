import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weight_list/domain/models/workout.dart';
import 'package:weight_list/domain/models/workout_set.dart';
import 'package:weight_list/features/workout/workout_set.dart';
import 'package:weight_list/features/workout_history/viewmodel.dart';

class WorkoutDetails extends ConsumerWidget {
  /// Specify `workout` to load an existing workout, or leave out to add a new one
  const WorkoutDetails({Workout? workout, super.key}) : _workout = workout;

// Required to be private to resolve dart compilation issues with code generation
  final Workout? _workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_workout?.name ?? 'Add new workout'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          // TODO: Consider a CustomScrollView plus SliverList here
          // for better looking sticky-header type scrolling
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Ionicons.barbell_outline,
                    size: 36,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: _workout != null
                      ? ExistingWorkoutDetails(workout: _workout)
                      : const NewWorkoutDetails()),
            ],
          ),
        ),
      ),
    );
  }
}

class ExistingWorkoutDetails extends ConsumerStatefulWidget {
  const ExistingWorkoutDetails({
    required this.workout,
    super.key,
  });

  final Workout workout;

  @override
  ConsumerState<ExistingWorkoutDetails> createState() =>
      _ExistingWorkoutDetailsState();
}

class _ExistingWorkoutDetailsState
    extends ConsumerState<ExistingWorkoutDetails> {
  bool isEditing = false;
  bool pendingChanges = false;
  bool showNewSet = false;
  late List<WorkoutSet> sets;

  @override
  void initState() {
    super.initState();
    sets = widget.workout.sets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Workout completed on ${widget.workout.date}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
          child: ListView(
            children: [
              if (isEditing)
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      showNewSet = true;
                    });
                  },
                  label: const Text('Add new exercise'),
                  icon: const Icon(Ionicons.add_circle),
                ),
              if (isEditing && showNewSet)
                NewSetCard(
                  onSave: (set) {
                    setState(() {
                      sets.insert(0, set);
                      showNewSet = false;
                    });
                  },
                  onClose: () {
                    setState(() {
                      showNewSet = false;
                    });
                  },
                ),
              for (var i = 0; i < sets.length; i++)
                isEditing
                    ? NewSetCard(
                        key: Key('$i-${sets[i].exercise}'),
                        onSave: (set) {
                          setState(() {
                            sets[i] = set;
                            pendingChanges = true;
                          });
                        },
                        onClose: () {
                          setState(() {
                            sets.removeAt(i);
                            pendingChanges = true;
                          });
                        },
                        initialData: sets[i],
                      )
                    : SetCard(
                        set: sets[i],
                        canDelete: isEditing,
                        onDelete: () {
                          setState(() {
                            sets.removeAt(i);
                          });
                        },
                      )
            ],
          ),
        ),
        if (!isEditing)
          TextButton.icon(
            onPressed: () {
              setState(() {
                isEditing = true;
                pendingChanges = false;
                showNewSet = false;
              });
            },
            label: const Text('Edit'),
            icon: const Icon(
              Ionicons.pencil_sharp,
              size: 16,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pendingChanges)
              TextButton.icon(
                onPressed: () {
                  ref
                      .read(workoutHistoryViewmodelProvider.notifier)
                      .updateWorkout(widget.workout.id, sets)
                      .then((success) {
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Workout updated')),
                      );
                      setState(() {
                        isEditing = false;
                        pendingChanges = false;
                      });
                    }
                  });
                },
                label: const Text('Save'),
                icon: const Icon(Ionicons.checkmark_circle),
              ),
            if (isEditing)
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    sets = widget.workout.sets.toList();
                    isEditing = false;
                    pendingChanges = false;
                  });
                },
                label: const Text('Cancel'),
                icon: const Icon(Ionicons.close_circle),
                style: const ButtonStyle(
                  iconColor: WidgetStatePropertyAll(Colors.redAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.redAccent),
                ),
              )
          ],
        )
      ],
    );
  }
}

class NewWorkoutDetails extends ConsumerStatefulWidget {
  const NewWorkoutDetails({
    super.key,
  });

  @override
  ConsumerState<NewWorkoutDetails> createState() => _NewWorkoutDetailsState();
}

class _NewWorkoutDetailsState extends ConsumerState<NewWorkoutDetails> {
  final List<WorkoutSet> sets = [];
  bool showNewSet = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Workout on ${dayAndMonth(DateTime.now())}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 32,
        ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              showNewSet = true;
            });
          },
          label: const Text('Add new exercise'),
          icon: const Icon(Ionicons.add_circle),
        ),
        Expanded(
          child: ListView(
            children: [
              if (showNewSet)
                NewSetCard(
                  onSave: (set) {
                    setState(() {
                      sets.add(set);
                      showNewSet = false;
                    });
                  },
                  onClose: () {
                    setState(() {
                      showNewSet = false;
                    });
                  },
                ),
              for (var i = 0; i < sets.length; i++)
                SetCard(
                  set: sets[i],
                  canDelete: true,
                  onDelete: () {
                    setState(() {
                      sets.removeAt(i);
                    });
                  },
                )
            ],
          ),
        ),
        if (sets.isNotEmpty)
          TextButton.icon(
            onPressed: () {
              ref
                  .read(workoutHistoryViewmodelProvider.notifier)
                  .saveWorkout(sets);
              Navigator.of(context).pop();
            },
            label: const Text('Save'),
            icon: const Icon(Ionicons.checkmark_circle),
          )
      ],
    );
  }
}
