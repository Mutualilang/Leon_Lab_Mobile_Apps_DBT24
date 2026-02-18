import 'dart:async';
import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/image_placeholder.dart';

class WorkoutSessionScreen extends StatefulWidget {
  final List<Exercise> exercises;
  final int exerciseIndex;

  const WorkoutSessionScreen({
    super.key,
    required this.exercises,
    required this.exerciseIndex,
  });

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  late int _currentIndex;
  late int _seconds;
  late bool _isResting;
  late bool _isDone;
  late List<Exercise> _exercises;
  Timer? _timer;

  static const _countdownSeconds = 9;
  static const _exerciseSeconds = 10;

  @override
  void initState() {
    super.initState();
    _exercises = widget.exercises;
    _currentIndex = widget.exerciseIndex;
    _isResting = false;
    _isDone = false;
    _seconds = _currentIndex == -1 ? _countdownSeconds : _exerciseSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _advance();
        }
      });
    });
  }

  void _advance() {
    if (_currentIndex == -1) {
      _currentIndex = 0;
      _isResting = false;
      _seconds = _exerciseSeconds;
    } else if (!_isResting) {
      if (_currentIndex >= _exercises.length - 1) {
        _timer?.cancel();
        _isDone = true;
      } else {
        _isResting = true;
        _seconds = _exerciseSeconds;
      }
    } else {
      _currentIndex++;
      _isResting = false;
      _seconds = _exerciseSeconds;
    }
  }

  void _skip() => setState(_advance);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _label {
    if (_currentIndex == -1) return 'Get Ready';
    if (_isResting) return 'Rest';
    return _exercises[_currentIndex].name;
  }

  String? get _exerciseImage {
    if (_currentIndex < 0 || _isResting) return null;
    return _exercises[_currentIndex].image;
  }

  double get _progress =>
      _currentIndex < 0 ? 0 : (_currentIndex + 1) / _exercises.length;

  bool get _isLastAndDone =>
      _currentIndex >= _exercises.length - 1 && !_isResting;

  @override
  Widget build(BuildContext context) {
    if (_isDone) return _buildDoneScreen(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            _buildTimer(),
            Expanded(child: _buildVisual()),
            _buildBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildDoneScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF6ECFBF),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 56,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Workout Complete!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Great job! You finished all exercises.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6ECFBF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Back to Workouts',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey[200],
                color: const Color(0xFF6ECFBF),
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.menu, size: 22),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    final mins = _seconds ~/ 60;
    final secs = (_seconds % 60).toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '$mins:$secs',
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVisual() {
    final image = _exerciseImage;
    final showRestOrReady = _isResting || _currentIndex == -1;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: showRestOrReady ? 1.0 : 0.0,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.grey.withOpacity(0.85),
                  Colors.grey.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),

        if (image != null)
          ImagePlaceholder(
            name: image,
            width: 200,
            height: 260,
            transparent: true,
          ),

        AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: showRestOrReady ? 1.0 : 0.0,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.85),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_seconds',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _currentIndex == -1 ? 'Ready' : 'Rest',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_currentIndex < 0 ? 0 : _currentIndex + 1}.',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _label,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: _skip,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Icon(
                _isLastAndDone ? Icons.check : Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}