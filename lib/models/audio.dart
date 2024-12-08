class Audio {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;
  final String bitrate;

  Audio(
      {required this.identifier,
      required this.language,
      required this.name,
      required this.englishName,
      required this.format,
      required this.type,
      required this.bitrate});

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      identifier: json['identifier'],
      language: json['language'],
      name: json['name'],
      englishName: json['englishName'],
      format: json['format'],
      type: json['type'],
      bitrate: json['bitrate'],
    );
  }
}
