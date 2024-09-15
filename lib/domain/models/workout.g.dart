// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutListImpl _$$WorkoutListImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutListImpl(
      (json['data'] as List<dynamic>)
          .map((e) => Workout.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkoutListImplToJson(_$WorkoutListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['id'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      name: json['name'] as String,
      sets: (json['sets'] as List<dynamic>?)
              ?.map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'sets': instance.sets,
    };
