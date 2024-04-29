part of 'apps_cubit.dart';

class AppsState extends Equatable {
  const AppsState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AppsInitial extends AppsState {}

class AppsProgress extends AppsState {}

class AppsSuccess extends AppsState {
  final List<Mapps> apps;
  final String message;
  AppsSuccess({required this.apps, required this.message});
}

class AppsError extends AppsState {
  final Map<String, dynamic> message;
  AppsError({required this.message});
}
