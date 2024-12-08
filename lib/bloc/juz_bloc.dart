import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:islamic_app/api/juz_api.dart';
import 'package:islamic_app/models/juz.dart';

part 'juz_event.dart';
part 'juz_state.dart';

class JuzBloc extends Bloc<JuzEvent, JuzState> {
  final JuzApi _juzApi;
  JuzBloc(this._juzApi) : super(JuzLoading()) {
    on<FetchJuzDataEvent>((event, emit) async {
      emit(JuzLoading());

      try {
        final juzs = await _juzApi.loadJuzData();
        emit(JuzLoaded(juzs));
      } catch (e) {
        emit(JuzError(e.toString()));
      }
    });
  }
}
