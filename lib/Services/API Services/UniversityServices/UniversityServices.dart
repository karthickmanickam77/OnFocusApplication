// import 'package:cookbook/BOs/UniversityBO/UniversityBO.dart';
// import 'package:cookbook/Helpers/ServiceResult.dart';
// import 'package:cookbook/Services/API%20Services/UniversityServices/IUniversityServices.dart';
// import 'package:dio/dio.dart';

// class UniversityServices extends IUniversityServices {
//   Dio dio = Dio(BaseOptions(baseUrl: 'http://universities.hipolabs.com'));
//   @override
//   Future<ServiceResult<List<UniversityBO>>> getUniversityDetails() async {
//     try {
//       //GET FUNCTION
//       Response response = await dio.get(
//         '/search?country=United+States',
//         // options: Options(headers: {'key': ""})
//       );
//       return response.getAPIServiceResultForList<UniversityBO>(response, UniversityBO.fromJson);
//     } on DioException catch (ex) {
//       if (ex.response!.statusCode == 404) {
//         return ServiceResult(
//             statusCode: ServiceStatusCode.NotFound,
//             content: [],
//             message: 'NOT FOUND');
//       } else {
//         return ServiceResult(
//             statusCode: ServiceStatusCode.ServiceException,
//             content: [],
//             message: ex.response!.data['error']);
//       }
//     } catch (ex) {
//       return ServiceResult(
//           statusCode: ServiceStatusCode.BadRequest,
//           content: [],
//           message: 'Failure');
//     }
//   }
// }
// //HOW TO USE
// // Future<void> invokeAPI({required BO data}) async{
// //   try{
// //     ServiceResult<List<BO>> value = await APIService.getSearchDetails(searchKey: '');
// //     if(value.statusCode==404){

// //     }
// //   }
// // }

//  //POST FUNCTION
//       // await dio.post('url after base url',
//       //     options: Options(headers: {'key': 'value'}),
//       //     data: {'needed keys': 'values'});
//       // return ServiceResult(statusCode: ServiceStatusCode.OK, content: null);

//       //PUT FUNCTION
//       // Response response = await dio.put('path',
//       //     options: Options(headers: {'key': 'value'}),
//       //     data: {'keys': 'values'});
//       // return ServiceResult(statusCode: ServiceStatusCode.OK, message:response.data['Key'],content: null);
