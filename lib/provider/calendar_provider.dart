import 'package:get/get.dart';
import 'package:lunar_clock/model/date_entity.dart';
import 'package:lunar_clock/value/value.dart';

class CalendarProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'localhost:8080';
    // httpClient.addAuthenticator((request) async {
    //   final response = await get('http://localhost:8080');
    //   final token = response.body['token'];
    //   request.headers['Authorization'] = token;
    //   return request;
    // });
    httpClient.maxAuthRetries = 5;
  }

  /**
   * 获取月历
   */
  Future<Response> getMonth(int month) {
    return post('/m/$month', {'m': month});
  }

  /**
   * 获取当日阴历数据
   * @param day 毫秒
   */
  Future<DateEntity> getDay(String dayStr) async {
    // String dayStr = date_format.format(day);
    Response result = await post('/d', {'d': dayStr});
    return DateEntity().fromJson(result.body);
  }
}
