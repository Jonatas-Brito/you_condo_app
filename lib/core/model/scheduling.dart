import 'package:json_annotation/json_annotation.dart';
part 'scheduling.g.dart';

@JsonSerializable()
class Scheduling {
  int? patientId;
  int? pageSelectedIndex;
  bool? isCoverage;
  String? screen;
  String? status;
  String? page;

  Scheduling({this.isCoverage, this.patientId, this.screen, this.status});

  factory Scheduling.fromJson(Map<String, dynamic> json) =>
      _$SchedulingFromJson(json);
  Map<String, dynamic> toJson() => _$SchedulingToJson(this);
}
