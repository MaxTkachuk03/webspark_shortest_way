// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'way_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WayApi _$WayApiFromJson(Map<String, dynamic> json) => WayApi(
      id: json['id'] as String,
      start: json['start'] as Map<String, dynamic>,
      end: json['end'] as Map<String, dynamic>,
      field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WayApiToJson(WayApi instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'field': instance.field,
    };
