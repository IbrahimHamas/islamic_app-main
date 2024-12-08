part of 'juz_bloc.dart';

sealed class JuzEvent extends Equatable {
  const JuzEvent();

  @override
  List<Object> get props => [];
}

class FetchJuzDataEvent extends JuzEvent {}
