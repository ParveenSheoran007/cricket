
import 'package:cricket/match_details_screen.dart';
import 'package:cricket/model_screen/match_info.dart';
import 'package:cricket/model_screen/match_info_screen.dart';
import 'package:cricket/serves_screen/match_respons_api.dart';

MatchApiResponse? currentMatches;
MatchInfo? matchInfo;
final routesMap = {
  RoutesConst.matchDetailScreen: (context) {
    return MatchDetailScreen(
        matchInfo: MatchInfo(), information: ScoreInformation());
  }
};

class RoutesConst {
  static const String matchDetailScreen = 'MatchDetailScreen';
}
