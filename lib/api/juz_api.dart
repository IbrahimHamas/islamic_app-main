import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:islamic_app/models/juz.dart';

class JuzApi {
  Future<List<Juz>> loadJuzData() async {
    final jsonString = await rootBundle.loadString('assets/juz.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((json) => Juz.fromJson(json)).toList();
  }
}
