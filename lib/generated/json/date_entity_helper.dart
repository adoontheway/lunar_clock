import 'package:lunar_clock/model/date_entity.dart';

dateEntityFromJson(DateEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id'].toString();
	}
	if (json['day'] != null) {
		data.day = json['day'].toString();
	}
	if (json['nian_zhu'] != null) {
		data.nianZhu = json['nian_zhu'].toString();
	}
	if (json['yue_zhu'] != null) {
		data.yueZhu = json['yue_zhu'].toString();
	}
	if (json['ri_zhu'] != null) {
		data.riZhu = json['ri_zhu'].toString();
	}
	if (json['shi_zhu'] != null) {
		data.shiZhu = json['shi_zhu'].toString();
	}
	if (json['nian_wu_xing'] != null) {
		data.nianWuXing = json['nian_wu_xing'].toString();
	}
	if (json['yue_wu_xing'] != null) {
		data.yueWuXing = json['yue_wu_xing'].toString();
	}
	if (json['ri_wu_xing'] != null) {
		data.riWuXing = json['ri_wu_xing'].toString();
	}
	if (json['shi_wu_xing'] != null) {
		data.shiWuXing = json['shi_wu_xing'].toString();
	}
	if (json['gong_li'] != null) {
		data.gongLi = json['gong_li'].toString();
	}
	if (json['nong_li'] != null) {
		data.nongLi = json['nong_li'].toString();
	}
	if (json['gan_zhi'] != null) {
		data.ganZhi = json['gan_zhi'].toString();
	}
	if (json['sheng_xiao'] != null) {
		data.shengXiao = json['sheng_xiao'].toString();
	}
	if (json['xing_zuo'] != null) {
		data.xingZuo = json['xing_zuo'].toString();
	}
	if (json['xing_xiu'] != null) {
		data.xingXiu = json['xing_xiu'].toString();
	}
	if (json['tan_shen_zhan_fang'] != null) {
		data.tanShenZhanFang = json['tan_shen_zhan_fang'].toString();
	}
	if (json['peng_zu_bai_ji'] != null) {
		data.pengZuBaiJi = json['peng_zu_bai_ji'].toString();
	}
	if (json['chong_sha'] != null) {
		data.chongSha = json['chong_sha'].toString();
	}
	if (json['jie_qi'] != null) {
		data.jieQi = json['jie_qi'].toString();
	}
	if (json['ru_lue_ri'] != null) {
		data.ruLueRi = json['ru_lue_ri'].toString();
	}
	if (json['yi'] != null) {
		data.yi = json['yi'].toString();
	}
	if (json['ji'] != null) {
		data.ji = json['ji'].toString();
	}
	if (json['ji_shen_yi_qu'] != null) {
		data.jiShenYiQu = json['ji_shen_yi_qu'].toString();
	}
	if (json['xiong_shen_yi_ji'] != null) {
		data.xiongShenYiJi = json['xiong_shen_yi_ji'].toString();
	}
	if (json['jie_ri'] != null) {
		data.jieRi = json['jie_ri'].toString();
	}
	if (json['liu_yao'] != null) {
		data.liuYao = json['liu_yao'].toString();
	}
	if (json['shi_er_shen'] != null) {
		data.shiErShen = json['shi_er_shen'].toString();
	}
	if (json['sui_sha'] != null) {
		data.suiSha = json['sui_sha'].toString();
	}
	if (json['yue_sha'] != null) {
		data.yueSha = json['yue_sha'].toString();
	}
	if (json['xi_shen'] != null) {
		data.xiShen = json['xi_shen'].toString();
	}
	if (json['yue_ling'] != null) {
		data.yueLing = json['yue_ling'].toString();
	}
	if (json['fu_shen'] != null) {
		data.fuShen = json['fu_shen'].toString();
	}
	if (json['yue_ming'] != null) {
		data.yueMing = json['yue_ming'].toString();
	}
	if (json['cai_shen'] != null) {
		data.caiShen = json['cai_shen'].toString();
	}
	if (json['wu_hou'] != null) {
		data.wuHou = json['wu_hou'].toString();
	}
	if (json['yang_gui_shen'] != null) {
		data.yangGuiShen = json['yang_gui_shen'].toString();
	}
	if (json['yue_xiangf'] != null) {
		data.yueXiangf = json['yue_xiangf'].toString();
	}
	if (json['zheng_xi'] != null) {
		data.zhengXi = json['zheng_xi'].toString();
	}
	if (json['geng_tian'] != null) {
		data.gengTian = json['geng_tian'].toString();
	}
	if (json['zhi_shui'] != null) {
		data.zhiShui = json['zhi_shui'].toString();
	}
	if (json['de_jin'] != null) {
		data.deJin = json['de_jin'].toString();
	}
	if (json['fen_bing'] != null) {
		data.fenBing = json['fen_bing'].toString();
	}
	if (json['nian_qi_sha'] != null) {
		data.nianQiSha = json['nian_qi_sha'].toString();
	}
	if (json['nian_kong_wang'] != null) {
		data.nianKongWang = json['nian_kong_wang'].toString();
	}
	if (json['nian_san_sha'] != null) {
		data.nianSanSha = json['nian_san_sha'].toString();
	}
	if (json['yue_qi_sha'] != null) {
		data.yueQiSha = json['yue_qi_sha'].toString();
	}
	if (json['yue_kong_wang'] != null) {
		data.yueKongWang = json['yue_kong_wang'].toString();
	}
	if (json['yue_san_sha'] != null) {
		data.yueSanSha = json['yue_san_sha'].toString();
	}
	if (json['ri_qi_sha'] != null) {
		data.riQiSha = json['ri_qi_sha'].toString();
	}
	if (json['ri_kong_wang'] != null) {
		data.riKongWang = json['ri_kong_wang'].toString();
	}
	if (json['ri_san_sha'] != null) {
		data.riSanSha = json['ri_san_sha'].toString();
	}
	if (json['ri_lu'] != null) {
		data.riLu = json['ri_lu'].toString();
	}
	if (json['jiu_xing'] != null) {
		data.jiuXing = json['jiu_xing'].toString();
	}
	if (json['er_ba_xing_xiu'] != null) {
		data.erBaXingXiu = json['er_ba_xing_xiu'].toString();
	}
	if (json['he_tu_luo_shu'] != null) {
		data.heTuLuoShu = json['he_tu_luo_shu'].toString();
	}
	if (json['di_mu_jing'] != null) {
		data.diMuJing = json['di_mu_jing'].toString();
	}
	return data;
}

