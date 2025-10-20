import 'package:json_annotation/json_annotation.dart';
part 'forecast_hour.g.dart';

@JsonSerializable()
class ForecastHour {
  String? icon;

  @JsonKey(name: "temp_c")
  double? temp;
  DateTime? time;

  ForecastHour({
    required this.icon,
    required this.temp,
    required this.time,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) => _$ForecastHourFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastHourToJson(this);


  // factory ForecastHour.fromJson(Map<String, dynamic> json) {
  //   return ForecastHour(
  //     icon: json['condition']['icon']??"",
  //     temp: json['temp_c']??0,
  //     time: DateTime.parse(json['time']??"1970-01-01 00:00"),
  //   );
  // }
}
