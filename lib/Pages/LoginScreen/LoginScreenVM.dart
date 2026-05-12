import 'package:cookbook/BOs/UniversityBO/UniversityBO.dart';
import 'package:cookbook/Pages/LoginScreen/LoginScreenModel.dart';

class LoginScreenVM extends LoginScreenModel {
  LoginScreenVM() {
    setUniversityDetails([
      UniversityBO(
          alphaTwoCode: "",
          country: "",
          domains: [],
          name: "",
          state_province: "",
          web_pages: [])
    ]);
    fetchUniversityDetails();
  }
  void fetchUniversityDetails() {
    var content = universityServices.getUniversityDetails();
    print(content);
  }
}
