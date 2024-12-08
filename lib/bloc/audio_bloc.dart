import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islamic_app/api/audio_api.dart';
import 'package:islamic_app/models/audio.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioApi _audioApi;
  AudioBloc(this._audioApi) : super(AudioLoading()) {
    on<FetchAudiosEvents>((event, emit) async {
      emit(AudioLoading());

      try {
        final audio = await _audioApi.loadAudioData();
        emit(AudioLoaded(audio));
      } catch (e) {
        emit(AudioError(e.toString()));
      }
    });
  }
}
