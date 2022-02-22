import 'package:get/get.dart';

class CalendarService extends GetxService {
  Future init() async {
    await 1.delay();
    print('$runtimeType delay 1 second.');
  }
}
