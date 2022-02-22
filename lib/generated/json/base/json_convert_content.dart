// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:lunar_clock/model/jieqi_entity.dart';
import 'package:lunar_clock/generated/json/jieqi_entity_helper.dart';
import 'package:lunar_clock/model/time_sub_entity.dart';
import 'package:lunar_clock/generated/json/time_sub_entity_helper.dart';
import 'package:lunar_clock/model/time_entity.dart';
import 'package:lunar_clock/generated/json/time_entity_helper.dart';
import 'package:lunar_clock/model/date_entity.dart';
import 'package:lunar_clock/generated/json/date_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case JieqiEntity:
				return jieqiEntityFromJson(data as JieqiEntity, json) as T;
			case TimeSubEntity:
				return timeSubEntityFromJson(data as TimeSubEntity, json) as T;
			case TimeEntity:
				return timeEntityFromJson(data as TimeEntity, json) as T;
			case DateEntity:
				return dateEntityFromJson(data as DateEntity, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case JieqiEntity:
				return jieqiEntityToJson(data as JieqiEntity);
			case TimeSubEntity:
				return timeSubEntityToJson(data as TimeSubEntity);
			case TimeEntity:
				return timeEntityToJson(data as TimeEntity);
			case DateEntity:
				return dateEntityToJson(data as DateEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (JieqiEntity).toString()){
			return JieqiEntity().fromJson(json);
		}
		if(type == (TimeSubEntity).toString()){
			return TimeSubEntity().fromJson(json);
		}
		if(type == (TimeEntity).toString()){
			return TimeEntity().fromJson(json);
		}
		if(type == (DateEntity).toString()){
			return DateEntity().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<JieqiEntity>[] is M){
			return data.map<JieqiEntity>((e) => JieqiEntity().fromJson(e)).toList() as M;
		}
		if(<TimeSubEntity>[] is M){
			return data.map<TimeSubEntity>((e) => TimeSubEntity().fromJson(e)).toList() as M;
		}
		if(<TimeEntity>[] is M){
			return data.map<TimeEntity>((e) => TimeEntity().fromJson(e)).toList() as M;
		}
		if(<DateEntity>[] is M){
			return data.map<DateEntity>((e) => DateEntity().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}