// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scheduling _$SchedulingFromJson(Map<String, dynamic> json) {
  return Scheduling(
    isCoverage: json['isCoverage'] as bool?,
    patientId: json['patientId'] as int?,
    screen: json['screen'] as String?,
    status: json['status'] as String?,
  )
    ..pageSelectedIndex = json['pageSelectedIndex'] as int?
    ..page = json['page'] as String?;
}

Map<String, dynamic> _$SchedulingToJson(Scheduling instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'pageSelectedIndex': instance.pageSelectedIndex,
      'isCoverage': instance.isCoverage,
      'screen': instance.screen,
      'status': instance.status,
      'page': instance.page,
    };
