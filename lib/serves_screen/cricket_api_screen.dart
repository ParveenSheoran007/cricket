import 'package:cricket/serves_screen/match_api_service.dart';
import 'package:cricket/serves_screen/match_respons_api.dart';
import 'package:flutter/foundation.dart';


class MatchProvider extends ChangeNotifier {
  MatchApiResponse? matchInfoList;

  Future fetchMatch() async {
    matchInfoList = await MatchApiService.getMatchInformation();
    if (kDebugMode) {
      print(matchInfoList);
    }
    notifyListeners();
  }
}
