import 'package:lunar_clock/generated/json/base/json_convert_content.dart';
import 'package:lunar_clock/generated/json/base/json_field.dart';
import 'package:lunar_clock/model/time_sub_entity.dart';

class TimeEntity with JsonConvert<TimeEntity> {
	@JSONField(name: "_id")
	late String sId;
	late String day;
	late TimeSubEntity zi;
	late TimeSubEntity chou;
	late TimeSubEntity yin;
	late TimeSubEntity mao;
	late TimeSubEntity chen;
	late TimeSubEntity si;
	late TimeSubEntity wu;
	late TimeSubEntity wei;
	late TimeSubEntity shen;
	late TimeSubEntity you;
	late TimeSubEntity xu;
	late TimeSubEntity hai;
}