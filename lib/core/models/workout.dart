import 'package:json_annotation/json_annotation.dart';

part 'workout.g.dart';

@JsonSerializable()
class Workout {
  String name;
  String caterory;
  String muscleGroup;
  bool isTimeBased;
  double? duration;
  int? reps;
  String? image;

  Workout({
    required this.name,
    required this.isTimeBased,
    required this.caterory,
    required this.muscleGroup,
    this.duration,
    this.reps,
    this.image,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
