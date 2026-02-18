import 'exercise.dart';

class Workout {
  final String title;
  final String image;
  final String duration;
  final String calories;
  final List<Exercise> exercises;

  const Workout({
    required this.title,
    required this.image,
    required this.duration,
    required this.calories,
    required this.exercises,
  });
}
