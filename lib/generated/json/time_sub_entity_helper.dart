import 'package:lunar_clock/model/time_sub_entity.dart';

timeSubEntityFromJson(TimeSubEntity data, Map<String, dynamic> json) {
	if (json['shi_ke'] != null) {
		data.shiKe = json['shi_ke'].toString();
	}
	if (json['shi_gan_zhi'] != null) {
		data.shiGanZhi = json['shi_gan_zhi'].toString();
	}
	if (json['ba_zi'] != null) {
		data.baZi = json['ba_zi'].toString();
	}
	if (json['xing_shen'] != null) {
		data.xingShen = json['xing_shen'].toString();
	}
	if (json['zheng_chong'] != null) {
		data.zhengChong = json['zheng_chong'].toString();
	}
	if (json['ji_xiong'] != null) {
		data.jiXiong = json['ji_xiong'].toString();
	}
	if (json['sheng_xiao'] != null) {
		data.shengXiao = json['sheng_xiao'].toString();
	}
	if (json['ji_shen'] != null) {
		data.jiShen = json['ji_shen'].toString();
	}
	if (json['xiong_sha'] != null) {
		data.xiongSha = json['xiong_sha'].toString();
	}
	if (json['shi_yi'] != null) {
		data.shiYi = json['shi_yi'].toString();
	}
	if (json['shi_ji'] != null) {
		data.shiJi = json['shi_ji'].toString();
	}
	if (json['wu_xing'] != null) {
		data.wuXing = json['wu_xing'].toString();
	}
	if (json['chong_sha'] != null) {
		data.chongSha = json['chong_sha'].toString();
	}
	if (json['cai_xi'] != null) {
		data.caiXi = json['cai_xi'].toString();
	}
	return data;
}

Map<String, dynamic> timeSubEntityToJson(TimeSubEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['shi_ke'] = entity.shiKe;
	data['shi_gan_zhi'] = entity.shiGanZhi;
	data['ba_zi'] = entity.baZi;
	data['xing_shen'] = entity.xingShen;
	data['zheng_chong'] = entity.zhengChong;
	data['ji_xiong'] = entity.jiXiong;
	data['sheng_xiao'] = entity.shengXiao;
	data['ji_shen'] = entity.jiShen;
	data['xiong_sha'] = entity.xiongSha;
	data['shi_yi'] = entity.shiYi;
	data['shi_ji'] = entity.shiJi;
	data['wu_xing'] = entity.wuXing;
	data['chong_sha'] = entity.chongSha;
	data['cai_xi'] = entity.caiXi;
	return data;
}