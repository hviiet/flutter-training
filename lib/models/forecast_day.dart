import 'package:json_annotation/json_annotation.dart';
part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  String? date;
  String? icon;

  @JsonKey(name: "maxtemp_c")
  double? maxTemp;

  @JsonKey(name: "mintemp_c")
  double? minTemp;

  @JsonKey(name: "avgtemp_c")
  double? avgTemp;

  ForecastDay({
    required this.date,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);  

  // factory ForecastDay.fromJson(Map<String, dynamic> json) {
  //   return ForecastDay(
  //     date: json['date']??"",
  //     icon: json['day']['condition']['icon']??"",
  //     maxTemp: json['day']['maxtemp_c']??0,
  //     minTemp: json['day']['mintemp_c']??0,
  //     avgTemp: json['day']['avgtemp_c']??0,
  //   );
  // }
}
