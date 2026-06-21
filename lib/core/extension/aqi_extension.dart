import 'package:flutter/material.dart';

extension AqiExtension on int {
  String get aqiLabel=> switch (this) {
    >=0 && <= 50 => 'Low',
    >= 51 && <= 100 => 'Moderate',
    >= 101 && <= 150 => 'High',
    _ => 'Very High',
  };

  Color get aqiColor => switch (this) {
    >= 0 && < 25 => const Color.fromRGBO(61, 247, 9, 1),
    >= 25 && < 50 => const Color.fromRGBO(4, 182, 4, 1),
    >= 50 && < 75 => const Color.fromRGBO(252, 147, 0, 1),
    >= 75 && < 100 => const Color.fromRGBO(224, 114, 4, 1),
    >= 100 && < 125 => const Color.fromARGB(255, 255, 65, 65),
    >= 125 && < 150 => const Color.fromARGB(255, 255, 0, 0),
    >= 150 && < 175 => const Color.fromARGB(255, 181, 9, 255),
    _ => const Color.fromARGB(255, 129, 0, 193),
  };

  IconData get aqiIcon => switch (this) {
    >= 0 && < 50 => Icons.sentiment_very_satisfied,
    >= 50 && < 100 => Icons.sentiment_neutral,
    >= 100 && < 150 => Icons.sentiment_very_dissatisfied,
    _ => Icons.mood_bad_rounded,
  };

  Color get aqiBgAqiChartColor => switch (this) {
    >= 0 && < 25 => const Color.fromARGB(155, 61, 247, 9),
    >= 25 && < 50 => const Color.fromARGB(155, 4, 182, 4),
    >= 50 && < 75 => const Color.fromARGB(155, 252, 147, 0),
    >= 75 && < 100 => const Color.fromARGB(155, 224, 114, 4),
    >= 100 && < 125 => const Color.fromARGB(155, 255, 65, 65),
    >= 125 && < 150 => const Color.fromARGB(155, 255, 0, 0),
    >= 150 && < 175 => const Color.fromARGB(155, 181, 9, 255),
    _ => const Color.fromARGB(155, 129, 0, 193),
  };
}