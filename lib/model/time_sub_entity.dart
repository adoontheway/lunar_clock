import 'package:lunar_clock/generated/json/base/json_convert_content.dart';
import 'package:lunar_clock/generated/json/base/json_field.dart';

class TimeSubEntity with JsonConvert<TimeSubEntity> {
	@JSONField(name: "shi_ke")
	late String shiKe;
	@JSONField(name: "shi_gan_zhi")
	late String shiGanZhi;
	@JSONField(name: "ba_zi")
	late String baZi;
	@JSONField(name: "xing_shen")
	late String xingShen;
	@JSONField(name: "zheng_chong")
	late String zhengChong;
	@JSONField(name: "ji_xiong")
	late String jiXiong;
	@JSONField(name: "sheng_xiao")
	late String shengXiao;
	@JSONField(name: "ji_shen")
	late String jiShen;
	@JSONField(name: "xiong_sha")
	late String xiongSha;
	@JSONField(name: "shi_yi")
	late String shiYi;
	@JSONField(name: "shi_ji")
	late String shiJi;
	@JSONField(name: "wu_xing")
	late String wuXing;
	@JSONField(name: "chong_sha")
	late String chongSha;
	@JSONField(name: "cai_xi")
	late String caiXi;
}
