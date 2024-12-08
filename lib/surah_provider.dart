

import 'package:flutter/material.dart';

import 'models/surah.dart';

class SurahProvider extends ChangeNotifier {
  Surah? _selectedSurah;

  Surah? get selectedSurah => _selectedSurah;

  void setSurah(Surah surah) {
    _selectedSurah = surah;
    notifyListeners();
  }
}