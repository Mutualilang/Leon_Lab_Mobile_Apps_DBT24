class Exercise {
  final String name;
  final String duration;
  final String image;

  const Exercise({
    required this.name,
    required this.duration,
    required this.image,
  });
}

const List<Exercise> kExercises = [
  Exercise(
    name: 'Knee Jump',
    duration: '10s',
    image: 'exercise_knee_jump.png',
  ),
  Exercise(
    name: 'Cobra Pose',
    duration: '11s',
    image: 'exercise_cobra.png',
  ),
  Exercise(
    name: 'Sit Up',
    duration: '60s',
    image: 'exercise_situp.png',
  ),
];
