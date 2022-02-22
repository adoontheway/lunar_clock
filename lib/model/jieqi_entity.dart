import 'package:lunar_clock/generated/json/base/json_convert_content.dart';
import 'package:lunar_clock/generated/json/base/json_field.dart';

class JieqiEntity with JsonConvert<JieqiEntity> {
	@JSONField(name: "_id")
	late String sId;
	late String index;
	late String label;
	late String time;
}
