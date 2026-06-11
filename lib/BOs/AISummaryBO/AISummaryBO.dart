// import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AISummaryBO {
  String summary;
  AISummaryBO({required this.summary});
}
