import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../models/exercise.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/workout_tile.dart';
import 'workout_detail_screen.dart';

const _strengthWorkouts = [
  Workout(
    title: 'Full Body',
    image: 'assets/images/fullbody.jpeg',
    duration: '60 Minute',
    calories: '20 calories',
    exercises: [
      Exercise(name: 'Knee Jump', duration: '10s', image: 'assets/images/kneeup.jpg'),
      Exercise(name: 'Cobra Pose', duration: '11s', image: 'assets/images/cobra.webp'),
      Exercise(name: 'Sit Up', duration: '60s', image: 'assets/images/situp.jpg'),
    ],
  ),
];

const _absCoreWorkouts = [
  Workout(
    title: 'Sit Up',
    image: 'assets/images/situp.jpg',
    duration: '45 Minute',
    calories: '15 calories',
    exercises: [
      Exercise(name: 'Sit Up', duration: '60s', image: 'assets/images/situp.jpg'),
      Exercise(name: 'Plank', duration: '30s', image: 'assets/images/plank.jpg'),
    ],
  ),
  Workout(
    title: 'Push Up',
    image: 'assets/images/pushup.jpg',
    duration: '30 Minute',
    calories: '10 calories',
    exercises: [
      Exercise(name: 'Cobra Pose', duration: '11s', image: 'assets/images/cobra.webp'),
    ],
  ),
  Workout(
    title: 'Jumping Jacks',
    image: 'assets/images/jumpingjack.webp',
    duration: '30 Minute',
    calories: '12 calories',
    exercises: [
      Exercise(name: 'Knee Jump', duration: '10s', image: 'assets/images/kneeup.jpg'),
      Exercise(name: 'Actually jump', duration: '15s', image: 'assets/images/jumpingjack.webp')
    ],
  ),
];
const _coreworkouts = [
  Workout(
    title: 'Wall Sit',
    image: 'assets/images/wall_sit.jpg',
    duration: '30 Minute',
    calories: '10 calories',
    exercises: [
      Exercise(name: 'Wall Sit', duration: '30s', image: 'assets/images/wall_sit.jpg'),
    ],
  ),

];

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ImagePlaceholder(
                name: 'assets/images/background.jpeg',
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Strength',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Improve Strength and endurance. Choose a muscle group you want to focus and see results!',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.85),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _CategorySection(
                  label: 'Strength',
                  subtitle: 'Improve Strength and endurance. Choose a muscle group you want to focus and see results!',
                  workouts: _strengthWorkouts,
                ),
                _CategorySection(
                  label: 'Abs & Core',
                  workouts: _absCoreWorkouts,
                ),
                _CategorySection(
                  label: 'Core',
                  workouts: _coreworkouts,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String label;
  final String? subtitle;
  final List<Workout> workouts;

  const _CategorySection({
    required this.label,
    this.subtitle,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          const SizedBox(height: 8),
          ...workouts.map(
            (workout) => WorkoutTile(
              title: workout.title,
              image: workout.image,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkoutDetailScreen(workout: workout),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
