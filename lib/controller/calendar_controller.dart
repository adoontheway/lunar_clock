import 'package:get/get.dart';
import 'package:lunar_clock/provider/calendar_provider.dart';

class MyController extends GetxController {
  CalendarProvider provider = CalendarProvider();

  static MyController get to => MyController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
