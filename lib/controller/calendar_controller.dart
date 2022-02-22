import 'package:get/get.dart';
import 'package:lunar_clock/provider/calendar_provider.dart';

class CalendarController extends GetxController {
  CalendarProvider provider = CalendarProvider();

  static CalendarController get to => CalendarController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
