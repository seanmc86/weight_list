# Weight List

A demo Flutter project to track workouts done, built with:
- Riverpod for state management
- Freezed for immutable data classes, JSON serialization and convenience functions

Workouts can be added, updated or deleted, and the user can view the details of each workout separately.

## Architecture overview

This is predominantly the data, domain, application and presentation architecture presented by [Code with Andrea](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/).

Views are stored by "feature", with the corresponding application + presentation logic alongside. Presentation state is stored in viewmodels. The viewmodels interact with services that decide how to transform the data, and the services interact with repositories which can be local or remote sources.

Data where possible is immutable, requiring new object instances or list instances to be created when updating state.

## Considerations for improvement

This is a minimal implementation to allow list and detail CRUD operations. As such, the UI is intentionally simple. There is some repeated widget code for example between `SetCard` and `NewSetCard` that could be abstracted or reused.

A note is also made in terms of alternate approaches to structuring the provider declarations to add a layer of abstraction.

## Tests

A few sample unit and widget tests are included, showing off both real and mocked data served through the viewmodel providers. Widget tests additionally confirm widgets that should be shown in different UI states (ie loading vs data).

## Pubspec dependencies

Most of the dependencies used are the ones recommended by Riverpod and Freezed to allow for
both class annotations and code generation. The generated code helps reduce boilerplate and time in implementing providers and models, especially when it comes to parsing JSON data.

Other packages used include ionicons (quick and easy open source icons), shimmer (to build good looking loading states), and mockito (to mock providers in tests).

Packages are generally used when they improve workflow and are not highly opionated.

Riverpod deps:
```
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dev:riverpod_generator
flutter pub add dev:build_runner
flutter pub add dev:custom_lint
flutter pub add dev:riverpod_lint
```

Freezed deps:
```
flutter pub add freezed_annotation
flutter pub add dev:build_runner
flutter pub add dev:freezed
flutter pub add json_annotation
flutter pub add dev:json_serializable
```