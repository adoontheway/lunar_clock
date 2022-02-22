import 'package:lunar_clock/model/jieqi_entity.dart';

jieqiEntityFromJson(JieqiEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['index'] != null) {
		data.index = json['index'].toString();
	}
	if (json['label'] != null) {
		data.label = json['label'].toString();
	}
	if (json['time'] != null) {
		data.time = json['time'].toString();
	}
	return data;
}

Map<String, dynamic> jieqiEntityToJson(JieqiEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['index'] = entity.index;
	data['label'] = entity.label;
	data['time'] = entity.time;
	return data;
}