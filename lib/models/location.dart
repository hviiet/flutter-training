import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String title,
    required String address,
    required int aqi,
    required IconData aqiIcon,
    required int temp,
    IconData? weatherIcon,
    IconData? trailingIcon,
  }) = _Location;
}
