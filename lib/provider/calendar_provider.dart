import 'dart:ffi';

import 'package:get/get.dart';

class CalendarProvider extends GetConnect {
  int day = DateTime.now().millisecond;
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
    getDay();
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
  Future<Response> getDay() {
    return post('/d', {'d': day});
  }
}
