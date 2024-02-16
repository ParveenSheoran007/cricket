
import 'package:cricket/model_screen/match_info.dart';
import 'package:cricket/model_screen/match_info_screen.dart';

class MatchApiResponse {
  String? apikey;
  List<MatchInfo>? matchInfoList;
  String? status;
  ScoreInformation? info;

  MatchApiResponse({this.apikey, this.matchInfoList, this.status, this.info});

  MatchApiResponse.fromJson(Map<String, dynamic> json) {
    apikey = json['apikey'];
    if (json['data'] != null) {
      matchInfoList = <MatchInfo>[];
      json['data'].forEach((v) {
        matchInfoList!.add(MatchInfo.fromJson(v));
      });
    }
    status = json['status'];
    info =
        json['info'] != null ? ScoreInformation.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apikey'] = apikey;
    if (matchInfoList != null) {
      data['data'] = matchInfoList!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}
