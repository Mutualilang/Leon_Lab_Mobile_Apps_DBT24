import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/exercise_list_tile.dart';
import '../widgets/detail_row.dart';
import '../widgets/rainbow_fire_icon.dart';
import 'workout_session_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ImagePlaceholder(
                name: workout.image,
                width: double.infinity,
                height: 220,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(195, 255, 255, 255),
                        Color.fromARGB(82, 255, 255, 255),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              title: Text(
                workout.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined,
                          size: 16, color: Color(0xFF6ECFBF)),
                      const SizedBox(width: 4),
                      Text(
                        workout.duration, 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF6ECFBF),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const RainbowFireIcon(),
                      const SizedBox(width: 4),
                      Text(
                        workout.calories,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const DetailRow(
                    icon: Icons.watch_later_outlined,
                    label: 'Duration',
                    value: '8 Minute',
                  ),
                  const Divider(),
                  const DetailRow(
                    icon: Icons.fitness_center,
                    label: 'Fitness Tools',
                    value: '3 Minute',
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Exercise List',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...workout.exercises.map(
                    (ex) => ExerciseListTile(exercise: ex),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutSessionScreen(
                            exercises: workout.exercises,
                            exerciseIndex: -1,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6ECFBF),
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                        padding:
                            const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Start',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
