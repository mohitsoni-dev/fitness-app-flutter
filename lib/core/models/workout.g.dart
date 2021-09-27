// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    name: json['name'] as String,
    isTimeBased: json['isTimeBased'] as bool,
    caterory: json['caterory'] as String,
    muscleGroup: json['muscleGroup'] as String,
    duration: (json['duration'] as num?)?.toDouble(),
    reps: json['reps'] as int?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'name': instance.name,
      'caterory': instance.caterory,
      'muscleGroup': instance.muscleGroup,
      'isTimeBased': instance.isTimeBased,
      'duration': instance.duration,
      'reps': instance.reps,
      'image': instance.image,
    };
