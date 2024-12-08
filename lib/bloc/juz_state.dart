part of 'juz_bloc.dart';

sealed class JuzState extends Equatable {
  const JuzState();

  @override
  List<Object> get props => [];
}

final class JuzLoading extends JuzState {}

final class JuzLoaded extends JuzState {
  final List<Juz> juzs;

  const JuzLoaded(this.juzs);
}

final class JuzError extends JuzState {
  final String message;

  const JuzError(this.message);
  @override
  List<Object> get props => [message];
}
