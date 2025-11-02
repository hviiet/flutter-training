// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollutantImpl _$$PollutantImplFromJson(Map<String, dynamic> json) =>
    _$PollutantImpl(
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$PollutantImplToJson(_$PollutantImpl instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};
