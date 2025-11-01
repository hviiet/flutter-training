import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_info.freezed.dart';

@freezed
class PlaceInfo with _$PlaceInfo {
  const factory PlaceInfo({
    required String title,
    required String address,
    required int aqi,
    required IconData aqiIcon,
    required IconData weatherIcon,
    required int temp,
  }) = _PlaceInfo;
}
