import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'BlockedAppBO.g.dart';

@collection
class BlockedAppBO {
  Id id = Isar.autoIncrement;

  late String appName;

  @Index(unique: true)
  late String packageName;

  List<int>? icon;

  bool isBlocked = false;

  bool isChecked = false;

  BlockedAppBO({
    required this.appName,
    required this.packageName,
    this.icon,
    this.isBlocked = false,
    this.isChecked = false,
  });
}
