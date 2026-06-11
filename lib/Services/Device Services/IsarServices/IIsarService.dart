import 'package:isar/isar.dart';

abstract class IIsarService {
  Isar get isar;

  Future<void> init();
}