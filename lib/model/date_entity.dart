import 'package:lunar_clock/generated/json/base/json_convert_content.dart';
import 'package:lunar_clock/generated/json/base/json_field.dart';

class DateEntity with JsonConvert<DateEntity> {
	@JSONField(name: "_id")
	late String sId;
	late String day;
	@JSONField(name: "nian_zhu")
	late String nianZhu;
	@JSONField(name: "yue_zhu")
	late String yueZhu;
	@JSONField(name: "ri_zhu")
	late String riZhu;
	@JSONField(name: "shi_zhu")
	late String shiZhu;
	@JSONField(name: "nian_wu_xing")
	late String nianWuXing;
	@JSONField(name: "yue_wu_xing")
	late String yueWuXing;
	@JSONField(name: "ri_wu_xing")
	late String riWuXing;
	@JSONField(name: "shi_wu_xing")
	late String shiWuXing;
	@JSONField(name: "gong_li")
	late String gongLi;
	@JSONField(name: "nong_li")
	late String nongLi;
	@JSONField(name: "gan_zhi")
	late String ganZhi;
	@JSONField(name: "sheng_xiao")
	late String shengXiao;
	@JSONField(name: "xing_zuo")
	late String xingZuo;
	@JSONField(name: "xing_xiu")
	late String xingXiu;
	@JSONField(name: "tan_shen_zhan_fang")
	late String tanShenZhanFang;
	@JSONField(name: "peng_zu_bai_ji")
	late String pengZuBaiJi;
	@JSONField(name: "chong_sha")
	late String chongSha;
	@JSONField(name: "jie_qi")
	late String jieQi;
	@JSONField(name: "ru_lue_ri")
	late String ruLueRi;
	late String yi;
	late String ji;
	@JSONField(name: "ji_shen_yi_qu")
	late String jiShenYiQu;
	@JSONField(name: "xiong_shen_yi_ji")
	late String xiongShenYiJi;
	@JSONField(name: "jie_ri")
	late String jieRi;
	@JSONField(name: "liu_yao")
	late String liuYao;
	@JSONField(name: "shi_er_shen")
	late String shiErShen;
	@JSONField(name: "sui_sha")
	late String suiSha;
	@JSONField(name: "yue_sha")
	late String yueSha;
	@JSONField(name: "xi_shen")
	late String xiShen;
	@JSONField(name: "yue_ling")
	late String yueLing;
	@JSONField(name: "fu_shen")
	late String fuShen;
	@JSONField(name: "yue_ming")
	late String yueMing;
	@JSONField(name: "cai_shen")
	late String caiShen;
	@JSONField(name: "wu_hou")
	late String wuHou;
	@JSONField(name: "yang_gui_shen")
	late String yangGuiShen;
	@JSONField(name: "yue_xiangf")
	late String yueXiangf;
	@JSONField(name: "zheng_xi")
	late String zhengXi;
	@JSONField(name: "geng_tian")
	late String gengTian;
	@JSONField(name: "zhi_shui")
	late String zhiShui;
	@JSONField(name: "de_jin")
	late String deJin;
	@JSONField(name: "fen_bing")
	late String fenBing;
	@JSONField(name: "nian_qi_sha")
	late String nianQiSha;
	@JSONField(name: "nian_kong_wang")
	late String nianKongWang;
	@JSONField(name: "nian_san_sha")
	late String nianSanSha;
	@JSONField(name: "yue_qi_sha")
	late String yueQiSha;
	@JSONField(name: "yue_kong_wang")
	late String yueKongWang;
	@JSONField(name: "yue_san_sha")
	late String yueSanSha;
	@JSONField(name: "ri_qi_sha")
	late String riQiSha;
	@JSONField(name: "ri_kong_wang")
	late String riKongWang;
	@JSONField(name: "ri_san_sha")
	late String riSanSha;
	@JSONField(name: "ri_lu")
	late String riLu;
	@JSONField(name: "jiu_xing")
	late String jiuXing;
	@JSONField(name: "er_ba_xing_xiu")
	late String erBaXingXiu;
	@JSONField(name: "he_tu_luo_shu")
	late String heTuLuoShu;
	@JSONField(name: "di_mu_jing")
	late String diMuJing;
}
