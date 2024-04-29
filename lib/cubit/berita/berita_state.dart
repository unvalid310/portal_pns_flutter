part of 'berita_cubit.dart';

class BeritaState extends Equatable {
  BeritaState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BeritaInitial extends BeritaState {}

class BeritaProgress extends BeritaState {
  final bool isLoading;
  BeritaProgress({this.isLoading = false});
}

class BeritaSuccess extends BeritaState {
  final List<Mberita> berita;
  final String message;
  BeritaSuccess({required this.berita, this.message = ''});
}

class BeritaError extends BeritaState {
  final Map<String, dynamic> message;
  BeritaError({required this.message});
}
