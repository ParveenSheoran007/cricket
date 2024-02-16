import 'package:cricket/match_resopns.dart';
import 'package:cricket/match_screen.dart';
import 'package:cricket/provaider_screen/match_provaider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: routesMap,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) {
          return MatchProvider();
        })
      ], child: const MatchInfoScreen()),
    );
  }
}
