import 'package:cookbook/BOs/BlockedAppBO/BlockedAppBO.dart';
import 'package:cookbook/BOs/RestrictedAppsBO/RestrictedAppsBO.dart';
import 'package:cookbook/Services/Device%20Services/IsarServices/IIsarService.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService implements IIsarService {
  @override
  late Isar isar;

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        BlockedAppBOSchema,
        RestrictedAppsBOSchema
      ],
      directory: dir.path,
    );
  }
}