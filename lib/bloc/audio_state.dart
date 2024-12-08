part of 'audio_bloc.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

final class AudioLoading extends AudioState {}

final class AudioLoaded extends AudioState {
  final List<Audio> audios;
  AudioLoaded(this.audios);
}

final class AudioError extends AudioState {
  final String message;
  AudioError(this.message);

  @override
  List<Object> get props => [message];
}
