import 'package:cookbook/BOs/AISummaryBO/AISummaryBO.dart';
import 'package:cookbook/Helpers/ServiceResult.dart';
import 'package:cookbook/Services/API Services/AISummaryService/IAISummaryService.dart';
import 'package:dio/dio.dart';

class AISummaryService extends IAISummaryService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://openrouter.ai/api/v1',
      headers: {
        'Authorization': 'Bearer YOUR_OPENROUTER_API_KEY',
        'Content-Type': 'application/json',
      },
    ),
  );

  @override
  Future<ServiceResult<AISummaryBO>> getAISummary({
    required String value,
  }) async {
    try {
      Response response = await dio.post(
        '/chat/completions',
        data: {
          "model": "deepseek/deepseek-v4-flash:free",
          "temperature": 0.7,
          "max_tokens": 100,
          "messages": [
            {"role": "system", "content": "You are a calm wellness assistant."},
            {
              "role": "user",
              "content":
                  "Generate a short wellness summary from this JSON:\n$value"
            }
          ]
        },
      );

      String summary = response.data['choices'][0]['message']['content'];

      AISummaryBO aiSummaryBO = AISummaryBO(
        summary: summary,
      );

      return ServiceResult(
        statusCode: ServiceStatusCode.OK,
        content: aiSummaryBO,
      );
    } on DioException catch (ex) {
      return ServiceResult(
        statusCode: ServiceStatusCode.ServiceException,
        content: null,
        message: ex.response?.data.toString(),
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
