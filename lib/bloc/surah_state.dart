part of 'surah_bloc.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahLoading extends SurahState {}

final class SurahLoaded extends SurahState {
  final List<Surah> surahs;
  const SurahLoaded(this.surahs);
}

final class SurahError extends SurahState {
  final String message;
  const SurahError(this.message);

  @override
  List<Object> get props => [message];
}
