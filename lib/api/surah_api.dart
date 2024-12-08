import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/models/surah.dart';

class SurahApi {
  Future<List<Surah>> loadSurahData() async {
    final jsonString = await rootBundle.loadString('assets/surah.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((json) => Surah.fromJson(json)).toList();
  }
}
