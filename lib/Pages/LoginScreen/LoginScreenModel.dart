// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cookbook/BOs/UniversityBO/UniversityBO.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/IUniversityServices.dart';
import 'package:cookbook/Services/API%20Services/UniversityServices/UniversityServices.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'LoginScreenModel.g.dart';

class LoginScreenModel = _LoginScreenModelBase with _$LoginScreenModel;
IUniversityServices universityServices = GetIt.I<UniversityServices>();

abstract class _LoginScreenModelBase with Store {
  @observable
  late List<UniversityBO> universityDetails;

  @action
  void setUniversityDetails(List<UniversityBO> universityDetails) {
    this.universityDetails = universityDetails;
  }
}
