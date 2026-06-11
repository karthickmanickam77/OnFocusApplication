import 'package:cookbook/BOs/WeatherBO/WeatherBO.dart';
import 'package:cookbook/Helpers/ServiceResult.dart';
import 'package:cookbook/Services/API%20Services/WeatherAPIService/IWeatherAPIService.dart';
// import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';

class WeatherAPIService extends IWeatherAPIService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.open-meteo.com',
    ),
  );

  @override
  Future<ServiceResult<WeatherBO>> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      Response response = await dio.get(
        '/v1/forecast',
        queryParameters: {
          "latitude": latitude,
          "longitude": longitude,
          "current": "temperature_2m,weather_code,is_day",
          "timezone": "auto",
        },
      );

      WeatherBO weatherBO = WeatherBO.fromJson(
        response.data['current'],
      )!;

      return ServiceResult(
        statusCode: ServiceStatusCode.OK,
        content: weatherBO,
      );
    } on DioException catch (ex) {
      return ServiceResult(
        statusCode: ServiceStatusCode.ServiceException,
        content: null,
        message: ex.message,
      );
    } catch (ex) {
      return ServiceResult(
        statusCode: ServiceStatusCode.BadRequest,
        content: null,
        message: ex.toString(),
      );
    }
  }
}
