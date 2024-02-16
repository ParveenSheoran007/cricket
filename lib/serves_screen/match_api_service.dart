import 'dart:convert';
import 'package:cricket/api_end_point.dart';
import 'package:cricket/model_screen/string_const.dart';
import 'package:cricket/serves_screen/match_respons_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class MatchApiService {
  static Future<MatchApiResponse> getMatchInformation() async {
    http.Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      final result = jsonDecode(response.body);
      return MatchApiResponse.fromJson(result);
    } else {
      throw StringConst.apiErrorMsg;
    }
  }
}

