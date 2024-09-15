// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutHistoryViewmodelHash() =>
    r'7b9c60ee89827d32629e3dd858699780953e0c97';

/// Presentation layer:
/// The viewmodel is responsible only for the state of our view and relies
/// on the service to make changes to our workout data
///
/// Copied from [WorkoutHistoryViewmodel].
@ProviderFor(WorkoutHistoryViewmodel)
final workoutHistoryViewmodelProvider = AutoDisposeAsyncNotifierProvider<
    WorkoutHistoryViewmodel, List<Workout>>.internal(
  WorkoutHistoryViewmodel.new,
  name: r'workoutHistoryViewmodelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutHistoryViewmodelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WorkoutHistoryViewmodel = AutoDisposeAsyncNotifier<List<Workout>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
