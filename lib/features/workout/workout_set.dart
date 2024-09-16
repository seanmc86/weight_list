import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weight_list/domain/models/exercises.dart';
import 'package:weight_list/domain/models/workout_set.dart';
import 'package:weight_list/ui/gap.dart';

class SetCard extends StatelessWidget {
  const SetCard(
      {required this.set, this.canDelete = false, this.onDelete, super.key});

  final WorkoutSet set;
  final bool canDelete;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  set.exercise.readableTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.fade,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Reps: ${set.repetitions}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('•'),
                    ),
                    Text(
                      'Weight: ${set.weightInKg}kg',
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ],
            ),
            if (canDelete)
              IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Ionicons.trash_outline,
                    color: Colors.redAccent,
                  ))
          ],
        ),
      ),
    );
  }
}

class NewSetCard extends StatefulWidget {
  const NewSetCard(
      {required this.onSave,
      required this.onClose,
      this.initialData,
      super.key});

  final Function(WorkoutSet) onSave;
  final VoidCallback onClose;
  final WorkoutSet? initialData;

  @override
  State<NewSetCard> createState() => _NewSetCardState();
}

class _NewSetCardState extends State<NewSetCard> {
  late Exercise _exercise;
  final repsController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _exercise = widget.initialData?.exercise ?? Exercise.barbellRow;
    repsController.text = widget.initialData?.repetitions.toString() ?? '';
    weightController.text = widget.initialData?.weightInKg.toString() ?? '';
  }

  bool validate() {
    try {
      final hasReps = int.parse(repsController.text) > 0;
      final hasWeight = int.parse(weightController.text) > 0;
      return hasReps && hasWeight;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.green.shade100),
                  child: DropdownButton<Exercise>(
                      hint: const Text('Select exercise'),
                      style: const TextStyle(color: Colors.black),
                      value: _exercise,
                      items: Exercise.values.map((e) {
                        return DropdownMenuItem<Exercise>(
                            value: e, child: Text(e.readableTitle));
                      }).toList(),
                      onChanged: (e) {
                        if (e != null) {
                          setState(() {
                            _exercise = e;
                          });
                        }
                      }),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(
                                  'Select an exercise, and fill in non-zero values for reps and weight'),
                            ),
                          );
                          return;
                        }
                        widget.onSave(
                          WorkoutSet(
                            exercise: _exercise,
                            weightInKg: int.parse(weightController.text),
                            repetitions: int.parse(repsController.text),
                          ),
                        );
                      },
                      icon: const Icon(
                        Ionicons.checkmark_circle,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onClose,
                      icon: const Icon(
                        Ionicons.close_circle,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap.horizontalMedium(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Rep count'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: repsController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Gap.verticalMedium(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Weight in KG',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
