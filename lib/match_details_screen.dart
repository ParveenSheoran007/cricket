import 'package:cricket/model_screen/match_info.dart';
import 'package:cricket/model_screen/match_info_screen.dart';
import 'package:cricket/model_screen/string_const.dart';
import 'package:flutter/material.dart';

class MatchDetailScreen extends StatefulWidget {
  const MatchDetailScreen({
    super.key,
    required this.information,
    required this.matchInfo,
  });

  final ScoreInformation? information;
  final MatchInfo matchInfo;

  @override
  State<MatchDetailScreen> createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {
  MatchInfo? matchInfoLisi;
  ScoreInformation? matchInformation;

  @override
  void initState() {
    matchInfoLisi = widget.matchInfo;
    matchInformation = widget.information;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.matchInfo.teamInfo![0].shortname.toString()),
            const SizedBox(width: 10),
            Text(widget.matchInfo.teamInfo![1].shortname.toString()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              StringConst.text3,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 18),
            buildRow(StringConst.text4, widget.matchInfo.matchType.toString()),
            buildRow(StringConst.text5, widget.matchInfo.date.toString()),
            buildRow(StringConst.text6, widget.matchInfo.dateTimeGMT.toString()),
            buildRow(StringConst.text7, widget.matchInfo.venue.toString()),
            const SizedBox(height: 18),
            buildRow(StringConst.text8, widget.information!.hitsToday.toString()),
            buildRow(StringConst.text9, widget.information!.queryTime.toString()),
            buildRow(StringConst.text10, widget.information!.hitsLimit.toString()),
            buildRow(StringConst.text11, widget.information!.cache.toString()),
            buildRow(StringConst.text12, widget.information!.credits.toString()),
            const SizedBox(height: 8),
            buildRow(StringConst.text13, widget.information!.hitsToday.toString()),
            const SizedBox(height: 8),
            buildRow(StringConst.text14, widget.information!.server.toString()),
            const SizedBox(height: 8),
            buildRow(StringConst.text15, widget.information!.totalRows.toString()),
          ],
        ),
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Row(
      children: [
        Text(title, style: TextStyle()),
        const Spacer(),
        Text(value),
      ],
    );
  }
}