Map<String, dynamic> dateEntityToJson(DateEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['day'] = entity.day;
	data['nian_zhu'] = entity.nianZhu;
	data['yue_zhu'] = entity.yueZhu;
	data['ri_zhu'] = entity.riZhu;
	data['shi_zhu'] = entity.shiZhu;
	data['nian_wu_xing'] = entity.nianWuXing;
	data['yue_wu_xing'] = entity.yueWuXing;
	data['ri_wu_xing'] = entity.riWuXing;
	data['shi_wu_xing'] = entity.shiWuXing;
	data['gong_li'] = entity.gongLi;
	data['nong_li'] = entity.nongLi;
	data['gan_zhi'] = entity.ganZhi;
	data['sheng_xiao'] = entity.shengXiao;
	data['xing_zuo'] = entity.xingZuo;
	data['xing_xiu'] = entity.xingXiu;
	data['tan_shen_zhan_fang'] = entity.tanShenZhanFang;
	data['peng_zu_bai_ji'] = entity.pengZuBaiJi;
	data['chong_sha'] = entity.chongSha;
	data['jie_qi'] = entity.jieQi;
	data['ru_lue_ri'] = entity.ruLueRi;
	data['yi'] = entity.yi;
	data['ji'] = entity.ji;
	data['ji_shen_yi_qu'] = entity.jiShenYiQu;
	data['xiong_shen_yi_ji'] = entity.xiongShenYiJi;
	data['jie_ri'] = entity.jieRi;
	data['liu_yao'] = entity.liuYao;
	data['shi_er_shen'] = entity.shiErShen;
	data['sui_sha'] = entity.suiSha;
	data['yue_sha'] = entity.yueSha;
	data['xi_shen'] = entity.xiShen;
	data['yue_ling'] = entity.yueLing;
	data['fu_shen'] = entity.fuShen;
	data['yue_ming'] = entity.yueMing;
	data['cai_shen'] = entity.caiShen;
	data['wu_hou'] = entity.wuHou;
	data['yang_gui_shen'] = entity.yangGuiShen;
	data['yue_xiangf'] = entity.yueXiangf;
	data['zheng_xi'] = entity.zhengXi;
	data['geng_tian'] = entity.gengTian;
	data['zhi_shui'] = entity.zhiShui;
	data['de_jin'] = entity.deJin;
	data['fen_bing'] = entity.fenBing;
	data['nian_qi_sha'] = entity.nianQiSha;
	data['nian_kong_wang'] = entity.nianKongWang;
	data['nian_san_sha'] = entity.nianSanSha;
	data['yue_qi_sha'] = entity.yueQiSha;
	data['yue_kong_wang'] = entity.yueKongWang;
	data['yue_san_sha'] = entity.yueSanSha;
	data['ri_qi_sha'] = entity.riQiSha;
	data['ri_kong_wang'] = entity.riKongWang;
	data['ri_san_sha'] = entity.riSanSha;
	data['ri_lu'] = entity.riLu;
	data['jiu_xing'] = entity.jiuXing;
	data['er_ba_xing_xiu'] = entity.erBaXingXiu;
	data['he_tu_luo_shu'] = entity.heTuLuoShu;
	data['di_mu_jing'] = entity.diMuJing;
	return data;
}