import 'package:lunar_clock/model/time_entity.dart';
import 'package:lunar_clock/model/time_sub_entity.dart';

timeEntityFromJson(TimeEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['day'] != null) {
		data.day = json['day'].toString();
	}
	if (json['zi'] != null) {
		data.zi = TimeSubEntity().fromJson(json['zi']);
	}
	if (json['chou'] != null) {
		data.chou = TimeSubEntity().fromJson(json['chou']);
	}
	if (json['yin'] != null) {
		data.yin = TimeSubEntity().fromJson(json['yin']);
	}
	if (json['mao'] != null) {
		data.mao = TimeSubEntity().fromJson(json['mao']);
	}
	if (json['chen'] != null) {
		data.chen = TimeSubEntity().fromJson(json['chen']);
	}
	if (json['si'] != null) {
		data.si = TimeSubEntity().fromJson(json['si']);
	}
	if (json['wu'] != null) {
		data.wu = TimeSubEntity().fromJson(json['wu']);
	}
	if (json['wei'] != null) {
		data.wei = TimeSubEntity().fromJson(json['wei']);
	}
	if (json['shen'] != null) {
		data.shen = TimeSubEntity().fromJson(json['shen']);
	}
	if (json['you'] != null) {
		data.you = TimeSubEntity().fromJson(json['you']);
	}
	if (json['xu'] != null) {
		data.xu = TimeSubEntity().fromJson(json['xu']);
	}
	if (json['hai'] != null) {
		data.hai = TimeSubEntity().fromJson(json['hai']);
	}
	return data;
}

Map<String, dynamic> timeEntityToJson(TimeEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['day'] = entity.day;
	data['zi'] = entity.zi.toJson();
	data['chou'] = entity.chou.toJson();
	data['yin'] = entity.yin.toJson();
	data['mao'] = entity.mao.toJson();
	data['chen'] = entity.chen.toJson();
	data['si'] = entity.si.toJson();
	data['wu'] = entity.wu.toJson();
	data['wei'] = entity.wei.toJson();
	data['shen'] = entity.shen.toJson();
	data['you'] = entity.you.toJson();
	data['xu'] = entity.xu.toJson();
	data['hai'] = entity.hai.toJson();
	return data;
}
