class Juz {
  final int id;
  final SuraStart start;
  final SuraEnd end;

  Juz({required this.id, required this.start, required this.end});

  factory Juz.fromJson(Map<String, dynamic> json) {
    return Juz(
      id: json['id'],
      start: SuraStart.fromJson(json['start']),
      end: SuraEnd.fromJson(json['end']),
    );
  }
}

class SuraStart {
  final int sura;
  final String verse;
  final String name;

  SuraStart({required this.sura, required this.verse, required this.name});

  factory SuraStart.fromJson(Map<String, dynamic> json) {
    return SuraStart(
      sura: json['sura'],
      verse: json['verse'],
      name: json['name'],
    );
  }
}

class SuraEnd {
  final int sura;
  final String verse;
  final String name;

  SuraEnd({required this.sura, required this.verse, required this.name});

  factory SuraEnd.fromJson(Map<String, dynamic> json) {
    return SuraEnd(
      sura: json['sura'],
      verse: json['verse'],
      name: json['name'],
    );
  }
}
