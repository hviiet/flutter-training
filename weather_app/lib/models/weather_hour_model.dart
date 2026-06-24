
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_hour_model.freezed.dart';
part 'weather_hour_model.g.dart';

@freezed
abstract class WeatherHourModel with _$WeatherHourModel{
  const factory WeatherHourModel({
    required DateTime time,
    required double temp_c,
    required WeatherConditionModel condition,
  }) = _WeatherHourModel;

  factory WeatherHourModel.fromJson(Map<String, dynamic> json) 
    => _$WeatherHourModelFromJson(json);
}


@freezed
abstract class WeatherConditionModel with _$WeatherConditionModel{
  const factory WeatherConditionModel({
    required String text,
    required String icon,
  }) = _WeatherConditionModel;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) 
    => _$WeatherConditionModelFromJson(json);
    

}



// class WeatherHourModel {
//   final DateTime time;
//   final double temp_c;
//   final String conditionIcon;

//   WeatherHourModel({
//     required this.time,
//     required this.temp_c,
//     required this.conditionIcon,
//   });

//   factory WeatherHourModel.fromJson(Map<String, dynamic> json) {
//     print("Parsing WeatherHourModel:");
//     return WeatherHourModel(
//       time: DateTime.parse(json['time']),
//       temp_c: json['temp_c'].toDouble(),
//       conditionIcon: 'https:${json['condition']['icon']??''}',
//     );
//   }
// }