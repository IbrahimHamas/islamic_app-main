import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islamic_app/api/surah_api.dart';
import 'package:islamic_app/models/surah.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final SurahApi _surahApi;

  SurahBloc(this._surahApi) : super(SurahLoading()) {
    on<FetchSurahDataEvent>((event, emit) async {
      emit(SurahLoading());

      try {
        final surahs = await _surahApi.loadSurahData();
        emit(SurahLoaded(surahs));
      } catch (e) {
        emit(SurahError(e.toString()));
      }
    });
  }
}
