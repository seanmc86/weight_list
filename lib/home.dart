import 'package:flutter/material.dart';
import 'package:weight_list/features/workout/workout.dart';
import 'package:weight_list/features/workout_history/workout_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const WorkoutHistory(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const WorkoutDetails(),
            ),
          );
        },
        tooltip: 'Add new workout',
        child: const Icon(Icons.add),
      ),
    );
  }
}
