import 'package:cookbook/BOs/UniversityBO/UniversityBO.dart';
import 'package:cookbook/Helpers/ServiceResult.dart';

abstract class IUniversityServices {
  Future<ServiceResult<List<UniversityBO>>> getUniversityDetails();
}
