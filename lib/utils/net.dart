import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:lunar_clock/const/const.dart';

String host = "http://localhost:8080";
late Dio dio;
Future<bool> initDio() async {
  dio = Dio(
    BaseOptions(
      baseUrl: host,
      // connectTimeout: 5000,
      // receiveTimeout: 5000,
      headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
    ),
  );
  // 上报设备信息成功会返回token
  var result = await _reportDeviceInfo();
  if (result) {
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: false));
    var cookieJar = CookieJar();
    // 也可以将请求缓存到本地
    // PersistCookieJar pCookieJar = PersistCookieJar()
    dio.interceptors.add(CookieManager(cookieJar));
  }

  return result;
}

Future<bool> _reportDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo = await deviceInfoPlugin.deviceInfo;
  final map = deviceInfo.toMap();
  Response response = await dio.post(api_device_info, data: map);
  if (response.statusCode == HttpStatus.ok) {
    dio.options.headers["token"] = response.data["token"];
    return true;
  }
  print(
      "error on report device info: ${response.statusCode} - ${response.statusMessage}");
  return false;
}

class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers["token"] == null) {
      handler.reject(
          DioError(requestOptions: options, error: "not authorized"), true);
    } else {
      return handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
