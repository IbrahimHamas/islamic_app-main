class Surah {
  final String place;
  final String type;
  final int count;
  final String title;
  final String titleAr;
  final int index;
  final int pages;
  final List<Juz> juz;

  Surah(
      {required this.place,
      required this.type,
      required this.count,
      required this.title,
      required this.titleAr,
      required this.index,
      required this.pages,
      required this.juz});

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      place: json['place'],
      type: json['type'],
      count: json['count'],
      title: json['title'],
      titleAr: json['titleAr'],
      index: json['index'],
      pages: json['pages'],
      juz: List<Juz>.from(json['juz'].map((x) => Juz.fromJson(x))),
    );
  }
}

class Juz {
  final int index;
  final JuzVerse verse;

  Juz({required this.index, required this.verse});

  factory Juz.fromJson(Map<String, dynamic> json) {
    return Juz(
      index: json['index'],
      verse: JuzVerse.fromJson(json['verse']),
    );
  }
}

class JuzVerse {
  final String start;
  final String end;

  JuzVerse({required this.start, required this.end});

  factory JuzVerse.fromJson(Map<String, dynamic> json) {
    return JuzVerse(
      start: json['start'],
      end: json['end'],
    );
  }
}
