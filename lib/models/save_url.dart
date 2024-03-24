// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'save_url.g.dart';

@HiveType(typeId: 1)
class SaveURL extends Equatable {
  const SaveURL({
    required this.url,
  });
  @HiveField(0)
  final String url;
  
  @override
  List<Object?> get props => [url];
}
