import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'RestrictedAppsBO.g.dart';

@collection
class RestrictedAppsBO {
  Id id = Isar.autoIncrement;

  late String appName;

  @Index(unique: true)
  late String packageName;

  RestrictedAppsBO({
    required this.appName,
    required this.packageName,
  });
}
