import 'package:flutter/material.dart';

extension AqiExtension on int {
  String get aqiLabel=> switch (this) {
    1 || 2 || 3 => 'Low',
    4 || 5 || 6 => 'Moderate',
    7 || 8  => 'High',
    _ => 'Very High',
  };

  Color get aqiColor => switch (this) {
    1 => const Color.fromRGBO(61, 247, 9, 1),
    2 => const Color.fromRGBO(4, 182, 4, 1),
    3 => const Color.fromRGBO(1, 124, 8, 1),
    4 => const Color.fromRGBO(252, 147, 0, 1),
    5 => const Color.fromRGBO(224, 114, 4, 1),
    6 => const Color.fromRGBO(170, 90, 6, 1),
    7 => const Color.fromRGBO(255, 0, 0, 1),
    8 => const Color.fromRGBO(150, 0, 0, 1),
    9 => const Color.fromARGB(255, 131, 0, 230),
    _ => const Color.fromARGB(255, 127, 1, 131),
  };

  IconData get aqiIcon => switch (this) {
    1 || 2 || 3 => Icons.sentiment_very_satisfied,
    4 || 5 || 6 => Icons.sentiment_neutral,
    7 || 8 => Icons.sentiment_very_dissatisfied,
    _ => Icons.mood_bad_rounded,
  };
}