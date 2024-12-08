import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamic_app/models/audio.dart';

class AudioApi {
  Future<List<Audio>> loadAudioData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/islamic-network/cdn/master/info/cdn_surah_audio.json'));

    if (response.statusCode == 200) {
      final List<dynamic> AudiosJson = jsonDecode(response.body);
      return AudiosJson.map((json) => Audio.fromJson(json)).toList();
    } else {
      throw Exception(' Failed to Fetch Audio');
    }
  }
}
