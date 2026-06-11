// ignore_for_file: non_constant_identifier_names

// import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UniversityBO {
  @JsonKey(name: 'alpha_two_code')
  String alphaTwoCode;
  List<String> domains;
  @JsonKey(name: 'state-province')
  String state_province;
  String country;
  String name;
  List<String> web_pages;

  UniversityBO({
    required this.alphaTwoCode,
    required this.country,
    required this.domains,
    required this.name,
    required this.state_province,
    required this.web_pages,
  });
}
