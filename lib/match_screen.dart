import 'package:cricket/match_details_screen.dart';
import 'package:cricket/model_screen/string_const.dart';
import 'package:cricket/provaider_screen/match_provaider.dart';
import 'package:cricket/serves_screen/match_api_service.dart';
import 'package:cricket/serves_screen/match_respons_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchInfoScreen extends StatefulWidget {
  const MatchInfoScreen({super.key});

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  late MatchApiService matchApiService;
  MatchApiResponse? matchApiResponse;
  MatchProvider matchProvider = MatchProvider();

  @override
  void initState() {
    matchProvider = Provider.of<MatchProvider>(context, listen: false);
    getMatchInformation();
    fetchMatch();
    super.initState();
  }

  Future<void> fetchMatch() async {
    await matchProvider.fetchMatch();
  }

  getMatchInformation() async {
    matchApiResponse = await MatchApiService.getMatchInformation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst.appText,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  StringConst.appText,
                  style: TextStyle(
                      color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  width: 130,
                ),
                Text(
                  StringConst.appText2,
                  style: TextStyle(
                      color: Colors.black, fontSize: 15),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.cyan,
        toolbarHeight: 100,
      ),
      body: Consumer<MatchProvider>(builder: (
        child,
        provider,
        context,
      ) {
        return ListView.builder(
          itemCount: provider.matchInfoList?.matchInfoList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            var matchInfo = provider.matchInfoList?.matchInfoList?[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MatchDetailScreen(
                      matchInfo: matchInfo,
                      information: matchApiResponse!.info,
                    );
                  }));
                },
                child: Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider.matchInfoList!.matchInfoList!.first.date
                            .toString()),
                        Text(provider.matchInfoList!.matchInfoList!.first.name
                            .toString()),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.network(
                              matchInfo!.teamInfo![0].img.toString(),
                              height: 50,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(matchInfo.teamInfo![0].shortname.toString()),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.network(
                              matchInfo.teamInfo![1].img.toString(),
                              height: 50,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(matchInfo.teamInfo![1].shortname.toString()),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(matchInfo.status.toString()),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(StringConst.text),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(StringConst.text2),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
