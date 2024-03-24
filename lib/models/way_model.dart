// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'way_model.g.dart';

@JsonSerializable()
class WayApi extends Equatable {
  const WayApi({
    required this.id,
    required this.start,
    required this.end,
    required this.field,
  });
  final String id;
  final Map<String, dynamic> start;
  final Map<String, dynamic> end;
  final List<String> field;

  factory WayApi.fromJson(Map<String, dynamic> json) => _$WayApiFromJson(json);
  Map<String, dynamic> toJson() => _$WayApiToJson(this);

  @override
  List<Object> get props => [id, start, end, field];
}
